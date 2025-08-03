import 'package:flutter/material.dart';
import '../widgets/card_row.dart';
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Container(
              color: Colors.blue, // 设置 TabBar 背景颜色
              child: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                      child: Text(
                    "推荐",
                    style: TextStyle(color: Colors.white),
                  )),
                  Tab(
                      child: Text(
                    "热门",
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // 推荐页面 - 流式布局
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0, // 水平间距
                runSpacing: 8.0, // 垂直间距
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width - 24) /
                        2, // 计算每个卡片宽度：(屏幕宽度 - 左右padding - 中间间距) / 2
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: double
                              .infinity, // 撑满父容器 SizedBox 的宽度 (类似 Web 的 width: 100%)
                          // 其他选择：
                          // width: MediaQuery.of(context).size.width * 0.4, // 屏幕宽度的40% (类似 40vw)
                          // width: 150, // 固定宽度 (类似 width: 150px)
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 50, 49, 49),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        // 使用 LayoutBuilder 获取父容器的80%宽度
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              width: constraints.maxWidth * 0.8, // 父容器的80%
                              padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "卡片标题 ${index + 1}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "这是卡片的描述内容",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            // 热门页面
            Center(child: Text("热门")),
          ],
        ),
        bottomNavigationBar: FooterBar(currentIndex: 0),
      ),
    );
  }
}
