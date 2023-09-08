import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dilkara/presentation/splash_screen/splash_screen.dart';
import 'package:dio/dio.dart';

import '../main_landing_screen/widgets/listitemname_item_widget.dart';
import '../main_landing_screen/widgets/listprice_item_widget.dart';
import '../main_landing_screen/widgets/mainlanding_item_widget.dart';
import 'bloc/main_landing_bloc.dart';
import 'models/listitemname_item_model.dart';
import 'models/listprice_item_model.dart';
import 'models/main_landing_model.dart';
import 'models/mainlanding_item_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:dilkara/widgets/custom_drop_down.dart';
import 'package:dilkara/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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

        // child: Column( navigatorKey: NavigatorService.navigatorKey,
        bottomNavigationBar: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 16,
            top: 24,
            right: 16,
            bottom: 24,
          ),
          decoration: AppDecoration.primary,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  bottom: 22,
                ),
                child: Text(
                  "2023 Dilkara".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtLatoRegular12Gray600,
                ),
              ),
              Spacer(),
              Padding(
                padding: getPadding(
                  bottom: 22,
                ),
                child: Text(
                  "msg_privacy_cooki".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtLatoRegular12Gray200,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 32,
                  right: 6,
                  bottom: 23,
                ),
                child: Text(
                  "lbl_ts_cs".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtLatoRegular12Gray200,
                ),
              ),
            ],
          ),
        ),

        // body: SingleChildScrollView(
        body: Column(
          children: [
            Container(
              child:
                  Title(color: Colors.lightBlue, child: Text('Our Products')),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                    alignment: Alignment.topLeft, child: Text('RECOMMENDED'))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                    alignment: Alignment.topLeft, child: Text('Hair Care'))),
          ],
        ),
      ),
    );
  }
}
