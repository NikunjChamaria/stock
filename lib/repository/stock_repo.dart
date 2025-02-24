import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks/model/stock_model.dart';
import 'package:stocks/screens/login_screen.dart';
import '../api/constants.dart';

class StockRepository {
  final Dio _dio = Dio();

  Future<String?> _getValidToken() async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString("jwt");

    if (jwt == null) return null;

    if (JwtDecoder.isExpired(jwt)) {
      await prefs.remove("jwt");
      Get.offAll(() => const LoginScreen());
      return null;
    }

    return jwt;
  }

  Future<List<StockModel>> searchStocks(String query) async {
    try {
      query = query.trim();
      if (query == "") {
        return [];
      }
      final jwt = await _getValidToken();
      if (jwt == null) return [];

      final response = await _dio.get(searchStocksEndpoint,
          queryParameters: {"query": query},
          options: Options(headers: {"Authorization": "Bearer $jwt"}));

      return (response.data as List)
          .map((json) => StockModel.fromJson(json))
          .toList();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong when fetchung the results",
          backgroundColor: Colors.red);
      rethrow;
    }
  }

  Future<StockModel?> getStockById(int id) async {
    final jwt = await _getValidToken();
    if (jwt == null) return null;

    final response = await _dio.get("$stockByIdEndpoint/$id",
        options: Options(headers: {"Authorization": "Bearer $jwt"}));

    return StockModel.fromJson(response.data);
  }
}
