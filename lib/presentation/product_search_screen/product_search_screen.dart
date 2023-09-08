import '../product_search_screen/widgets/list1_item_widget.dart';
import 'bloc/product_search_bloc.dart';
import 'models/list1_item_model.dart';
import 'models/product_search_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';

class ProductSearchScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ProductSearchBloc>(
      create: (context) => ProductSearchBloc(ProductSearchState(
        productSearchModelObj: ProductSearchModel(),
      ))
        ..add(ProductSearchInitialEvent()),
      child: ProductSearchScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,

        // topbar
        appBar: CustomAppBar(
          height: getVerticalSize(
            43,
          ),
          leadingWidth: 32,
          leading: AppbarImage(
            height: getVerticalSize(
              16,
            ),
            width: getHorizontalSize(
              20,
            ),
            svgPath: ImageConstant.imgMenuBlack900,
            margin: getMargin(
              left: 12,
              top: 1,
              bottom: 5,
            ),
            onTap: () {
              NavigatorService.navigatorKey.currentState!
                  .pushNamed(AppRoutes.appNavigationScreen);
            },
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "Dilkara".tr,
            onTap: () {
              NavigatorService.navigatorKey.currentState!
                  .pushNamed(AppRoutes.mainLandingScreen);
            },
          ),
          actions: [
            AppbarImage(
              height: getSize(
                15,
              ),
              width: getSize(
                15,
              ),
              svgPath: ImageConstant.imgSearchGray90001,
              margin: getMargin(
                left: 16,
                top: 1,
                right: 5,
                bottom: 1,
              ),
              onTap: () {
                NavigatorService.navigatorKey.currentState!
                    .pushNamed(AppRoutes.productSearchScreen);
              },
            ),
            AppbarImage(
              height: getVerticalSize(
                17,
              ),
              width: getHorizontalSize(
                18,
              ),
              svgPath: ImageConstant.imgCart,
              margin: getMargin(
                left: 10,
                right: 5,
              ),
              onTap: () {
                NavigatorService.navigatorKey.currentState!
                    .pushNamed(AppRoutes.cartScreen);
              },
            ),
            AppbarImage(
              height: getVerticalSize(
                15,
              ),
              width: getHorizontalSize(
                13,
              ),
              svgPath: ImageConstant.imgUser,
              margin: getMargin(
                left: 10,
                top: 1,
                right: 21,
                bottom: 1,
              ),
              onTap: () {
                NavigatorService.navigatorKey.currentState!
                    .pushNamed(AppRoutes.profileProfileInfoTabContainerScreen);
              },
            ),
          ],
        ),

        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 11,
            top: 24,
            right: 11,
            bottom: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocSelector<ProductSearchBloc, ProductSearchState,
                  TextEditingController?>(
                selector: (state) => state.group5609Controller,
                builder: (context, group5609Controller) {
                  return CustomSearchView(
                    focusNode: FocusNode(),
                    controller: group5609Controller,
                    hintText: "lbl_sl_iders".tr.toUpperCase(),
                    prefix: Container(
                      margin: getMargin(
                        left: 10,
                        top: 18,
                        right: 6,
                        bottom: 18,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        56,
                      ),
                    ),
                    suffix: Container(
                      margin: getMargin(
                        left: 30,
                        top: 19,
                        right: 10,
                        bottom: 17,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgClose,
                        onTap: () => group5609Controller?.clear(),
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        56,
                      ),
                    ),
                  );
                },
              ),
              // Padding(
              //   padding: getPadding(
              //     left: 5,
              //     top: 29,
              //     right: 5,
              //   ),
              //   child: BlocSelector<ProductSearchBloc, ProductSearchState,
              //       ProductSearchModel?>(
              //     selector: (state) => state.productSearchModelObj,
              //     builder: (context, productSearchModelObj) {
              //       return GridView.builder(
              //         shrinkWrap: true,
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           mainAxisExtent: getVerticalSize(
              //             199,
              //           ),
              //           crossAxisCount: 2,
              //           mainAxisSpacing: getHorizontalSize(
              //             16,
              //           ),
              //           crossAxisSpacing: getHorizontalSize(
              //             16,
              //           ),
              //         ),
              //         physics: NeverScrollableScrollPhysics(),
              //         itemCount:
              //             productSearchModelObj?.list1ItemList.length ?? 0,
              //         itemBuilder: (context, index) {
              //           List1ItemModel model =
              //               productSearchModelObj?.list1ItemList[index] ??
              //                   List1ItemModel();
              //           return List1ItemWidget(
              //             model,
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
            ], // Children
          ),
        ),
      ),
    );
  }
}
