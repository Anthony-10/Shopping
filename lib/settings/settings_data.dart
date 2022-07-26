import 'package:flutter/material.dart';
import 'package:shopping_app/settings/settings_model.dart';

class SettingsGenegalData {
  static const notification =
      SettingModel(name: 'Notification', iconData: Icons.notifications);
  static const country = SettingModel(name: 'Country', iconData: Icons.flag);
  static const deleteAccount =
      SettingModel(name: 'DeleteAccount', iconData: Icons.delete);

  static final List<SettingModel> all = [notification, country, deleteAccount];
}

class SettingsFeedBackData {
  static const ReportError =
      SettingModel(name: 'Report a bug/Error', iconData: Icons.warning_amber);
  static const SendFeedback =
      SettingModel(name: 'Send feedback', iconData: Icons.send);
  static const TermsConditions =
      SettingModel(name: 'Terms & Conditions', iconData: Icons.book_sharp);

  static final List<SettingModel> all = [
    ReportError,
    SendFeedback,
    TermsConditions
  ];
}
