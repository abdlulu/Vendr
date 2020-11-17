import 'package:flutter/material.dart';
import 'package:vendr/utility/scroll_behavior.dart';

import 'story_photo_container.dart';

class CategoryStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 120,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          physics: PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            StoryPhoto(imgSrc: 'assets/laptop.png', titleTxt: 'أجهزة الكمبيوتر المحمول'),
            StoryPhoto(imgSrc: 'assets/tv.png', titleTxt: 'التلفزيونات'),
            StoryPhoto(imgSrc: 'assets/makeup.png', titleTxt: 'الجمال'),
            StoryPhoto(imgSrc: 'assets/fashion.png', titleTxt: 'الأزياء'),
            StoryPhoto(imgSrc: 'assets/perfume.png', titleTxt: 'العطور'),
            StoryPhoto(imgSrc: 'assets/laptop.png', titleTxt: 'الرياضة والنشاطات'),
            StoryPhoto(imgSrc: 'assets/tv.png', titleTxt: 'مستلزمات الأطفال'),
            StoryPhoto(imgSrc: 'assets/makeup.png', titleTxt: 'الألعاب'),
            StoryPhoto(imgSrc: 'assets/fashion.png', titleTxt: 'الكترونيات'),
            StoryPhoto(imgSrc: 'assets/perfume.png', titleTxt: 'الجوالات'),
            StoryPhoto(imgSrc: 'assets/laptop.png', titleTxt: 'البيت والمطبخ'),
            StoryPhoto(imgSrc: 'assets/tv.png', titleTxt: 'بوتيك الزين'),
            StoryPhoto(imgSrc: 'assets/makeup.png', titleTxt: 'البقالة'),
          ],
        ),
      ),
    );
  }
}
