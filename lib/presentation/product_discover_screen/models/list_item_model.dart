// class ListItemModel {
//   late int id;
//   late String nameTxt;
//   late String priceTxt;
//   List<Categories>? categories;
//   List<Images>? images;

//   ListItemModel(
//       {required this.id,
//       required this.nameTxt,
//       required this.priceTxt,
//       this.categories,
//       this.images});

//   ListItemModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameTxt = json['name'];
//     priceTxt = json['price'];
//     if (json['categories'] != null) {
//       categories = <Categories>[];
//       json['categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//   }
// }

// class Images {
//   int? id;
//   String? src;

//   Images({this.id, this.src});

//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     src = json['src'];
//   }

//   Map<String?, dynamic> toJson() {
//     final Map<String?, dynamic> data = new Map<String?, dynamic>();
//     data['id'] = this.id;
//     data['src'] = this.src;
//     return data;
//   }
// }

// class Categories {
//   int? id;
//   String? name;

//   Categories({this.id, this.name});

//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String?, dynamic> toJson() {
//     final Map<String?, dynamic> data = new Map<String?, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

class ListItemModel {
  String nameTxt = "Pull&Bear Exclusive Petite elasticated waist";

  String priceTxt = " 13.99";

  String? id = "";
}
