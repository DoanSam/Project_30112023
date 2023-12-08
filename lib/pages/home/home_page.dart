import 'package:flutter/material.dart';
import 'package:project_30112023/banner/banner_list.dart';
import 'package:project_30112023/OtherItem/item.dart';
import 'package:project_30112023/banner/Build_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerList> bannerlist = [
    BannerList(images: 'assets/images/banner-1.jpg'),
    BannerList(images: 'assets/images/banner-1.jpg'),
    BannerList(images: 'assets/images/banner-1.jpg'),
    BannerList(images: 'assets/images/banner-1.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(3),
        child: Column(
          children: [
            BuildBanner(bannerlist: bannerlist),
            SizedBox(height: 10),
            BuildBoxProducts('Gợi ý cho bạn'),
          ],
        ),
      ),
    );
  }
}
