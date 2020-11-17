import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vendr/utility/size_constants.dart';

class AdsBanner extends StatefulWidget {
  @override
  _AdsBannerState createState() => _AdsBannerState();
}

class _AdsBannerState extends State<AdsBanner> {
  List<Widget> adsList = [
    AdPhoto(imgSrc: 'assets/ad.png'),
    AdPhoto(imgSrc: 'assets/xiaomiAd.png'),
    AdPhoto(imgSrc: 'assets/banner.jpg'),
  ];
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  Timer _timer;

  @override
  void initState() {
    super.initState();
    buildIndexList();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 3500), (Timer timer) {
      if (_currentPage < 2) {
        setState(() {
          _currentPage++;
        });
      } else {
        setState(() {
          _currentPage = 0;
        });
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  List<Widget> buildIndexList() {
    List<Widget> indexList = [];
    for (var i = 0; i < adsList.length; i++) {
      indexList.add(
        Container(
          height: 3,
          width: 25,
          decoration: BoxDecoration(
            color: _currentPage != i ? Color(0xffd9d9d9) : Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    return indexList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Sizes.dimen_78.h,
          child: GestureDetector(
            onHorizontalDragDown: (details) => _timer.cancel(),
            onHorizontalDragCancel: () => setState(() => startTimer()),
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              //cancel timer on drag start and then restart on drag end
              allowImplicitScrolling: true,
              controller: _pageController,
              children: adsList,
            ),
          ),
        ),
        SizedBox(height: 6),
        SizedBox(
          width: (adsList.length * 30).toDouble(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildIndexList(),
          ),
        ),
      ],
    );
  }
}

class AdPhoto extends StatelessWidget {
  final String imgSrc;
  const AdPhoto({
    Key key,
    @required this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new AssetImage(imgSrc),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
