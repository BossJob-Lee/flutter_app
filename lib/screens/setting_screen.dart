import 'package:flutter/material.dart';
import '../widgets/footer_bar.dart';
import '../widgets/app_bar_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Setting"),
      body: Center(
        child: Text("SettingScreen"),
      ),
      bottomNavigationBar: FooterBar(currentIndex: 1),
    );
  }
}
