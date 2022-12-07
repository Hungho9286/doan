import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:doan/Login.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) => SignUpHome();
}

class SignUpHome extends StatefulWidget {
  const SignUpHome({super.key});

  @override
  State<SignUpHome> createState() => _SignUpHomeState();
}

class _SignUpHomeState extends State<SignUpHome> {
  @override
  
  Widget build(BuildContext context) {
    TextEditingController nickname = TextEditingController();
    TextEditingController emailtxt = TextEditingController();
    TextEditingController passtxt = TextEditingController();
    TextEditingController confirmpasstxt = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: Color.fromARGB(255, 198,239,165),
      padding: EdgeInsets.all(30),
      child: Column(mainAxisSize: MainAxisSize.max,
       children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
          child:
              // ignore: prefer_const_literals_to_create_immutables
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to",
                style: TextStyle(
                  color: Color.fromARGB(255, 184, 255, 97),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CHAO",
                    style: TextStyle(
                      color: Color.fromARGB(248, 255, 152, 138),
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "QUIZZ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 220, 225, 57),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 0),
                child: Image.asset('images/Begin.png',
                    fit: BoxFit.cover, width: 150),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Text("ĐĂNG KÝ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)))),
              Container(
                padding: EdgeInsets.all(10),
                 color: Color.fromARGB(255, 198,239,165),
                child: TextField(
                  controller: nickname,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Tên người dùng',
                      prefixIcon: Icon(Icons.phone)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                 color: Color.fromARGB(255, 198,239,165),
                child: TextField(
                  controller: emailtxt,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nhập Email',
                      prefixIcon: Icon(Icons.phone)),
                ),
              ),
              Container(
                 color: Color.fromARGB(255, 198,239,165),
                padding: EdgeInsets.all(10),
                child: TextField(
                  
                  controller: passtxt,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Mật khẩu',
                      prefixIcon: Icon(Icons.password)),
                  obscureText: true,
                ),
              ),
              Container(
                color: Color.fromARGB(255, 198,239,165),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: confirmpasstxt,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Xác nhận mật khẩu',
                      prefixIcon: Icon(Icons.password)),
                  obscureText: true,
                ),
              ),
          Container(
          padding: EdgeInsets.only(top: 15),
          child: TextButton(
            
              onPressed: () async {
                if (emailtxt.text.isEmpty ||
                                passtxt.text.isEmpty ||
                                nickname.text.isEmpty ||
                                confirmpasstxt.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Vui lòng nhập cho đầy đủ"),
                                ),
                              );
                            } else if (passtxt.text != confirmpasstxt.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Vui lòng nhập trùng PassWord"),
                                ),
                              );
                            } else {
                              try {
                                final NewUser =
                                    _auth.createUserWithEmailAndPassword(
                                        email: emailtxt.text,
                                        password: passtxt.text);
                                Map<String, dynamic> data = {
                                  "Email": emailtxt.text,
                                  "Nickname": nickname.text,
                                  "PassWord": passtxt.text
                                };
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .add(data);
                                if (NewUser != null) {
                                  AlertDialog(title:Text("Thông báo"),content: Text("Đăng ký thành công"),);
                                  
                                  
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Tài khoản này không hợp lệ"),
                                    ),
                                  );
                                }
                              } catch (e) {
                                final snackBar = SnackBar(
                                    content: Text('Có lỗi xảy ra!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Row(children: [
                      Container(
                        
                        padding: EdgeInsets.all(4),
                        height: 40,
                        width: 200,
                        child: Center(child: Text("Đăng Ký",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),)
                      )
                    ])
                  ]),
                )
              ]
              )
              )
              )
              
            ],
          ),
          
        ),
      ]
      ),
    )));
  }
}
