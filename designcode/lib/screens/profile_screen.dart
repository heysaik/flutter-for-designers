import 'dart:io';
import 'package:designcode/components/cards/completed_courses_card.dart';
import 'package:designcode/components/certificate_viewer.dart';
import 'package:designcode/components/lists/completed_courses_list.dart';
import 'package:designcode/constants.dart';
import 'package:designcode/model/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> badges = [
    'badge-01.png',
    'badge-02.png',
    'badge-03.png',
    'badge-04.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kCardPopupBackgroundColor,
                borderRadius: BorderRadius.only(
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
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.0,
                        bottom: 32.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawMaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            constraints: BoxConstraints(
                                minWidth: 40.0,
                                maxWidth: 40.0,
                                maxHeight: 24.0),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: kSecondaryLabelColor,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Profile",
                            style: kCalloutLabelStyle,
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: kShadowColor,
                                    offset: Offset(0, 12),
                                    blurRadius: 32.0,
                                  )
                                ]),
                            child: Icon(
                              Platform.isAndroid
                                  ? Icons.settings
                                  : CupertinoIcons.settings_solid,
                              color: kSecondaryLabelColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Container(
                                padding: EdgeInsets.all(6.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('asset/images/profile.jpg'),
                                  radius: 30.0,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(42.0),
                                ),
                              ),
                            ),
                            height: 84.0,
                            width: 84.0,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Color(0xFF00AEFF),
                                  Color(0xFF0076FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(42.0),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sai Kambampati",
                                style: kTitle2Style,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "Flutter Developer",
                                style: kSecondaryCalloutLabelStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Badges",
                                  style: kHeadlineLabelStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "See all",
                                      style: kSearchPlaceholderStyle,
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: kSecondaryLabelColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 112.0,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 28.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: badges.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: 20.0, right: index != 3 ? 0.0 : 20.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: kShadowColor.withOpacity(0.1),
                                  offset: Offset(0, 12),
                                  blurRadius: 18.0,
                                ),
                              ],
                            ),
                            child: Image.asset('asset/badges/${badges[index]}'),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 32.0,
                left: 20.0,
                right: 20.0,
                bottom: 12.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Certificates",
                        style: kHeadlineLabelStyle,
                      ),
                      Row(
                        children: [
                          Text(
                            "See all",
                            style: kSearchPlaceholderStyle,
                          ),
                          Icon(Icons.chevron_right,
                              color: kSecondaryLabelColor),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CertificateViewer(),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 12.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Completed Courses",
                        style: kHeadlineLabelStyle,
                      ),
                      Row(
                        children: [
                          Text(
                            "See all",
                            style: kSearchPlaceholderStyle,
                          ),
                          Icon(Icons.chevron_right,
                              color: kSecondaryLabelColor),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CompletedCoursesList(),
            SizedBox(
              height: 28.0,
            ),
          ],
        ),
      ),
    );
  }
}
