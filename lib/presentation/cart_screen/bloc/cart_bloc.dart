import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/cart_item_model.dart';
import 'package:dilkara/presentation/cart_screen/models/cart_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initialState) : super(initialState) {
    on<CartInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(
        cartModelObj: state.cartModelObj?.copyWith(
      cartItemList: fillCartItemList(),
    )));
  }

  List<CartItemModel> fillCartItemList() {
    return List.generate(2, (index) => CartItemModel());
  }
}
