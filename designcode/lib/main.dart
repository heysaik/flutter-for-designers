import 'package:designcode/model/course.dart';
import 'package:flutter/material.dart';
import 'components/cards/recent_course_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: RecentCourseCard(
              course: recentCourses[2],
            ),
          ),
        ),
      ),
    );
  }
}
