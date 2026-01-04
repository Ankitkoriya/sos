import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sos/utils/color_constant.dart';
import 'package:sos/utils/image_paths.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // optional
        statusBarIconBrightness: Brightness.light, // Android
        statusBarBrightness: Brightness.dark, // iOS
      ),
    );
    return Scaffold(
      backgroundColor: ColorConstant.darkBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pulse Ring + Logo
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstant.redTransparent.withOpacity(
                      controller.opacityAnimation.value,
                    ),
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: controller.scaleAnimation.value,
                      child: child,
                    ),
                  ),
                );
              },
              child: Image.asset(ImagePaths.splashImage, width: 250),
            ),

            const SizedBox(height: 30),

            // App Name
            const Text(
              'ALERTONE SOS',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: ColorConstant.textPrimary,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 8),

            // Tagline
            const Text(
              'Your safety, one tap away',
              style: TextStyle(
                fontSize: 14,
                color: ColorConstant.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
