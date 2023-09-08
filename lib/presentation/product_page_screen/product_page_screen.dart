import '../product_page_screen/widgets/sliderrectangleeleven_item_widget.dart';
import 'bloc/product_page_bloc.dart';
import 'models/product_page_model.dart';
import 'models/sliderrectangleeleven_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPageScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ProductPageBloc>(
        create: (context) => ProductPageBloc(
            ProductPageState(productPageModelObj: ProductPageModel()))
          ..add(ProductPageInitialEvent()),
        child: ProductPageScreen());
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
                    height: getVerticalSize(22),
                    width: getHorizontalSize(24),
                    svgPath: ImageConstant.imgArrowleftGray90001,
                    margin: getMargin(left: 16, top: 12, bottom: 21),
                    onTap: () {
                      onTapArrowleft2(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(
                  text: "lbl_shopsie".tr,
                  onTap: () {
                    NavigatorService.navigatorKey.currentState!
                        .pushNamed(AppRoutes.appNavigationScreen);
                  },
                )),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 6, bottom: 6),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BlocBuilder<ProductPageBloc, ProductPageState>(
                          builder: (context, state) {
                        return CarouselSlider.builder(
                            options: CarouselOptions(
                                height: getVerticalSize(289),
                                initialPage: 0,
                                autoPlay: true,
                                viewportFraction: 1.0,
                                enableInfiniteScroll: false,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  state.silderIndex = index;
                                }),
                            itemCount: state.productPageModelObj
                                    ?.sliderrectangleelevenItemList.length ??
                                0,
                            itemBuilder: (context, index, realIndex) {
                              SliderrectangleelevenItemModel model = state
                                      .productPageModelObj
                                      ?.sliderrectangleelevenItemList[index] ??
                                  SliderrectangleelevenItemModel();
                              return SliderrectangleelevenItemWidget(model);
                            });
                      }),
                      Align(
                          alignment: Alignment.center,
                          child: BlocBuilder<ProductPageBloc, ProductPageState>(
                              builder: (context, state) {
                            return Container(
                                height: getVerticalSize(4),
                                margin: getMargin(top: 21),
                                child: AnimatedSmoothIndicator(
                                    activeIndex: state.silderIndex,
                                    count: state
                                            .productPageModelObj
                                            ?.sliderrectangleelevenItemList
                                            .length ??
                                        0,
                                    axisDirection: Axis.horizontal,
                                    effect: ScrollingDotsEffect(
                                        spacing: 4,
                                        activeDotColor:
                                            ColorConstant.indigoA200,
                                        dotColor: ColorConstant.gray600,
                                        dotHeight: getVerticalSize(4),
                                        dotWidth: getHorizontalSize(15))));
                          })),
                      Padding(
                          padding: getPadding(left: 20, top: 24),
                          child: Text("msg_print_maxi_dres".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoRegular24.copyWith(
                                  letterSpacing: getHorizontalSize(0.72)))),
                      Padding(
                          padding: getPadding(left: 20, top: 15),
                          child: Text("lbl_99_30".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoMedium20)),
                      Padding(
                          padding: getPadding(left: 20, top: 28),
                          child: Text("lbl_product_details2".tr.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoSemiBold14Gray90001)),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: getHorizontalSize(356),
                              margin: getMargin(
                                  left: 20, top: 17, right: 13, bottom: 5),
                              child: Text("msg_mini_dress_with".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLatoRegular14Gray700)))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(48),
                text: "lbl_add_to_cart2".tr.toUpperCase(),
                margin: getMargin(left: 16, right: 16, bottom: 64))));
  }

  onTapArrowleft2(BuildContext context) {
    NavigatorService.goBack();
  }
}
