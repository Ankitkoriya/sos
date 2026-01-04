import 'package:upgrader/upgrader.dart';

class CustomUpgraderMessages extends UpgraderMessages {
  @override
  String? message(UpgraderMessage messageKey) {
    switch (messageKey) {
      case UpgraderMessage.title:
        return 'New version available';
      case UpgraderMessage.body:
        return 'SOS is now even better with a shiny new version. It’s time to update and enjoy the new features.';
      case UpgraderMessage.buttonTitleUpdate:
        return 'Update Now';
      default:
        return "";
    }
  }
}
