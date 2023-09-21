// import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dilkara/widgets/custom_icon_button.dart';
// import 'package:dilkara/presentation/splash_screen/splash_screen.dart';
// import 'package:dilkara/widgets/custom_icon_button.dart';
// import 'package:dio/dio.dart';

// import '../main_landing_screen/widgets/listitemname_item_widget.dart';
// import '../main_landing_screen/widgets/listprice_item_widget.dart';
// import '../main_landing_screen/widgets/mainlanding_item_widget.dart';
import 'bloc/main_landing_bloc.dart';
// import 'models/listitemname_item_model.dart';
// import 'models/listprice_item_model.dart';
import 'models/main_landing_model.dart';
// import 'models/mainlanding_item_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
// import 'package:dilkara/widgets/custom_button.dart';
// import 'package:dilkara/widgets/custom_drop_down.dart';
// import 'package:dilkara/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../main_landing_screen/widgets/home_categories_widget.dart';

class MainLandingScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<MainLandingBloc>(
      create: (context) => MainLandingBloc(MainLandingState(
        mainLandingModelObj: MainLandingModel(),
      ))
        ..add(MainLandingInitialEvent()),
      child: MainLandingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        // topbar
        appBar: _buildCustomAppBar(),
        // bottombar
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                // AppBarIcon.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                // AppBarIcon.cart,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                // AppBarIcon.wishlist,
              ),
              label: 'My Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                // AppBarIcon.account,
              ),
              label: 'My account',
              // function: () {
              //   NavigatorService.navigatorKey.currentState!
              //       .pushNamed(AppRoutes.profileProfileInfoTabContainerScreen);
              // },
            ),
          ],
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: ColorConstant.black900,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          onTap: (value) {
            if (value == 0) {
              NavigatorService.navigatorKey.currentState!
                  .pushNamed(AppRoutes.mainLandingScreen);
            }
            if (value == 1) {
              NavigatorService.navigatorKey.currentState!
                  .pushNamed(AppRoutes.cartScreen);
            }
            if (value == 2) {
              NavigatorService.navigatorKey.currentState!
                  .pushNamed(AppRoutes.mainLandingScreen);
            }
            if (value == 3) {
              NavigatorService.navigatorKey.currentState!
                  .pushNamed(AppRoutes.profileProfileInfoTabContainerScreen);
            }
          },
        ),

        body: Container(
          color: ColorConstant.whiteA700,
          child: ListView(
            children: [
              imageCarousel(context),
              WidgetCategories(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildCustomAppBar() {
    return CustomAppBar(
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
      body: Padding(
        padding: getPadding(
          left: 16,
          top: 5,
          right: 16,
        ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: new CarouselSlider(
        // TODO: we need to add images here
        items: [
          Text(
            'upload some product images or logo here',
            textAlign: TextAlign.center,
            textScaleFactor: 1.5,
          )
        ],
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
