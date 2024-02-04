import 'package:facebook_ui/widgets/home/menubar.dart';
import 'package:facebook_ui/widgets/home/post.dart';
import 'package:facebook_ui/widgets/home/postbar.dart';
import 'package:facebook_ui/widgets/home/storybar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HpmePageState();
}

class _HpmePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: ListView(
        children: [
          Postbar(),
          Divider(
            thickness: 0.8,
            color: Colors.black12,
          ),
          Menubar(),
          Divider(
            thickness: 9,
            color: Colors.black12,
          ),
          Storybar(),
          Divider(
            thickness: 9,
            color: Colors.black12,
          ),
          Post(),
        ],
      ),
    );
  }
}
