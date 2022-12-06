import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/categories.dart';
import 'package:doan/choose_categories.dart';
import 'package:doan/result_answer.dart';
import 'package:doan/result_detail_object.dart';
import 'package:doan/result_object.dart';
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
  late List<ResultDetail> _lsresult_detail = [];
  late Query<Map<String, dynamic>> quizzs;

  var results = FirebaseFirestore.instance.collection('results');

  var resultsDetails = FirebaseFirestore.instance.collection('resultDetails');
  late Result _result;
  late String answerTrue;
  late int pointAnswer;
  late int count_results;
  void initState() {
    super.initState();

    count_results = DateTime.now().millisecondsSinceEpoch;
    switch (questionid) {
      case 1:
        {
          txtTitle = "Công nghệ";
          quizzs = FirebaseFirestore.instance
              .collection('quizzs')
              .where('fieldid', isEqualTo: 1)
              .orderBy('id');
        }
        break;
      case 2:
        {
          txtTitle = "Toán học";
          quizzs = FirebaseFirestore.instance
              .collection('quizzs')
              .where('fieldid', isEqualTo: 2)
              .orderBy('id');
        }
        break;
      case 3:
        {
          txtTitle = "Văn học";
          quizzs = FirebaseFirestore.instance
              .collection('quizzs')
              .where('fieldid', isEqualTo: 3)
              .orderBy('id');
        }
        break;
      case 4:
        {
          txtTitle = "Lịch sử";
          quizzs = FirebaseFirestore.instance
              .collection('quizzs')
              .where('fieldid', isEqualTo: 4)
              .orderBy('id');
        }
        break;
      case 5:
        {
          txtTitle = "Địa lí";
          quizzs = FirebaseFirestore.instance
              .collection('quizzs')
              .where('fieldid', isEqualTo: 5)
              .orderBy('id');
        }
        break;
      case 6:
        {
          txtTitle = "Đố vui";
          quizzs = FirebaseFirestore.instance
              .collection('quizzs')
              .where('fieldid', isEqualTo: 6)
              .orderBy('id');
        }
        break;
    }
  }

  //Trạng thái button item
  bool disableButton5050 = false;
  bool disableButtonGoiY = false;
  bool disableButtonThemThoiGian = false;
  bool disableButtonSkip = false;
  bool disableButtonNhanDoi = false;
  //Màu sắc câu trả lời sai
  List<Color> colorListFalse = [
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  //Kiểm tra nhân đôi điểm
  bool doublePoint = false;
  final indexRand = Random();
  //index câu trả lời sai
  int indexAnswerColorFalseAfter = 0;
  int indexAnswerColorFalseBefore = 0;
  //index random câu sai
  int indexRange1 = 0;
  int indexRange2 = 0;
  //Màu sắc câu đúng
  late Color trueAnswerColor = Colors.white;
  //Số câu đúng
  int trueCorrect = 0;
  //Kiểm tra load page lần đầu
  bool firstLoad = true;
  //Xác định thời gian hoàn thành phần chơi
  int secondsClock = 0, minutesClock = 0;
  String digitSeconds = "00";
  String digitMinutes = "00";
  //Thời gian max trả lời 1 câu hỏi
  static const int maxSecond = 30;
  //Thời gian đồng hồ trả lời câu hỏi
  int seconds = maxSecond;
  Timer? timer;
  //Kích hoạt thời gian
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
        trueAnswerColor = Colors.white;
        seconds = maxSecond;
      });

  void stopTimer() {
    timer?.cancel();
  }

  Future<int> countResultsDetails() async {
    AggregateQuerySnapshot query = await results.count().get();

    return query.count;
  }

  Future<int> countResults() async {
    AggregateQuerySnapshot query = await results.count().get();

    return query.count;
  }

  List<String> lstItem = [
    "50/50",
    "SKIP",
    "NHÂN ĐÔI",
    "GỢI Ý",
    "+30s",
  ];
  void chooseAnswer(String strAnswer) {
    _lsresult_detail.add(new ResultDetail(
        id: DateTime.now().millisecondsSinceEpoch,
        resultid: count_results,
        quizzid: index + 1,
        result: strAnswer,
        point: strAnswer == answerTrue
            ? (pointAnswer / maxSecond * seconds * 2).round()
            : 0,
        status: true));

    if (strAnswer == answerTrue) {
      questionPresent += 1;
      trueCorrect++;
      if (doublePoint == true) {
        point = point + (pointAnswer / maxSecond * seconds * 2).round();
        doublePoint = false;
      } else
        point = point + (pointAnswer / maxSecond * seconds).round();
      index++;
      resetTimer();
      setState(() {
        trueAnswerColor = Colors.white;
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
    if (strAnswer == answerTrue) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextButton(
          onPressed: () {
            if (index < 9) {
              chooseAnswer(strAnswer);
            }
            if (index == 9) {
              chooseAnswer(strAnswer);

              results.add({
                'id': count_results,
                'fieldid': questionid,
                'userid': 1,
                'point': point,
                'pointChao': point,
                'testtime': secondsClock + minutesClock * 60,
                'createdate': DateTime.now(),
                'status': true,
              });
              for (int i = 0; i < _lsresult_detail.length; i++) {
                resultsDetails.add({
                  'id': _lsresult_detail[i].id,
                  'quizzid': questionid,
                  'resultid': count_results + 1,
                  'result': _lsresult_detail[i].result,
                  'point': _lsresult_detail[i].point,
                  'status': _lsresult_detail[i].status,
                });
              }
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
                    duration: Duration(seconds: 1),
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: trueAnswerColor == Colors.white
                          ? ColorBot
                          : trueAnswerColor,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  width: 340,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: trueAnswerColor == Colors.white
                        ? colorTop
                        : trueAnswerColor,
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
                  duration: Duration(seconds: 1),
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
                duration: Duration(seconds: 1),
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
      onPressed: () async {
        if (strName == "50/50") {
          if (disableButton5050 == true) {
            return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Bạn đã dùng quyền trợ giúp " + strName + " rồi!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          } else {
            indexRange1 = indexRand.nextInt(3);
            for (; indexRange1 == indexRange2;) {
              indexRange2 = indexRand.nextInt(3);
            }
            setState(() {
              disableButton5050 = true;
              colorListFalse[indexRange1] = Colors.grey;
              colorListFalse[indexRange2] = Colors.grey;
            });
          }
        }
        if (strName == "GỢI Ý") {
          if (disableButtonGoiY == true) {
            return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Bạn đã dùng quyền trợ giúp " + strName + " rồi!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          } else {
            setState(() {
              disableButtonGoiY = true;
              trueAnswerColor = Colors.green;
            });
          }
        }
        if (strName == "+30s") {
          if (disableButtonThemThoiGian == true) {
            return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Bạn đã dùng quyền trợ giúp " + strName + " rồi!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          } else {
            seconds += 30;
            setState(() {
              disableButtonThemThoiGian = true;
            });
          }
        }
        if (strName == "NHÂN ĐÔI") {
          if (disableButtonNhanDoi == true) {
            return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Bạn đã dùng quyền trợ giúp " + strName + " rồi!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          } else {
            doublePoint = true;
            setState(() {
              disableButtonNhanDoi = true;
            });
          }
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

    if (questionid == 2) {}
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
              Expanded(
                child: StreamBuilder(
                  stream: quizzs.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      answerTrue = documentSnapshot['result'];
                      pointAnswer = documentSnapshot['point'];

                      return ListView(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: 30),
                            padding: const EdgeInsets.only(left: 47),
                            child: Text(
                              documentSnapshot['question'],
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _buttonAnswer(
                              documentSnapshot['answerA'],
                              Color.fromARGB(255, 134, 168, 69),
                              Color.fromARGB(255, 110, 140, 54)),
                          _buttonAnswer(
                            documentSnapshot['answerB'],
                            Color.fromARGB(255, 162, 216, 159),
                            Color.fromARGB(255, 136, 183, 134),
                          ),
                          _buttonAnswer(
                            documentSnapshot['answerC'],
                            Color.fromARGB(255, 244, 191, 61),
                            Color.fromARGB(255, 216, 180, 94),
                          ),
                          _buttonAnswer(
                            documentSnapshot['answerD'],
                            Color.fromARGB(255, 255, 107, 108),
                            Color.fromARGB(255, 206, 86, 87),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
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
