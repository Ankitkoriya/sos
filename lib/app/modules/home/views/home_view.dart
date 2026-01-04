import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sos/utils/color_constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // Android
        statusBarBrightness: Brightness.dark, // iOS
      ),
    );
    return Scaffold(
      backgroundColor: ColorConstant.darkBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'ALERTONE SOS',
              style: TextStyle(
                fontSize: 22,
                color: ColorConstant.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Obx(() => GestureDetector(
              onLongPress: controller.sendSOS,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.isSending.value
                      ? ColorConstant.colorGrey
                      : ColorConstant.alertRed,
                ),
                child: Center(
                  child: controller.isSending.value
                      ? const CircularProgressIndicator(color: ColorConstant.white)
                      : const Text(
                    'SOS',
                    style: TextStyle(
                      fontSize: 48,
                      color: ColorConstant.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )),

            const SizedBox(height: 20),

            Text(
              'Long press to send SOS',
              style: TextStyle(color: ColorConstant.white.withValues(alpha: 0.7)
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _action(Icons.call, "Call"),
                _action(Icons.location_on, "Location"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _action(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: ColorConstant.white),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: ColorConstant.white)),
      ],
    );
  }
}
