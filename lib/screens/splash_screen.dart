import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notepad/routes/route_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  navigationToMain(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacementNamed(context, RouteNames.mainScreen);
  }

  @override
  Widget build(BuildContext context) {
    navigationToMain(context);
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/icons/splash.svg'),
      ),
    );
  }
}