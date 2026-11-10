import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final http.Client _client;
  final String? authToken;

  ApiClient({required this.baseUrl, http.Client? client, this.authToken}) : _client = client ?? http.Client();

  Future<List<Map<String, dynamic>>> fetchOrders() async {
    try {
      final headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        if (authToken != null) HttpHeaders.authorizationHeader: 'Bearer $authToken',
      };

      final response = await _client.get(
        Uri.parse('$baseUrl/api/orders'),
        headers: headers,
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((order) => order as Map<String, dynamic>).toList();
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('Token de autenticación inválido');
      } else if (response.statusCode == 404) {
        throw NotFoundException('Endpoint no encontrado');
      } else {
        throw ApiException('Error al obtener pedidos: ${response.statusCode}');
      }
    } on TimeoutException {
      throw NetworkException('Tiempo de espera agotado');
    } on SocketException {
      throw NetworkException('Sin conexión a internet');
    } on FormatException {
      throw ApiException('Respuesta inválida del servidor');
    } on http.ClientException {
      throw NetworkException('Error en la conexión con el servidor');
    }
  }

  void close() {
    _client.close();
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);

  @override
  String toString() => 'NotFoundException: $message';
}