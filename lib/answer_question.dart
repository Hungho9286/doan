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
                                      builder: ((context) =>
                                          ChooseCategories()))),
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
                width: 400,
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
                width: 400,
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
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 410,
                    height: 70,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            width: 400,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 117, 130, 48),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 15),
                          width: 400,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 179, 198, 72),
                          ),
                          child: Text(
                            list.elementAt(index).answerA.toString(),
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 410,
                    height: 70,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            width: 400,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 135, 176, 132),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 15),
                          width: 400,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 162, 216, 159),
                          ),
                          child: Text(
                            list.elementAt(index).answerB.toString(),
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 410,
                    height: 70,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            width: 400,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 216, 180, 94),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 15),
                          width: 400,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 244, 191, 61),
                          ),
                          child: Text(
                            list.elementAt(index).answerC.toString(),
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 410,
                    height: 70,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            width: 400,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 206, 86, 87),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 15),
                          width: 400,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 255, 107, 108),
                          ),
                          child: Text(
                            list.elementAt(index).answerD.toString(),
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
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
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
                      margin: const EdgeInsets.only(top: 20),
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
