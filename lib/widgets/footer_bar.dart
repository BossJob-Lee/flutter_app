import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  final int currentIndex;

  const FooterBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
      ],
      onTap: (index) {
        if (index == currentIndex) {
          return;
        }

        if (index == 0) {
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/setting');
        }
      },
    );
  }
}
