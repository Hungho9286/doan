import 'package:flutter/material.dart';

class ItemSupport {  
  const ItemSupport({required this.title, required this.icon});  
  final String title;  
  final Icon icon;  
}  
  
const List<ItemSupport> ItemSupports = const <ItemSupport>[  
  const ItemSupport(title: '50/50',icon: Icon(Icons.help,color:Color.fromARGB(255, 0, 0, 0) ,size: 40,)),  
  const ItemSupport(title: 'Nhân đôi', icon: Icon(Icons.looks_two,color:Color.fromARGB(255, 0, 0, 0) ,size: 40)),  
  const ItemSupport(title: '+30s', icon: Icon(Icons.timelapse,color:Color.fromARGB(255, 0, 0, 0) ,size: 40)),  

  

];  