class quizz {
  late int quizzid;
  late int fieldid;
  late String question;
  late String answerA;
  late String answerB;
  late String answerC;
  late String answerD;
  late String result;
  late int maxpoint;
  late int minpoint;
  quizz(quizzid, fieldid, question, answerA, answerB, answerC, answerD, result,
      maxpoint, minpoint) {
    this.quizzid = quizzid;
    this.fieldid = fieldid;
    this.question = question;
    this.answerA = answerA;
    this.answerB = answerB;
    this.answerC = answerC;
    this.answerD = answerD;
    this.result = result;
    this.maxpoint = maxpoint;
    this.minpoint = minpoint;
  }
  List<quizz> createList(int id) {
    var list;
    return list;
  }

  void quizzEqual(quizz quizz) {
    this.answerA = quizz.answerA;
    this.fieldid = quizz.fieldid;
  }
}
