import 'package:doan/signup.dart';
import 'package:flutter/material.dart';
import 'Serverlogin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) => LoginHome();
}

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailtxt = TextEditingController();
    TextEditingController passtxt = TextEditingController();
    Services service = Services();

    return Scaffold(
        body: SingleChildScrollView(
            child: SingleChildScrollView(
                child: Container(
      color: Color.fromARGB(255, 198, 239, 165),
      height: 1000,
      child: Column(children: [
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
                  color: Colors.white,
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
                      color: Color.fromARGB(255, 143, 147, 29),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 0),
                child: Image.asset('images/Begin.png',
                    fit: BoxFit.cover, width: 200),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Center(
                      child: Text("Để tiếp tục, hãy đăng nhập vào CHAOQUIZZ.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                          )))),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailtxt,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            
                      ),
                      hintText: 'Nhập Email',
                      prefixIcon: Icon(Icons.phone,color: Colors.green,)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: passtxt,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Mật khẩu',
                      prefixIcon: Icon(Icons.password,color: Colors.green,)),
                  obscureText: true,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextButton(
                      onPressed: () {
                        if (emailtxt.text.isNotEmpty &&
                            passtxt.text.isNotEmpty) {
                          service.loginUser(
                              emailtxt.text, passtxt.text, context);
                        } else {
                          final snackBar = SnackBar(
                              content:
                                  Text('Tài khoản hoặc mật khẩu không đúng'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    widthFactor: 2,
                                    heightFactor: 1,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Đăng Nhập",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )))
                          ]))),
              Container(
                  padding: EdgeInsets.only(top: 5),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    widthFactor: 2,
                                    heightFactor: 1,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Đăng Ký",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )))
                          ]))),
            ],
          ),
        ),
      ]),
    ))));
  }
}
