// import 'dart:html';

// import '../product_discover_screen/widgets/list_item_widget.dart';
import 'bloc/product_discover_bloc.dart';
import 'models/list_item_model.dart';
import 'models/product_discover_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
// import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/services/woocommerce_service.dart';

class ProductDiscoverScreen extends StatefulWidget {
  // final WooCommerceService apiService;

  // ProductDiscoverScreen(this.apiService);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProductDiscoverBloc>(
      create: (context) => ProductDiscoverBloc(ProductDiscoverState(
        productDiscoverModelObj: ProductDiscoverModel(),
      ))
        ..add(ProductDiscoverInitialEvent()),
      child: ProductDiscoverScreen(),
    );
  }

  @override
  _ProductDiscoverScreenState createState() => _ProductDiscoverScreenState();
}

class _ProductDiscoverScreenState extends State {
  late Future<List<Map<String, dynamic>>> products;
  // late WooCommerceService apiService;

  @override
  void initState() {
    super.initState();
    products = fetchAndParseProducts();
    // apiService = WooCommerceService();
  }

  Future<List<Map<String, dynamic>>> fetchAndParseProducts() async {
    final response = await WooCommerceService().fetchProducts();

    if (response is Map<String, dynamic> && response.containsKey('products')) {
      // Handle the map structure here and extract the list of products
      final productList = response['products'] as List<dynamic>;
      return productList.cast<Map<String, dynamic>>().toList();
    } else {
      // Handle the case where the response is not as expected
      throw Exception('Unexpected API response format');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
          height: getVerticalSize(56),
          leadingWidth: 40,
          leading: AppbarImage(
              height: getSize(24),
              width: getSize(24),
              svgPath: ImageConstant.img25326b4294154be2a5c5f0d7c083e855,
              margin: getMargin(left: 16, top: 15, bottom: 16),
              onTap: () {
                onTapArrowleft(context);
              }),
          centerTitle: true,
          body: Padding(
            padding: getPadding(left: 16, top: 5, right: 16),
          )),
      body: FutureBuilder<dynamic>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final productList = snapshot.data as List<dynamic>;
            return GridView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                final productName = product['title'] as String?;
                return ListTile(
                  title: Text(productName ?? 'No Name'),
                  subtitle: Text('\$${product['price'] ?? '0.00'}'),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
            );
          }
        },
      ),
    ));
  }

  onTapArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }
}
