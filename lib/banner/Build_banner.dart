import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:project_30112023/banner/banner_list.dart';

class BuildBanner extends StatefulWidget {
  const BuildBanner({super.key, required this.bannerlist});
  final List<BannerList> bannerlist;
  @override
  State<BuildBanner> createState() => _BuildBannerState();
}

class _BuildBannerState extends State<BuildBanner> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 3),
      (Timer timer) {
        if (_currentPage < widget.bannerlist.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.bannerlist.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              BannerList banner = widget.bannerlist[index];
              return _Build(BuildContext, banner, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _Build(BuildContext, BannerList bannerlist, int index) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(bannerlist.images),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
