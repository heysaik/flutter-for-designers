import 'dart:io';

import 'package:designcode/model/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({this.course});

  final Course course;

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Widget indicators() {
    List<Widget> indicators = [];

    for (var i = 0; i < 9; i++) {
      indicators.add(Container(
        width: 7.0,
        height: 7.0,
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == 0 ? Color(0xFF0971FE) : Color(0xFFA6AEBD)),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  PanelController panelController;

  @override
  void initState() {
    super.initState();
    panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SlidingUpPanel(
          controller: panelController,
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
          ),
          color: kCardPopupBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, -12),
              blurRadius: 32.0,
            )
          ],
          minHeight: 0.0,
          maxHeight: MediaQuery.of(context).size.height * 0.95,
          panel: CourseSectionsScreen(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  overflow: Overflow.clip,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration:
                            BoxDecoration(gradient: widget.course.background),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(18.0)),
                                      child: Hero(
                                        child: Image.asset(
                                          'asset/logos/${widget.course.logo}',
                                        ),
                                        tag: widget.course.logo,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: widget.course.courseSubtitle,
                                            child: Text(
                                              widget.course.courseSubtitle,
                                              style: kSecondaryCalloutLabelStyle
                                                  .copyWith(
                                                      color: Colors.white70),
                                            ),
                                          ),
                                          Hero(
                                            tag: widget.course.courseTitle,
                                            child: Text(
                                              widget.course.courseTitle,
                                              style: kLargeTitleStyle.copyWith(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: kPrimaryLabelColor
                                              .withOpacity(0.8),
                                        ),
                                        child: Icon(Icons.close,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 28.0,
                              ),
                              Expanded(
                                child: Hero(
                                  tag: widget.course.illustration,
                                  child: Image.asset(
                                    'asset/illustrations/${widget.course.illustration}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 28.0),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 12.5,
                          bottom: 13.5,
                          left: 20.5,
                          right: 14.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: kShadowColor,
                              blurRadius: 16.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        width: 60.0,
                        height: 60.0,
                        child: Image.asset('asset/icons/icon-play.png'),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.0,
                    left: 28.0,
                    right: 28.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    Platform.isAndroid
                                        ? Icons.people
                                        : CupertinoIcons.group_solid,
                                    color: Colors.white,
                                  ),
                                  radius: 21.0,
                                  backgroundColor: kCourseElementIconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                              ),
                            ),
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                          ),
                          SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "28.7k",
                                style: kTitle2Style,
                              ),
                              Text(
                                "Students",
                                style: kSearchPlaceholderStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    Platform.isAndroid
                                        ? Icons.format_quote
                                        : CupertinoIcons.news_solid,
                                    color: Colors.white,
                                  ),
                                  radius: 21.0,
                                  backgroundColor: kCourseElementIconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                              ),
                            ),
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                          ),
                          SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "12.4k",
                                style: kTitle2Style,
                              ),
                              Text(
                                "Comments",
                                style: kSearchPlaceholderStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      indicators(),
                      GestureDetector(
                        onTap: () {
                          panelController.open();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: kShadowColor,
                                offset: Offset(0, 12),
                                blurRadius: 16.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          width: 80.0,
                          height: 40.0,
                          child: Text(
                            "View all",
                            style: kSearchTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "5 years ago, I couldn’t write a single line of Swift. I learned it and moved to React, Flutter while using increasingly complex design tools. I don’t regret learning them because SwiftUI takes all of their best concepts. It is hands-down the best way for designers to take a first step into code.",
                        style: kBodyLabelStyle,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "About this course",
                        style: kTitle1Style,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "This course was written for people who are passionate about design and about Apple's SwiftUI. It beginner-friendly, but it is also packed with tricks and cool workflows about building the best UI. Currently, Xcode 11 is still in beta so the installation process may be a little hard. However, once you get everything working, then it'll get much friendlier!",
                        style: kBodyLabelStyle,
                      ),
                      SizedBox(height: 24.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseSectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Course Sections",
                  style: kTitle2Style,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "12 sections",
                  style: kSubtitleStyle,
                ),
              ],
            ),
          ),
          CourseSectionList(),
          SizedBox(height: 32.0),
        ],
      ),
    );
  }
}

class CourseSectionList extends StatelessWidget {
  List<Widget> courseSectionsWidgets() {
    List<Widget> cards = [];
    for (var course in courseSections) {
      cards.add(Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: CourseSectionCard(
          course: course,
        ),
      ));
    }

    cards.add(
      Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Text(
          "No more Sections to view, look\nfor more in our courses",
          style: kCaptionLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: courseSectionsWidgets(),
      ),
    );
  }
}

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
