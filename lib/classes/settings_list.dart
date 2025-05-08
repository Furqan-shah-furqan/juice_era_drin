import 'package:flutter/material.dart';

class SettingsList {
  final String title;
  final IconData icon;

  SettingsList(
      {required this.title, required this.icon});
}
List<SettingsList> settingsList = [
  SettingsList(title: 'General', icon:Icons.settings)
];