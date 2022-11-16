import 'package:doan/choose_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnswerResult extends StatefulWidget {
  double point;
  int trueCorrect;
  String time;
  AnswerResult(
      {required this.point, required this.trueCorrect, required this.time});
  @override
  State<AnswerResult> createState() =>
      _AnswerResultState(point: point, trueCorrect: trueCorrect, time: time);
}

class _AnswerResultState extends State<AnswerResult>
    with TickerProviderStateMixin {
  double point;
  int trueCorrect;
  String time;
  _AnswerResultState(
      {required this.point, required this.trueCorrect, required this.time});
  late AnimationController _animationController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 242, 253, 255),
        padding: EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: 0,
              left: 0,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector1.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              top: 40,
              right: 70,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector2.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              bottom: 100,
              right: 12,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector3.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              top: 120,
              left: 149,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector2.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              bottom: 137,
              left: 12,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector7.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              top: 149,
              left: 12,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector8.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              top: 240,
              right: 156,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector3.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              bottom: 0,
              right: 178,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector5.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              bottom: 236,
              left: 353,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector3.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              top: 325,
              left: 179,
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/curves/vector8.png'),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              child: ScaleTransition(
                scale: animation,
                child: SizedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/curves/girl.png'),
                        SizedBox(
                          height: 45,
                          width: 20,
                        ),
                        Text(
                          'CONGRATS',
                          style: TextStyle(
                            color: Color.fromARGB(199, 30, 30, 30),
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                        Column(
                          children: [
                            Text("Hoàn thành: $trueCorrect/10"),
                            Text("Điểm: $point"),
                            Text("Thời gian hoàn thành: $time"),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChooseCategories(),
                                ));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 134, 241, 211),
                            ),
                          ),
                          child: Text(
                            'Tiếp tục',
                            style: TextStyle(
                              color: Color.fromARGB(199, 30, 30, 30),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 175,
                          width: 20,
                        ),
                        SizedBox(
                          height: 45,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
