import 'dart:convert';

import 'package:oauth1/oauth1.dart';
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
    final response = await http.get(
      Uri.parse("https://dilkara.com.au/wc-api/v3/categories"),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> categories = json.decode(response.body);
      return categories;
    } else {
      throw Exception('Failed to load products');
    }
  }

  // var signatureMethod = SignatureMethods.hmacSha1;
  // final credentials = new ClientCredentials(
  //   "ck_5548abde185d8a83fa7781e7c6bce5459f52616c",
  //   "cs_6ae6830cba04c992ed7bf63ed36f5d1015661015",
  // );

  // WooCommerceService(this.signatureMethod, credentials, apiUrl);

  // Client createOAuthClient() {
  //   return Client(
  //     signatureMethod,
  //     credentials,
  //     "apiUrl" as Credentials,
  //   );
  // }

  // Future<List<dynamic>> fetchProducts() async {
  //   final oauth1Client = createOAuthClient();

  //   final response = await oauth1Client.get(
  //     "products" as Uri, // WooCommerce products endpoint
  //     headers: {
  //       "Accept": "application/json",
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // Parse and return the product data
  //     final List<dynamic> products = json.decode(response.body);
  //     return products;
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  // }

  // Future<List<dynamic>> getCategories() async {
  //   final oauth1Client = createOAuthClient();

  //   final response = await oauth1Client.get(
  //     "categories" as Uri, // WooCommerce products endpoint
  //     headers: {
  //       "Accept": "application/json",
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // Parse and return the product data
  //     final List<dynamic> products = json.decode(response.body);
  //     return products;
  //   } else {
  //     throw Exception('Failed to load categories');
  //   }
  // }
}
