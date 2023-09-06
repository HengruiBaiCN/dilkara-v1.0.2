import 'dart:convert';

import 'package:http/http.dart' as http;
import 'woocommerce_service.dart';

class ProductService {
  final WooCommerceService wooCommerceService;

  ProductService(this.wooCommerceService);

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(
        "http://your-woocommerce-site.com/wc-api/v3/products", // WooCommerce products endpoint
      ),
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
