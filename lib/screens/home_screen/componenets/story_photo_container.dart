import 'package:flutter/material.dart';
import 'package:vendr/utility/size_constants.dart';

class StoryPhoto extends StatelessWidget {
  final String imgSrc, titleTxt;

  const StoryPhoto({Key key, @required this.imgSrc, @required this.titleTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70 + Sizes.dimen_16.w,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xfff6f6f6),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.yellow),
            ),
            child: Image.asset(
              imgSrc,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 70 + Sizes.dimen_16.w,
            child: Text(
              titleTxt,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 10, color: Color(0xff64626d)),
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
