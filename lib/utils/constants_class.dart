import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos/utils/preferences_manage.dart';
import 'package:sos/utils/resMessageType.dart';
import 'color_constant.dart';

class ConstantsClass {
  static var fontFamily = GoogleFonts.montserrat().fontFamily;

  static var loginExpire = 'Unauthenticated';
  static var errorMessage =
      'Something went wrong. Please try again later.';

  static RegExp regexEmail = RegExp(
    r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );

  static var passwordRegExp =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static logPrint(var message) {
    if (kDebugMode) {
      print(message);
    }
  }

  static void showSnackBar({
    String? msg,
    ResMessageType isError = ResMessageType.WARNING,
  }) {
    Color msgColor = ColorConstant.colorOrange;

    if (isError == ResMessageType.ERROR) {
      msgColor = ColorConstant.colorRed;
    } else if (isError == ResMessageType.SUCCESS) {
      msgColor = ColorConstant.colorGreen;
    }

    Get.snackbar(
      "",
      msg ?? "",
      backgroundColor: msgColor,
      titleText: const SizedBox.shrink(),
      padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12, top: 5),
      colorText: ColorConstant.white,
      margin: const EdgeInsets.all(18),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static userLoginExpire() async {
    AwesomeDialog(
      context: Get.context as BuildContext,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      title: 'Login Expired',
      desc:
      'Your session has expired. Please log in again to continue using the app.',
      btnOkText: 'OK',
      btnOkColor: ColorConstant.colorGreen,
      btnOkOnPress: () {
        ConstantsClass.userLogout();
      },
    ).show();
  }

  static userLogout() async {
    await PreferencesManage.clearPreferencesData();
    // Get.offAllNamed(Routes.LOGIN);
  }

  static Widget apiLoadingWidget() {
    return Container(
      height: Get.height,
      width: Get.width,
      color: ColorConstant.blackTransparent,
      child: Center(
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.colorGrey,
                spreadRadius: 0.5,
                blurRadius: 0.5,
              ),
            ],
          ),
          child: Center(
            child: SpinKitSpinningLines(
              color: ColorConstant.textSecondary,
              size: 50,
              lineWidth: 2,
              duration: const Duration(milliseconds: 600),
            ),
          ),
        ),
      ),
    );
  }

  static hideLoader() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  // static Future<bool> isNetworkConnected() async {
  //   final ConnectivityResult connectivityResult =
  //   await Connectivity().checkConnectivity();
  //
  //   logPrint('Connectivity Result: $connectivityResult');
  //
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi ||
  //       connectivityResult == ConnectivityResult.ethernet) {
  //     return true;
  //   }
  //
  //   return false;
  // }


  // ================= VALIDATIONS =================

  static String? validateRequired(String value, String message) {
    if (value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.trim().isEmpty) {
      return 'Email address is required.';
    } else if (!regexEmail.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validateMobile(String value) {
    if (value.trim().isEmpty) {
      return 'Please enter your mobile number.';
    } else if (value.length != 10) {
      return 'Mobile number must be 10 digits.';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required.';
    } else if (!RegExp(passwordRegExp).hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, number, special character and be at least 8 characters long.';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is required.';
    } else if (password != confirmPassword) {
      return 'Password and confirm password do not match.';
    }
    return null;
  }
}

