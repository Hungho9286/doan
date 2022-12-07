
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
        body: SingleChildScrollView(child: SingleChildScrollView(
     
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
                      color: Color.fromARGB(255, 220, 225, 57),
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
                  child: Center(
                      child: Text("Để tiếp tục, hãy đăng nhập vào CHAOQUIZZ.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          )))),
              Container(
                padding: EdgeInsets.all(10),
                color: Color.fromARGB(255, 255, 255, 255),
                child: TextField(
                  controller: emailtxt,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nhập Email',
                      prefixIcon: Icon(Icons.phone)),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
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
          padding: EdgeInsets.only(top: 10),
          child: TextButton(
              onPressed: () {
               
                  if (emailtxt.text.isNotEmpty && passtxt.text.isNotEmpty) {
                    service.loginUser(emailtxt.text, passtxt.text, context);
                  } else {
                    final snackBar = SnackBar(
                        content: Text('Tài khoản hoặc mật khẩu không đúng'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                
              
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Card(
              color: Color.fromARGB(255, 198, 239, 165),
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
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )))
              ]))),
            
             Container(
          padding: EdgeInsets.only(top: 5),
          child: TextButton(
              onPressed: () {  
                  Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Card(
                   color: Color.fromARGB(255, 198, 239, 165),
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
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )))
              ]))),
            ],
          ),
        ),
      ]),
    )) );
  }
}
