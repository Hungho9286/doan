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
