import 'package:flutter/material.dart';
import 'choose_categories.dart';
class Begin extends StatelessWidget {
  const Begin({super.key});

  @override
  Widget build(BuildContext context) => BeginHome();
}

class BeginHome extends StatefulWidget {
  const BeginHome({super.key});

  @override
  State<BeginHome> createState() => _BeginHomeState();
}

class _BeginHomeState extends State<BeginHome> {
  @override
  Widget build(BuildContext context) {
    
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
                Column(children: [
                    Text("Welcome to",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,),),
                    Row( mainAxisAlignment:  MainAxisAlignment.center , 
                    children: [
                    Text("CHAO",style: TextStyle(color: Color.fromARGB(250, 250,194,64),fontSize: 30,
                    ),
                    ),
                    Text("QUIZZ",style: TextStyle(color: Color.fromARGB(255, 71,66,20),fontSize: 30,
                    ),
                    ),
                    ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top:20 , bottom: 0),
                      child:Image.asset('images/Begin.png',fit: BoxFit.cover,width: 240),
                    ),
                    
                    Container(
                      padding: EdgeInsets.only(top:130 , bottom: 0),
                      child: TextButton(onPressed: () {
                         Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ChooseCategories()));
                      }, child: Column(  
                        children: [
                          Container(
                            width: 200,  
                            height: 70,  
                            padding: new EdgeInsets.all(10.0),
                            child:  Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: Text("GET START",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 20,)),),
                              color: Colors.white,
                            ),
                          ),
                          
                        ],
                      ),)
                    ),
                    
                ],)
              ),
              
              
            

              
            ],
          ),
        ),
      ),
    );
  }
}