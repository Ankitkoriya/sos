import 'package:get/get.dart';
import 'package:sos/utils/constants_class.dart';
import 'package:sos/utils/resMessageType.dart';

class HomeController extends GetxController {
  var isSending = false.obs;

  void sendSOS() {
    isSending.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isSending.value = false;
      ConstantsClass.showSnackBar(
        isError: ResMessageType.SUCCESS,
        msg: "Emergency alert has been sent!",
      );
      // Get.snackbar(
      //   "SOS Sent",
      //   "Emergency alert has been sent!",
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    });
  }
}
