import 'package:flutter/material.dart';
import '../widgets/footer_bar.dart';
import '../widgets/app_bar_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Home"),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Text("HomeScreen"),
      ),
      bottomNavigationBar: FooterBar(currentIndex: 0),
    );
  }
}
