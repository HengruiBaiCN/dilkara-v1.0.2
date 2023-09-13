import 'dart:convert';

import 'package:http/http.dart' as http;
import 'woocommerce_service.dart';

class ProductService {
  final WooCommerceService wooCommerceService;

  ProductService(this.wooCommerceService);

  Future<List<dynamic>> fetchProducts() async {
    final oauth1Client = wooCommerceService.createOAuthClient();

    final response = await oauth1Client.get(
      "products" as Uri, // WooCommerce products endpoint
    );

    if (response.statusCode == 200) {
      // Parse and return the product data
      final List<dynamic> products = json.decode(response.body);
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
