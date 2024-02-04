import 'package:facebook_ui/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.check_circle,
                        ),
                        splashColor: Colors.black,
                        highlightColor: Colors.transparent,
                        tooltip: 'Mark all notification as read',
                        onPressed: () {
                          print('Mark all notification as read');
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: notificationData.length,
            itemBuilder: (context, i) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage(notificationData[i].avatar),
                  ),
                  title: Text(
                    notificationData[i].name +
                        ' ' +
                        notificationData[i].description,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(notificationData[i].time),
                  trailing: IconButton(
                    iconSize: 20,
                    color: Colors.black,
                    onPressed: () => {},
                    icon: Icon(Icons.more_vert_outlined),
                  ),
                  onTap: () => {print('User Tapped from Message')},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
