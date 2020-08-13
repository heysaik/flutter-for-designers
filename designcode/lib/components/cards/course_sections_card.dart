import 'package:designcode/model/course.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CourseSectionCard extends StatelessWidget {
  CourseSectionCard({@required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(41.0),
            gradient: course.background,
            boxShadow: [
              BoxShadow(
                color: course.background.colors[0].withOpacity(0.3),
                blurRadius: 30.0,
                offset: Offset(0, 20),
              ),
              BoxShadow(
                color: course.background.colors[1].withOpacity(0.3),
                blurRadius: 30.0,
                offset: Offset(0, 20),
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(41.0),
          child: Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/illustrations/${course.illustration}',
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.courseSubtitle,
                            style: kCardSubtitleStyle,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            course.courseTitle,
                            style: kCardTitleStyle,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
