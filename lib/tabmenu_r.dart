import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabMenuR extends StatelessWidget {
  const TabMenuR({super.key});

  @override
  Widget build(BuildContext context) => TabMenuRHome();
}

class TabMenuRHome extends StatefulWidget {
  @override
  _TabMenuRState createState() => _TabMenuRState();
}

class _TabMenuRState extends State<TabMenuRHome> {
  Widget _ThoiGian = Container(
    padding: EdgeInsets.only(top: 20),
    child: SizedBox(
      width: 160,
      height: 110,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //minimumSize: Size(40, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.timelapse),
            ),
            Container(
              padding: EdgeInsets.all(5),
              //mainAxisAlignment: MainAxisAlignment.start,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'kể từ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'tháng 9 năm 2021',
                    style: TextStyle(
                      fontSize: 15,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  Widget _percent = Container(
    padding: EdgeInsets.only(top: 20),
    child: SizedBox(
      width: 160,
      height: 110,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Color.fromARGB(255, 211, 195, 15),
          foregroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.check_box_outlined),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '0%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'tỉ lệ trả lời đúng',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  Widget _answer = Container(
    padding: EdgeInsets.only(top: 20),
    child: SizedBox(
      width: 160,
      height: 110,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Color.fromARGB(255, 28, 172, 42),
          foregroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.checklist_outlined),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'số câu hỏi đã trả lời',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      children: [
        _percent,
        _ThoiGian,
        _answer,
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 330,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );

    /*return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      //mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        _percent,
        _ThoiGian,
        _answer,
      ],
    );*/

    /*return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _percent,
            _ThoiGian,
          ],
        ),
        Row(
          children: [_answer],
        ),
      ],
    );*/
  }
}
