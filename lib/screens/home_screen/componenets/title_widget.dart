import 'package:flutter/material.dart';
import 'package:vendr/utility/screen_util.dart';

class TitleWidget extends StatelessWidget {
  final String titleText;
  const TitleWidget(this.titleText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth * 0.9,
      child: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.w700, color: Color(0xff424652)),
        textAlign: TextAlign.start,
      ),
    );
  }
}
