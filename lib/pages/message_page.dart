import 'package:flutter/material.dart';

import '../models/message_model.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        Icons.message,
                        color: Colors.green,
                      ),
                      splashColor: Colors.black,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        print('Message Clicked');
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
                        Icons.settings,
                        color: Colors.black,
                      ),
                      splashColor: Colors.black,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        print('Setting Clicked');
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
            itemCount: messageData.length,
            itemBuilder: (context, i) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage(messageData[i].avatar),
                  ),
                  title: Text(
                    messageData[i].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(messageData[i].time),
                  trailing: IconButton(
                    iconSize: 20,
                    color: Colors.green,
                    onPressed: () => {},
                    icon: messageData[i].status,
                  ),
                  onTap: () => {print('User Tapped from Message')},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
