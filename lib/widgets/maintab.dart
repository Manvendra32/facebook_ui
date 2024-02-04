// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart' as badges;

import 'package:facebook_ui/pages/friends_page.dart';
import 'package:facebook_ui/pages/home_page.dart';
import 'package:facebook_ui/pages/market_page.dart';
import 'package:facebook_ui/pages/message_page.dart';
import 'package:facebook_ui/pages/notification_page.dart';
import 'package:facebook_ui/pages/video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home/mydrawer.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> topTabs = <Tab>[
    Tab(icon: Icon(Icons.home_outlined)),
    Tab(icon: Icon(Icons.people_outline)),
    Tab(icon: Icon(Icons.message_outlined)),
    Tab(icon: Icon(Icons.message_outlined)),
    // Tab(
    //   icon: //Icon(Icons.home_outlined),
    //     // icon: badges.Badge(
    //     //    // position: BadgePosition.topEnd(top: -20, end: -5),
    //     //     badgeContent: Text(
    //     //       "5",
    //     //       style: TextStyle(fontSize: 18, color: Colors.white),
    //     //     ),
    //     //     child: Icon(Icons.notifications_outlined)),
    //         ),
    Tab(icon: Icon(Icons.video_library_outlined)),
    Tab(icon: Icon(Icons.shopping_bag_outlined)),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: topTabs.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  Future<bool> _onWillPop() async {
    print("On Will Pop");
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }
    Future.delayed(Duration(milliseconds: 200), () {
      print('Set Index');
      _tabController?.index = 0;
    });

    print('Return');
    return _tabController?.index == 0;
  }

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "facebook",
            style: TextStyle(
              fontFamily: 'Klavika',
              fontSize: 34,
              color: Colors.blue[700],
            ),
          ),
          actions: [
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                splashColor: Colors.black,
                highlightColor: Colors.transparent,
                onPressed: () {
                  print('Search Button Clicked');
                },
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                splashColor: Colors.black,
                highlightColor: Colors.transparent,
                onPressed: () => _scaffoldkey.currentState!.openEndDrawer(),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            tabs: topTabs,
          ),
        ),
        endDrawer: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          child: MyDrawer(),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomePage(),
            FriendsPage(),
            MessagePage(),
            NotificationPage(),
            VideoPage(),
            MarketPage(),
          ],
        ),
      ),
    );
  }
}
