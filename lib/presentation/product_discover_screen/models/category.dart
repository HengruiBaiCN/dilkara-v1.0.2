class Category {
  int? categoryId;
  String? categoryName;
  String? categoryDescription;
  int? parentCategoryId;
  String? categoryImage;
  // Image categoryImage;

  Category({
    this.categoryId,
    this.categoryDescription,
    this.categoryName,
    this.categoryImage,
    this.parentCategoryId,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'];
    categoryDescription = json['description'];
    categoryName = json['name'];
    parentCategoryId = json['parent'];
    categoryImage = json['image'];
    // categoryImage = (json['image'] != null ? new Image.fromJson(json['image']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = categoryId;
    data['description'] = categoryDescription;
    data['name'] = categoryName;
    data['parent'] = parentCategoryId;
    data['image'] = categoryImage;
    // if (this.categoryImage != null) {
    //   data['image'] = this.categoryImage.toJson();
    // }
    return data;
  }
}

// class Image {
//   String src;

//   Image({required this.src});

//   Image.fromJson(Map<String, dynamic> json) {
//     src = json['src'];
//   }
// }


