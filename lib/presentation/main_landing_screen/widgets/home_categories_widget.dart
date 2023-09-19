import 'package:dilkara/services/category.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/services/woocommerce_service.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({Key? key}) : super(key: key);

  @override
  State<WidgetCategories> createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  late WooCommerceService apiService;

  @override
  void initState() {
    super.initState();
    // apiService = new WooCommerceService();
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ],
        )
      ]),
    );
  }

  Widget _categoryList() {
    return FutureBuilder(
      future: apiService.fetchCategories(), //fetchAndParseProducts(),
      builder: (context, snapshot) => snapshot.hasData
          ? _buildCategoryList(snapshot.data as List<Category>)
          : Center(child: CircularProgressIndicator()),
      // builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      //   if (snapshot.hasData) {
      //     List<Category> categories = snapshot.data!
      //         .map((dynamic item) => Category.fromJson(item))
      //         .toList();
      //     return _buildCategoryList(categories);
      //   } else {
      //     return Center(child: CircularProgressIndicator());
      //   }
      // },
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
                child: Image.network(
                  data.categoryImage.toString(),
                  height: 80,
                ),
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
