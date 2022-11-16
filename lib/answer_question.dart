import 'dart:async';

import 'package:doan/categories.dart';
import 'package:doan/choose_categories.dart';
import 'package:doan/result_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math';

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
  List<Color> colorListFalse = [
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  final indexRand = Random();
  int indexAnswerColorFalseAfter = 0;
  int indexAnswerColorFalseBefore = 0;
  int indexRange1 = 0;
  int indexRange2 = 0;
  late Color trueAnswerColorTop;
  late Color trueAnswerColorBot;
  int secondsAnimation = 0;
  double opacity = 0;
  int trueCorrect = 0;
  bool firstLoad = true;
  int secondsClock = 0, minutesClock = 0;
  String digitSeconds = "00";
  String digitMinutes = "00";
  static const int maxSecond = 10;
  int seconds = maxSecond;
  Timer? timer;
  void starTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          //Xu li chuyen cau hoi
          seconds--;
          secondsClock++;
          if (secondsClock < 10) {
            digitSeconds = "0" + secondsClock.toString();
          } else {
            digitSeconds = secondsClock.toString();
          }

          if (secondsClock == 61) {
            minutesClock++;
            secondsClock = 0;
            digitMinutes = minutesClock.toString();
            digitSeconds = "00";
          }
        });
      } else {
        //Xu li chuyen cau hoi
        index++;
        questionPresent++;
        resetTimer();
      }
    });
  }

  void resetTimer() => setState(() {
        for (var i = 0; i < 3; i++) {
          colorListFalse[i] = Colors.white;
        }
        seconds = maxSecond;
      });

  void stopTimer() {
    timer?.cancel();
  }

  int questionIndex = 0;
  List<String> lstItem = [
    "50/50",
    "SKIP",
    "NHÂN ĐÔI",
    "GỢI Ý",
    "+30s",
  ];
  void chooseAnswer(String strAnswer) {
    if (strAnswer == list.elementAt(index).result.toString()) {
      questionPresent += 1;
      trueCorrect++;
      point = point + list.elementAt(index).maxpoint / maxSecond * seconds;
      index++;

      resetTimer();
      setState(() {
        trueAnswerColorTop = Colors.green;
        trueAnswerColorBot = Colors.green;
      });
    } else {
      questionPresent += 1;

      if (questionPresent == 11) {
        questionPresent = 10;
      }
      index++;
      resetTimer();
      setState(() {});
    }
  }

  Widget _buttonAnswer(String strAnswer, Color colorTop, Color ColorBot) {
    if (strAnswer == list.elementAt(index).result) {
      trueAnswerColorTop = colorTop;
      trueAnswerColorBot = ColorBot;
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextButton(
          onPressed: () {
            if (index < 9) {
              chooseAnswer(strAnswer);
            }
            if (index == 9) {
              chooseAnswer(strAnswer);
              stopTimer();
              index = 0;
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnswerResult(
                          point: point,
                          trueCorrect: trueCorrect,
                          time: digitMinutes + ":" + digitSeconds)));
            }
          },
          child: Container(
            width: 350,
            height: 70,
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: trueAnswerColorBot,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  width: 340,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: trueAnswerColorTop,
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
    indexAnswerColorFalseBefore = indexAnswerColorFalseAfter;
    indexAnswerColorFalseAfter = indexAnswerColorFalseBefore + 1;
    if (indexAnswerColorFalseAfter == 3) indexAnswerColorFalseAfter = 0;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextButton(
        onPressed: () {
          if (index < 9) chooseAnswer(strAnswer);
          if (index == 9) {
            chooseAnswer(strAnswer);
            stopTimer();
            index = 0;
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AnswerResult(
                        point: point,
                        trueCorrect: trueCorrect,
                        time: digitMinutes + ":" + digitSeconds)));
          }
        },
        child: Container(
          width: 350,
          height: 70,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: 340,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: colorListFalse[indexAnswerColorFalseBefore] !=
                            Colors.white
                        ? colorListFalse[indexAnswerColorFalseBefore]
                        : ColorBot,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(seconds: 2),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                width: 340,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: colorListFalse[indexAnswerColorFalseBefore] !=
                          Colors.white
                      ? colorListFalse[indexAnswerColorFalseBefore]
                      : colorTop,
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
      onPressed: () {
        if (strName == "50/50") {
          indexRange1 = indexRand.nextInt(3);
          for (; indexRange1 == indexRange2;) {
            indexRange2 = indexRand.nextInt(3);
          }

          setState(() {
            colorListFalse[indexRange1] = Colors.grey;
            colorListFalse[indexRange2] = Colors.grey;
          });
        }
      },
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
  double point = 0;
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
        list.add(quizz(
          2,
          1,
          "Hưng luyện LQ 1 ngày bao nhiêu phút?",
          "60 phút",
          "180 phút",
          "20 phút",
          "Tính bằng tiếng chứ ai tính bằng phút",
          "Tính bằng tiếng chứ ai tính bằng phút",
          50,
          4,
        ));
        list.add(quizz(
          2,
          1,
          "Ếch diu en gì là gì?",
          "Ếch",
          "Frog",
          "Ếch giếng",
          "Hung",
          "Hung",
          50,
          4,
        ));
        list.add(quizz(
          2,
          1,
          "Quê Hưng ở đâu?",
          "Bình nhì",
          "Thạnh Nhựt",
          "Bình Định",
          "Bình Địa",
          "Thạnh Nhựt",
          70,
          4,
        ));
        list.add(quizz(
          2,
          1,
          "Value là gì?",
          "Giá trị",
          "Là Value",
          "Va liu",
          "Va lùa",
          "Va lùa",
          70,
          4,
        ));
        list.add(quizz(
          2,
          1,
          "Ngoài chơi game ra Hưng còn làm gì khác không?",
          "Làm bài tập",
          "Chạy deadline đồ án Thầy Nguyên",
          "Xem youtube",
          "Thôi kì lắm không trả lời đâu",
          "Thôi kì lắm không trả lời đâu",
          120,
          4,
        ));
        list.add(quizz(
          2,
          1,
          "Muốn lên Chợ gạo (Tiền Giang) thì chạy qua đâu",
          "Bình Nhì",
          "Bình Định",
          "Bình Địa",
          "Bình Thủy",
          "Bình Nhì",
          80,
          4,
        ));
        list.add(quizz(
          2,
          1,
          "Hưng từng Hack FaceBook của ai",
          "Sang (Nhóm Trưởng)",
          "Trân",
          "Em Gái",
          "Em Trai",
          "Sang (Nhóm Trưởng)",
          120,
          4,
        ));
        list.add(quizz(
          2,
          1,
          "Hưng có biết bơi không?",
          "Có",
          "Không",
          "Biết bơi ếch",
          "Thùng bia",
          "Thùng bia",
          230,
          4,
        ));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    if (firstLoad == true) {
      starTimer();
      firstLoad = false;
    }

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
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => ChooseCategories()),
                                  ),
                                );
                              },
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
                            Text('$digitMinutes:$digitSeconds'),
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
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.green,
                      valueColor: AlwaysStoppedAnimation(
                        Colors.white,
                      ),
                      strokeWidth: 2,
                      value: seconds / maxSecond,
                    ),
                    Text(
                      '$seconds',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
