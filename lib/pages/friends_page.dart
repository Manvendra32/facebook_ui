import 'package:flutter/material.dart';

import '../models/friends_model.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Friends',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    splashColor: Colors.black,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      print('Person Clicked');
                    },
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.people,
                      color: Colors.redAccent,
                    ),
                    splashColor: Colors.black,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      print('People Clicked');
                    },
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Divider(
        thickness: 1,
        color: Colors.black38,
      ),
      Expanded(
        child: ListView.builder(
          itemCount: friendsData.length,
          itemBuilder: (context, i) => Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: AssetImage(friendsData[i].avatar),
                ),
                title: Text(
                  friendsData[i].name,
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Wrap(
                  spacing: 12,
                  children: [
                    TextButton(
                      onPressed: () => {print('Friend Add Request Sent')},
                      child: Text('Add Friend'),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () => {print('Friend Removed')},
                      child: Text('Remove'),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          primary: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                onTap: () {
                  print('Open Clicked User Profile');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => UserProfile()));
                },
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
