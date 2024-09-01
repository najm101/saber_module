import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber_module/components/settings/update_manager.dart';
import 'package:saber_module/components/theming/dynamic_material_app.dart';
import 'package:saber_module/pages/home/browse.dart';
import 'package:saber_module/pages/home/recent_notes.dart';
import 'package:saber_module/pages/home/settings.dart';
import 'package:saber_module/pages/home/whiteboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.subpage,
    required this.path,
  });

  final String subpage;
  final String? path;

  @override
  State<HomePage> createState() => _HomePageState();

  static const String recentSubpage = 'recent';
  static const String browseSubpage = 'browse';
  static const String whiteboardSubpage = 'whiteboard';
  static const String settingsSubpage = 'settings';
  static const List<String> subpages = [
    recentSubpage,
    browseSubpage,
    whiteboardSubpage,
    settingsSubpage
  ];
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    DynamicMaterialApp.addFullscreenListener(_setState);
    super.initState();
    UpdateManager.showUpdateDialog(context);
  }

  void _setState() => setState(() {});

  Widget get body {
    switch (widget.subpage) {
      case HomePage.browseSubpage:
        return BrowsePage(path: widget.path);
      case HomePage.whiteboardSubpage:
        return const Whiteboard();
      case HomePage.settingsSubpage:
        return const SettingsPage();
      default:
        return const RecentPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return body;
  }

  @override
  void dispose() {
    DynamicMaterialApp.removeFullscreenListener(_setState);

    super.dispose();
  }
}
