import 'dart:convert';

import 'package:dilkara/services/category.dart';
// import 'package:oauth1/oauth1.dart';
import 'package:http/http.dart' as http;

// final apiService = WooCommerceService(signatureMethod, credentials, apiUrl);
class WooCommerceService {
  final apiUrl = "https://dilkara.com.au/wc-api/v3";
  final consumerKey = "ck_5548abde185d8a83fa7781e7c6bce5459f52616c";
  final consumerSecret = "cs_6ae6830cba04c992ed7bf63ed36f5d1015661015";

  Future<dynamic> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://dilkara.com.au/wc-api/v3/products?per_page=66"),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<dynamic> fetchCategories() async {
    // List<Category> categories = [];

    final response = await http.get(
      Uri.parse(
          "https://dilkara.com.au/wc-api/v3/products/categories?per_page=66"),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}',
      },
    );

    if (response.statusCode == 200) {
      // categories = (json.decode(response.body) as List)
      //     .map((i) => Category.fromJson(i))
      //     .toList();
      print('i am fetching categories');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
