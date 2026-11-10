# Módulo de compute para la aplicación de pedidos
# Superficie de práctica: definir instancias, clusters, funciones serverless para la API

# Variable para los ARNs de los target groups
variable "target_group_arns" {
  type        = list(string)
  description = "ARNs de los target groups para el Auto Scaling Group"
  default     = []
}

# Launch template para Auto Scaling Group
resource "aws_launch_template" "api_lt" {
  name_prefix   = "${var.project_name}-api-lt-${var.environment}-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = base64encode(var.user_data)

  vpc_security_group_ids = var.security_group_ids

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = "${var.project_name}-api-${var.environment}"
    })
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "api_asg" {
  name                      = "${var.project_name}-api-asg-${var.environment}"
  vpc_zone_identifier       = var.public_subnet_ids
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.api_lt.id
    version = "$Latest"
  }

  target_group_arns = var.target_group_arns

  tag {
    key                 = "Name"
    value               = "${var.project_name}-api-${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project_name
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Scaling policies
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.project_name}-scale-up-${var.environment}"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.api_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.project_name}-scale-down-${var.environment}"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.api_asg.name
}

# CloudWatch metric alarm for scale up
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.project_name}-cpu-high-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This metric monitors CPU utilization for ASG scale up"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.api_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
  ok_actions    = [aws_autoscaling_policy.scale_down.arn]
}

# CloudWatch metric alarm for scale down
resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.project_name}-cpu-low-${var.environment}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"
  alarm_description   = "This metric monitors CPU utilization for ASG scale down"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.api_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_down.arn]
}

# IAM role para las instancias
resource "aws_iam_role" "api_instance_role" {
  name = "${var.project_name}-api-instance-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Policy para SSM
resource "aws_iam_role_policy_attachment" "ssm_managed" {
  role       = aws_iam_role.api_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Policy para CloudWatch
resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
  role       = aws_iam_role.api_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# Instance profile
resource "aws_iam_instance_profile" "api_instance_profile" {
  name = "${var.project_name}-api-instance-profile-${var.environment}"
  role = aws_iam_role.api_instance_role.name

  lifecycle {
    create_before_destroy = true
  }
}