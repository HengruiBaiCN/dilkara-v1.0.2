import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              backgroundColor: ColorConstant.whiteA700,
              body: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgSplash),
                          fit: BoxFit.cover)),
                  child: Container(
                      width: double.maxFinite,
                      padding: getPadding(top: 261),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("lbl_shopsie".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.txtPlayfairDisplayRomanMedium65),
                            Padding(
                                padding: getPadding(top: 24, bottom: 5),
                                child: Text("msg_the_best_way_to".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLatoRegular14))
                          ])))));
    });
  }
}
