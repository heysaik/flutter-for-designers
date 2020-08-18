import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class SidebarItem {
  SidebarItem({
    this.title,
    this.background,
    this.icon,
  });

  String title;
  LinearGradient background;
  Icon icon;
}

var sidebarItems = [
  SidebarItem(
    title: "Home",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    icon: Icon(
      Icons.home,
      color: Colors.white,
      size: 22.0,
    ),
  ),
  SidebarItem(
    title: "Courses",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7D75),
        Color(0xFFC23D61),
      ],
    ),
    icon: Icon(
      Platform.isAndroid ? Icons.library_books : CupertinoIcons.book_solid,
      color: Colors.white,
      size: 22.0,
    ),
  ),
  SidebarItem(
    title: "Billing",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFAD64A),
        Color(0xFFEA880F),
      ],
    ),
    icon: Icon(
      Icons.credit_card,
      color: Colors.white,
      size: 22.0,
    ),
  ),
  SidebarItem(
    title: "Settings",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    icon: Icon(
      Platform.isIOS ? CupertinoIcons.settings_solid : Icons.settings,
      color: Colors.white,
      size: 22.0,
    ),
  ),
];
