import 'package:flutter/material.dart';
import 'package:vendr/utility/size_constants.dart';

import 'componenets/ads_banner.dart';
import 'componenets/category_stories.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              AdsBanner(),
              SizedBox(height: Sizes.dimen_10.h),
              CategoryStories(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_6.h),
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_6.h),
                child: Image.asset('assets/xiaomiAd.png'),
              ),
              Container(
                width: double.infinity,
                child: Text('مُقترحة لك',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w700, color: Color(0xff424652)),
                    textAlign: TextAlign.right),
              ),
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
