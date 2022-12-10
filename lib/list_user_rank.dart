import 'package:doan/friend_details.dart';
import 'package:doan/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListRank extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListRankState();
}

class _ListRankState extends State<ListRank> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .orderBy('point', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        // if (snapshot.hasError) {
        //   return Text('ERROR! ${snapshot.error}');
        // } else
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView(
            children: documents
                .map(
                  (doc) => Card(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FriendDetail(),
                            ),
                          );
                        },
                        hoverColor: Colors.yellow,
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.green,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/${doc['avatar']}'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              doc['name'],
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              doc['point'].toString(),
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// ListView(
//                 shrinkWrap: true,
//                 physics: BouncingScrollPhysics(),
//                 children: [
//                   Card(
//                     shadowColor: Colors.yellow,
//                     elevation: 5,
//                     child: Container(
//                       height: 70,
//                       alignment: Alignment.center,
//                       child: ListTile(
//                         hoverColor: Colors.yellow,
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.yellow,
//                           child: CircleAvatar(
//                             radius: 23,
//                             backgroundImage: AssetImage('images/gaoden.png'),
//                           ),
//                         ),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'gao đen',
//                               style: TextStyle(
//                                 color: Colors.yellow,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '356892',
//                               style: TextStyle(
//                                 color: Colors.yellow,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         trailing: null,
//                       ),
//                     ),
//                   ),
//                   Card(
//                     shadowColor: Color.fromARGB(255, 193, 194, 194),
//                     elevation: 5,
//                     child: Container(
//                       height: 70,
//                       alignment: Alignment.center,
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Color.fromARGB(255, 193, 194, 194),
//                           child: CircleAvatar(
//                             radius: 23,
//                             backgroundImage: AssetImage('images/khabanh.png'),
//                           ),
//                         ),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'khá bảnh',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 193, 194, 194),
//                               ),
//                             ),
//                             Text(
//                               '245632',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 193, 194, 194),
//                               ),
//                             ),
//                           ],
//                         ),
//                         trailing: null,
//                       ),
//                     ),
//                   ),
//                   Card(
//                     shadowColor: Colors.red,
//                     elevation: 5,
//                     child: Container(
//                       height: 70,
//                       alignment: Alignment.center,
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.red,
//                           child: CircleAvatar(
//                             radius: 23,
//                             backgroundImage: AssetImage('images/avatar.jpg'),
//                           ),
//                         ),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Yuna Ogura',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.red),
//                             ),
//                             Text(
//                               '226532',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.red),
//                             ),
//                           ],
//                         ),
//                         trailing: null,
//                       ),
//                     ),
//                   ),
//                   Card(
//                     child: Container(
//                       height: 70,
//                       alignment: Alignment.center,
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Color.fromARGB(255, 14, 144, 18),
//                           child: CircleAvatar(
//                             radius: 23,
//                             backgroundImage:
//                                 AssetImage('images/trubatgioi.jpg'),
//                           ),
//                         ),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'trư bát giới',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                             Text(
//                               '192020',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                           ],
//                         ),
//                         trailing: null,
//                       ),
//                     ),
//                   ),
//                   Card(
//                     child: Container(
//                       height: 70,
//                       alignment: Alignment.center,
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Color.fromARGB(255, 14, 144, 18),
//                           child: CircleAvatar(
//                             radius: 23,
//                             backgroundImage:
//                                 AssetImage('images/trubatgioi.jpg'),
//                           ),
//                         ),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'trư bát giới',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                             Text(
//                               '185263',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                           ],
//                         ),
//                         trailing: null,
//                       ),
//                     ),
//                   ),
//                   Card(
//                     child: Container(
//                       height: 70,
//                       alignment: Alignment.center,
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Color.fromARGB(255, 14, 144, 18),
//                           child: CircleAvatar(
//                             radius: 23,
//                             backgroundImage:
//                                 AssetImage('images/trubatgioi.jpg'),
//                           ),
//                         ),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'trư bát giới',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                             Text(
//                               '142663',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                           ],
//                         ),
//                         trailing: null,
//                       ),
//                     ),
//                   ),
//                   Card(
//                     child: Container(
//                       height: 70,
//                       alignment: Alignment.center,
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Color.fromARGB(255, 14, 144, 18),
//                           child: CircleAvatar(
//                             radius: 23,
//                             backgroundImage:
//                                 AssetImage('images/trubatgioi.jpg'),
//                           ),
//                         ),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'trư bát giới',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                             Text(
//                               '142663',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                           ],
//                         ),
//                         trailing: null,
//                       ),
//                     ),
//                   ),
//                   Card(
//                     child: Container(
//                       height: 70,
//                       alignment: Alignment.center,
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Color.fromARGB(255, 14, 144, 18),
//                           child: CircleAvatar(
//                             radius: 23,
//                             backgroundImage:
//                                 AssetImage('images/trubatgioi.jpg'),
//                           ),
//                         ),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'trư bát giới',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                             Text(
//                               '123456',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 14, 144, 18)),
//                             ),
//                           ],
//                         ),
//                         trailing: null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
