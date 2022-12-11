import 'package:doan/choose_categories.dart';
import 'package:doan/item.dart';
import 'package:doan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Storage extends StatelessWidget {
  const Storage({super.key});

  @override
  Widget build(BuildContext context) {
    return StorageHome();
  }
}

class StorageHome extends StatefulWidget {
  const StorageHome({super.key});

  @override
  State<StorageHome> createState() => _StorageHomeState();
}
class SelectCard extends StatelessWidget {  
  const SelectCard({required  this.ItemSp});  
  final ItemSupport ItemSp ;
  
  @override  
  Widget build(BuildContext context) {  
    
    return Card(  
        
        color: Colors.orange,  
        child: Center(child: Column(  
            crossAxisAlignment: CrossAxisAlignment.center,  
            children: <Widget>[  
              Expanded(child: ItemSp.icon),  
              Text(ItemSp.title, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),  
            ]  
        ),  
        )  
    );  
  }  
}  
class _StorageHomeState extends State<StorageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   title: Text('Kho đồ'),backgroundColor:  Color.fromARGB(255, 184, 255, 97),actions: [
     
        
      ]),
      body: Container(
        child:  GridView.count(  
                crossAxisCount: 3,  
                crossAxisSpacing: 4.0,  
                mainAxisSpacing: 8.0,  
                children: List.generate(ItemSupports.length, (index) {  
                  return Center(  
                    child: SelectCard(ItemSp: ItemSupports[index]),  
                  );  
                }  
                )  
      ),

    ));
  }
}
