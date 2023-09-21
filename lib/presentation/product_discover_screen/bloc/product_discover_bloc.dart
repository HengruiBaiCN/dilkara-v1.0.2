// import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/list_item_model.dart';
import 'package:dilkara/presentation/product_discover_screen/models/product_discover_model.dart';
// import 'package:dilkara/services/woocommerce_service.dart';
part 'product_discover_event.dart';
part 'product_discover_state.dart';

// class ProductDiscoverBloc
//     extends Bloc<ProductDiscoverEvent, ProductDiscoverState> {

//       ProductDiscoverBloc(ProductDiscoverState initialState) : super(initialState) {
//         on<ProductDiscoverInitialEvent>(_onInitialize);
//       }
//   }

//   _onInitialize(
//     ProductDiscoverInitialEvent event,
//     Emitter<ProductDiscoverState> emit,
//   ) async {
//     emit(state.copyWith(
//         productDiscoverModelObj: state.productDiscoverModelObj
//             ?.copyWith(listItemList: fillListItemList())));
//   }

//   List<ListItemModel> fillListItemList() {

//     List<ListItemModel> listItemList = [];

//     for (int i = 0; i < 10; i++) {
//       listItemList.add(ListItemModel(
//           image: ImageConstant.img25326b4294154be2a5c5f0d7c083e855,
//           title: "Title",
//           subTitle: "SubTitle",
//           price: "Price",
//           onTap: () {}));
//     }
//   }

class ProductDiscoverBloc
    extends Bloc<ProductDiscoverEvent, ProductDiscoverState> {
  ProductDiscoverBloc(ProductDiscoverState initialState) : super(initialState) {
    on<ProductDiscoverInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProductDiscoverInitialEvent event,
    Emitter<ProductDiscoverState> emit,
  ) async {
    emit(state.copyWith(
        productDiscoverModelObj: state.productDiscoverModelObj
            ?.copyWith(listItemList: fillListItemList())));
  }

  List<ListItemModel> fillListItemList() {
    List<ListItemModel> listItemList = [];

    for (int i = 0; i < 10; i++) {
      listItemList.add(ListItemModel(
        id: i,
        nameTxt: "Title",
        priceTxt: "Price",
        // images: ,
        // categories: 'Category',
      ));
    }
    return listItemList;
  }
}
