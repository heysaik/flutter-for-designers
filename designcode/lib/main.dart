import 'package:designcode/components/sidebar_row.dart';
import 'package:designcode/model/sidebar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SidebarRow(
            item: sidebarItem[3],
          ),
        ),
      ),
    );
  }
}
