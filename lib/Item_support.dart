import 'package:doan/Shop.dart';
import 'package:flutter/material.dart';
import 'package:doan/answer_question.dart';
import 'package:iconsax/iconsax.dart';
import 'package:doan/side_menu.dart';
import 'choose_categories.dart';
class Item_support extends StatelessWidget {
  const Item_support({super.key});

  @override
  Widget build(BuildContext context) => Item_supportHome();
}
class Item_supportHome extends StatefulWidget {
  const Item_supportHome({super.key});

  @override
  State<Item_supportHome> createState() => _Item_supportHomeState();
}

class _Item_supportHomeState extends State<Item_supportHome> {
  @override
 
 Container _createContainer (String txt , Image img)
 {
  
  return Container(
    padding: EdgeInsets.all(10),
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                     color: Color.fromARGB(255, 249, 149, 113),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
              height: 40,
              width: 220,
               
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10 , right: 5),
                    child: Text(txt,style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                 img
                ],
              ),
              
            )
          ],
         ),
         
  );
 }


 Container _createButton (String txt , Image img)
 {
  return Container(
    
    decoration: BoxDecoration(
                        borderRadius:BorderRadiusDirectional.circular(20),
                        border: Border.all(width:2,color: Color.fromARGB(255, 142, 228, 142)),
                        ),
                         height: 40,
                         width : 60 ,
    child: TextButton(onPressed: () {} ,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     
      children: [
        Text(txt,style: TextStyle(fontSize: 17 ,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),),
        img
      ],
    ) ,)
  );
 }
  
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cửa Hàng',
      home: Scaffold(
        drawer: SideMenu(),
        body: Center(
          //header
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 60, left: 20, right: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:BorderRadiusDirectional.circular(20),
                        border: Border.all(width:2,color: Colors.yellowAccent),
                        
                        ),
                        alignment: Alignment.center,
                        child: Text('5000'),
                        height: 20,
                        width: 70,
                        ),
                        Positioned(right: 55,width: 16 , height: 20,
                        child:  Image.asset(
                        'images/heart.png',
                        fit: BoxFit.cover,
                        
                        )
                        ),
                    
                  ],
                ),
              ),
               
             
               Container(
               padding: EdgeInsets.only(top: 60, left: 20, right: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:BorderRadiusDirectional.circular(20),
                        border: Border.all(width:2,color: Colors.yellowAccent),
                        ),
                        alignment: Alignment.center,
                        child: Text('5000'),
                        height: 20,
                        width: 70,
                        ),
                        Positioned(right: 55,width: 16 , height: 20,
                        child:  Image.asset(
                        'images/chao.png',
                        fit: BoxFit.cover
                        )
                        ),
                    
                  ],
                ),
              )
            ],
          ),
          //Body 
        //Title
        Padding(padding: EdgeInsets.all(30),
        child: Column(
          children: [
            
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 111, 69),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
              height: 60,
              width: 300,
               
              child: Center(child: Row(
                children: [
                 
                  Container(
                    alignment: Alignment.center,
                    
                    child: Text('Trợ Giúp/Tăng Điểm',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                  Image.asset(
                        'images/item_sp.png',
                        fit: BoxFit.cover,
                        width: 30,
                        )
                ],
              ),)
            ),
            Padding(padding: EdgeInsets.only(top: 20 , bottom: 5, right: 25),  
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           _createContainer('50/50', Image.asset('images/item_sp.png', fit: BoxFit.cover, width: 30,)),
           _createButton('30', Image.asset('images/chao.png', fit: BoxFit.cover,height: 30,))
         ],
         
         ) 
         ),
         Padding(padding: EdgeInsets.only(bottom: 5,right: 25),  
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           _createContainer('Gợi Ý', Image.asset('images/item_sp.png', fit: BoxFit.cover,width: 30,)),
           _createButton('40', Image.asset('images/chao.png', fit: BoxFit.cover,height: 30,))
         ],
         
         ) 
         ),
         Padding(padding: EdgeInsets.only(bottom: 5,right: 25), 
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           _createContainer('Cộng thêm thời gian (10s)', Image.asset('images/stopwatch.png', fit: BoxFit.cover,width: 29,)),
           _createButton('30', Image.asset('images/chao.png', fit: BoxFit.cover,height: 30,))
           ,
         ],
         
         ) 
         ),
           Padding(padding: EdgeInsets.only(bottom: 5,right: 25), 
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           _createContainer('Cộng thêm thời gian (20s)', Image.asset('images/stopwatch.png', fit: BoxFit.cover,width: 29,)),
           _createButton('50', Image.asset('images/chao.png', fit: BoxFit.cover,height: 30,))
           ,
         ],
         
         ) 
         ),
          Padding(padding: EdgeInsets.only(bottom: 5,right: 25),  
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           _createContainer('Nhân đôi điểm', Image.asset('images/item_sp.png', fit: BoxFit.cover,width: 30,)),
           _createButton('80', Image.asset('images/chao.png', fit: BoxFit.cover,height: 30,))
         ],
         
         ) 
         ),

          
          ],
         ),
         
         ),
          
        ],
        
        ),
        ),
        //footer
        floatingActionButton: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: FloatingActionButton(
            onPressed: () {
               Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ChooseCategories()));
            },
            backgroundColor: Color.fromARGB(255, 250, 196, 32),
            child: Container(
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 134, 168, 69),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                       Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Shop()));
                    },
                    child: Icon(
                      Iconsax.shop,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Iconsax.ranking_15,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Iconsax.message5,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Iconsax.profile_circle5,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
                //footer end


    
  }
}
  
