import 'package:dilkara/services/category.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/services/woocommerce_service.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({Key? key}) : super(key: key);

  @override
  State<WidgetCategories> createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 10, top: 4),
                child: Text(
                  'All Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: EdgeInsets.only(left: 10, top: 4),
                child: Text(
                  'View All',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                )),
          ],
        ),
        _buildCategoryList(await fetchAndParseCategories())
      ]),
    );
  }

  Future<List<Category>> fetchAndParseCategories() async {
    final response = await WooCommerceService().fetchCategories();

    List<Category> data = [];

    if (response.isNotEmpty) {
      // Handle the map structure here and extract the list of products
      data.addAll(response);
      // final productList = response['products'] as List<Category>;
      return data;
    } else {
      // Handle the case where the response is not as expected
      throw Exception('Unexpected API response format');
    }
  }

  // Widget _categoryList() {
  //   return FutureBuilder(
  //     future: WooCommerceService().fetchCategories(),
  //     builder: (BuildContext context, snapshot) {
  //       print(snapshot);
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         print('it has error');
  //         return Text('Error: ${snapshot.error}');
  //       } else {
  //         final categorylist = snapshot.data as List<Category>;
  //         print('asdasdsadsadsadddddddddd');
  //         print(categorylist);
  //         return _buildCategoryList(categorylist);
  //       }
  //     },
  //   );
  // }

  Widget _buildCategoryList(List<Category> categories) {
    return Container(
      height: 150,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var data = categories[index];
          return Column(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                // child: Image.network(
                //   data.categoryImage.toString(),
                //   height: 80,
                // ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 5),
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(data.categoryName.toString()),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
