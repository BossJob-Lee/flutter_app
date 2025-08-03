import 'package:flutter/material.dart';
import '../widgets/footer_bar.dart';
import '../widgets/app_bar_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Tab数量
      child: Scaffold(
        appBar: AppBarWidget(
          title: "Home",
          bottom: TabBar(
            dividerColor: Colors.red,
            tabs: [
              Tab(child: Text("推荐")),
              Tab(child: Text("热门")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("推荐")),
            Center(child: Text("热门")),
          ],
        ),
        bottomNavigationBar: FooterBar(currentIndex: 0),
      ),
    );
  }
}
