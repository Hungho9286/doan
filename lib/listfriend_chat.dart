import 'package:doan/friend_details.dart';
import 'package:doan/main.dart';
import 'package:doan/screen_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<StatefulWidget> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 213, 193, 17),
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: ('Search'),
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              color: Color.fromARGB(255, 202, 199, 199),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenChat(),
                    ),
                  );
                },
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 8, 59, 101),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('images/gaoden.png'),
                  ),
                ),
                title: Text('gao đen'),
                trailing: null,
              ),
            ),
            Card(
              color: Color.fromARGB(255, 202, 199, 199),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 8, 59, 101),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('images/trubatgioi.jpg'),
                  ),
                ),
                title: Text('trư bát giới'),
                trailing: null,
              ),
            ),
            Card(
              color: Color.fromARGB(255, 202, 199, 199),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 8, 59, 101),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('images/khabanh.png'),
                  ),
                ),
                title: Text('khá bảnh'),
                trailing: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
