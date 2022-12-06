import 'package:doan/Begin.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_gg/login_gg.dart';
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
    
//     Future<UserCredential> signInWithGoogle() async {
//       GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
//   scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
    Container _CreateButtonLog(IconData icon, Color cl, String label,String method)
    {
      return 
      Container(
        padding: EdgeInsets.only(top:15),
        child : TextButton(onPressed: () async {
        await signInWithGoogle();
         Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Begin()));
        }, child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
              child: Row(
              children: [
                  Row(
                 
                     children: [
                      Container(
                          padding: EdgeInsets.all(4),
                          height: 40,
                          width: 280,
                          child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                              Container(
                                padding: EdgeInsets.only(left:20,right: 40),
                                child:Icon(
                  icon,
                  color: cl,
                  size: 32) 
                              ),
                                
                Text(label,style:TextStyle(fontSize: 10,fontWeight: FontWeight.bold))
                          ]),
                      )
                  
                  ]
                     
                  )
                
              ]),
              )
        ]
        
      ))
        
      );
    }
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 198,239,165),
          
          child: Column(
            
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: 
                // ignore: prefer_const_literals_to_create_immutables
                Column(

                  crossAxisAlignment: CrossAxisAlignment.center ,
                  
                  children: [
                    Text("Welcome to",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,),),
                    Row( mainAxisAlignment:  MainAxisAlignment.center , 
                    children: [
                    Text("CHAO",style: TextStyle(color: Color.fromARGB(248, 255, 152, 138),fontSize: 30,
                    ),
                    ),
                    Text("QUIZZ",style: TextStyle(color: Color.fromARGB(255, 220, 225, 57),fontSize: 30,
                    ),
                    ),
                    ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top:20 , bottom: 0),
                      child:Image.asset('images/Begin.png',fit: BoxFit.cover,width: 200),
                    ),
                    Container(
                      child: Center(child: Text("Để tiếp tục, hãy đăng nhập vào CHAOQUIZZ.",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 15,)))
                    ),
                    _CreateButtonLog(Icons.facebook, Colors.blue, "Tiếp tục với Facebook","Facebook"),
                    _CreateButtonLog(Icons.email,Colors.lightBlueAccent, "Tiếp tục với Gmail","Google"),
                    
                  
            ],
          ),
        ),
      ]
      ),
            
            )
            
          ),
            
        );
        
      
    
  }
}