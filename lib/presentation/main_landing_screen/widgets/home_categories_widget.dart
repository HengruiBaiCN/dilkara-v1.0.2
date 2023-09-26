import 'package:dilkara/services/category.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/services/woocommerce_service.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({Key? key}) : super(key: key);

  @override
  State<WidgetCategories> createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  late Future<List<Map<String, dynamic>>> categories;

  @override
  void initState() {
    super.initState();
    categories = fetchAndParseCategories();
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
        FutureBuilder<dynamic>(
          future: categories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final categoryList = snapshot.data;
              return ListView.builder(
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  final category = categoryList[index];
                  final categoryName = category['name'] as String?;
                  return ListTile(
                    title: Text(categoryName ?? 'No Name'),
                    subtitle: Text('\$${category['id'] ?? '0.00'}'),
                  );
                },
              );
            }
          },
        ),
        // _categoryList()
      ]),
    );
  }

  Future<List<Map<String, dynamic>>> fetchAndParseCategories() async {
    final response = await WooCommerceService().fetchCategories();

    // List<Category> data = [];

    if (response is Map<String, dynamic>) {
      // Handle the map structure here and extract the list of products
      // data.addAll(response);
      print('response has categories ${response}');
      final categoryList = response as List<dynamic>;
      return categoryList.cast<Map<String, dynamic>>().toList();
    } else {
      // Handle the case where the response is not as expected
      print('response does not have categories');
      throw Exception('Unexpected API response format');
    }
  }

  Widget _categoryList() {
    print('entering category list');
    return FutureBuilder<dynamic>(
      future: categories,
      builder: (BuildContext context, snapshot) {
        print('snapshot');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print('it has error ${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        } else {
          print('asdasdsadsadsadddddddddd');
          final categorylist = snapshot.data;
          print(categorylist);
          return _buildCategoryList(categorylist);
        }
      },
    );
  }

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
