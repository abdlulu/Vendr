import 'package:flutter/material.dart';
import 'package:vendr/utility/screen_util.dart';
import 'package:vendr/utility/size_constants.dart';

import 'componenets/ads_banner.dart';
import 'componenets/bottom_nav_bar.dart';
import 'componenets/category_stories.dart';
import 'componenets/title_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white70,
          leading: Container(
            margin: EdgeInsets.only(right: 5),
            child: Image(image: AssetImage('assets/logo.png'), height: 40),
          ),
          leadingWidth: 80,
          title: Container(height: 37, child: buildSearchField()),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AdsBanner(),
              SizedBox(height: Sizes.dimen_10.h),
              CategoryStories(),
              SizedBox(
                width: ScreenUtil.screenWidth * 0.9,
                child: Image.asset('assets/xiaomiAd.png'),
              ),
              SizedBox(height: Sizes.dimen_6.h),
              TitleWidget('مُقترحة لك'),
              Container()
            ],
          ),
        ),
      ),
    );
  }

  TextField buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xffd1d1d1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xffd1d1d1)),
        ),
        suffixIcon: Icon(Icons.search),
        hintText: 'ما الذي تبحث عنه',
        contentPadding: EdgeInsets.all(5.0),
      ),
    );
  }
}

// CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 140.0,
// leading: Container(
//   margin: EdgeInsets.only(right: 5),
//   child: Image(image: AssetImage('assets/logo.png'), height: 40),
// ),
// leadingWidth: 80,
// title: Container(
//   height: 40,
//   child: TextField(
//     decoration: InputDecoration(
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(color: Colors.grey),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(color: Colors.grey),
//       ),
//       suffixIcon: Icon(Icons.search),
//       hintText: 'ما الذي تبحث عنه',
//       contentPadding: EdgeInsets.all(10.0),
//     ),
//   ),
// ),
// centerTitle: true,
//               collapsedHeight: 55,
//               toolbarHeight: 50,
//               backgroundColor: Colors.white,
//               floating: true,
//               pinned: true,
//               snap: true,
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return Container(
//                     alignment: Alignment.center,
//                     color: Colors.grey,
//                     height: 100,
//                     child: Text('Item:'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         )
