import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
// Initial Selected Value

// List of items in our dropdown menu

  String dropdownValue = 'Công nghệ';

  @override
  Widget build(BuildContext context) {
    var selectedValue;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 35,
          child: DropdownButtonFormField(
            iconEnabledColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(right: 15, left: 20),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(20),
              //   borderSide: BorderSide(color: Colors.black, width: 2),
              // ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 213, 9, 189),
            ),
            dropdownColor: Color.fromARGB(255, 213, 9, 189),
            borderRadius: BorderRadius.circular(20),
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'Công nghệ',
              'Toán học',
              'Văn học',
              'Lịch sử',
              'Địa lý',
              'Đố vui',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
          ),
        ),

        /*DropdownButton(
          // Initial Value
          value: dropdownvalue,
          dropdownColor: Color.fromARGB(255, 14, 144, 18),
          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        ),*/
      ],
    );
  }
}
