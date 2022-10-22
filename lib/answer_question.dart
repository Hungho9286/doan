import 'package:doan/categories.dart';
import 'package:doan/choose_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

class AnswerScreen extends StatelessWidget {
  late int questionid;
  AnswerScreen(questionid) {
    this.questionid = questionid;
  }

  @override
  Widget build(BuildContext context) => AnswerScreenHome(questionid);
}

class AnswerScreenHome extends StatefulWidget {
  late int questionid;
  AnswerScreenHome(questionid) {
    this.questionid = questionid;
  }

  @override
  State<StatefulWidget> createState() => _AnswerScreenHomeState(questionid);
}

class _AnswerScreenHomeState extends State<AnswerScreenHome> {
  List<String> lstItem = [
    "50/50",
    "SKIP",
    "NHÂN ĐÔI",
    "GỢI Ý",
    "+30s",
  ];
  Widget _buttonAnswer(String strAnswer, Color colorTop, ColorBot) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextButton(
        onPressed: () {},
        child: Container(
          width: 350,
          height: 70,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 340,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorBot,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                width: 340,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: colorTop,
                ),
                child: Text(
                  strAnswer,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton(String strName) {
    return TextButton(
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 40,
        child: Text(
          strName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 249, 228),
          border: Border.all(width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }

  late int questionid;
  late String txtTitle;
  var list = <quizz>{};
  int questionPresent = 1;
  int point = 0;
  int index = 0;
  _AnswerScreenHomeState(questionid) {
    this.questionid = questionid;
    if (questionid == 1) {
      txtTitle = "Đố vui";
      if (questionid == 1) {
        list.add(quizz(
          1,
          1,
          "1+1=?",
          "1",
          "2",
          "3",
          "4",
          "2",
          10,
          2,
        ));
        list.add(quizz(
          2,
          1,
          "Hưng đánh con gì ghê nhất trong LQ mobile",
          "Murad",
          "Amily",
          "Yena",
          "Tel a nắc",
          "Yena",
          90,
          4,
        ));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(txtTitle),
          actions: [
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                            "EXIT",
                          ),
                          content: Text(
                              'Bạn có chắc muốn thoát, nếu thoát sẽ mất 1 lượt chơi?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ChooseCategories()),
                                ),
                              ),
                              child: Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "No",
                              ),
                            ),
                          ],
                        ));
              },
              child: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 350,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(questionPresent.toString() + "/10"),
                      ),
                      Container(
                        child: Text(point.toString() + " Point"),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.timelapse),
                          ],
                        ),
                      )
                    ]),
              ),
              Container(
                width: 350,
                height: 2,
                color: Colors.black,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(left: 47),
                child: Text(
                  list.elementAt(index).question.toString(),
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buttonAnswer(
                  list.elementAt(index).answerA.toString(),
                  Color.fromARGB(255, 134, 168, 69),
                  Color.fromARGB(255, 110, 140, 54)),
              _buttonAnswer(
                list.elementAt(index).answerB,
                Color.fromARGB(255, 162, 216, 159),
                Color.fromARGB(255, 136, 183, 134),
              ),
              _buttonAnswer(
                list.elementAt(index).answerC,
                Color.fromARGB(255, 244, 191, 61),
                Color.fromARGB(255, 216, 180, 94),
              ),
              _buttonAnswer(
                list.elementAt(index).answerD.toString(),
                Color.fromARGB(255, 255, 107, 108),
                Color.fromARGB(255, 206, 86, 87),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _iconButton('50/50'),
                          _iconButton('SKIP'),
                          _iconButton('NHÂN ĐÔI'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _iconButton('GỢI Ý'),
                          _iconButton('+30s'),
                        ],
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
  }
}
