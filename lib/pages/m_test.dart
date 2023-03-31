import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  int totalScore = 0;

  final List<Map<String, Object>> quizQuestions = [
    {
      'question': '1. Little interest or pleasure in doing things',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question': '2. Feeling down, depressed, or hopeless',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question': '3. Trouble falling or staying asleep, or sleeping too much',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question': '4. Feeling tired or having little energy',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question': '5. Poor appetite or overeating',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question':
          '6. Feeling bad about yourself - or that you are a failure or have let yourself or your family down',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question':
          '7. Trouble concentrating on things, such as reading the newspaper or watching television',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question':
          '8. Moving or speaking so slowly that other people could have noticed',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question':
          '9. Thoughts that you would be better off dead, or of hurting yourself',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
    {
      'question':
          '10. If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?',
      'options': [
        {'text': 'Not At ALL', 'score': 0},
        {'text': 'Several Days', 'score': 1},
        {'text': 'More Than Half The Days', 'score': 2},
        {'text': 'Nearly Every Day', 'score': 3},
      ],
    },
  ];

  void answerQuestion(int score) {
    setState(() {
      currentQuestionIndex++;
      totalScore += score;
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depression Test'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color.fromARGB(66, 12, 70, 118), Colors.purpleAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
        ),
      ),
      body: currentQuestionIndex < quizQuestions.length
          ? Container(
              width: 400,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/back.jpg"),
                    fit: BoxFit.cover),
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(60),
                //     bottomRight: Radius.circular(60)),
                color: Color.fromARGB(207, 48, 71, 246),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 110, left: 10, right: 10, bottom: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 350,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(12),
                        //   color: Colors.white,
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(
                            quizQuestions[currentQuestionIndex]['question']
                                .toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ...(quizQuestions[currentQuestionIndex]['options']
                            as List<Map<String, Object>>)
                        .map((option) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                width: 250,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 12,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      backgroundColor:
                                          Color.fromARGB(255, 93, 112, 254)),
                                  onPressed: () =>
                                      answerQuestion(option['score'] as int),
                                  child: Text(option['text'].toString()),
                                ),
                              ),
                            ))
                        .toList(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/back.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 250, left: 10, right: 10, bottom: 0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You have completed the quiz!',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Total score: $totalScore',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      if (totalScore == 0) ...[
                        Text('Seeming no dipression'),
                      ] else if (1 <= totalScore && totalScore <= 4) ...[
                        Text('Minimal depression'),
                      ] else if (5 <= totalScore && totalScore <= 9) ...[
                        Text('Mild depression'),
                      ] else if (10 <= totalScore && totalScore <= 14) ...[
                        Text('Moderate depression'),
                      ] else if (15 <= totalScore && totalScore <= 19) ...[
                        Text('Moderately severe depression'),
                      ] else if (20 <= totalScore && totalScore <= 30) ...[
                        Text('Severe depression'),
                      ],
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: resetQuiz,
                        style: ElevatedButton.styleFrom(
                            elevation: 12,
                            side:
                                BorderSide(width: 1, color: Colors.blueAccent),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Color.fromARGB(255, 93, 112, 254)),
                        child: Text('Restart Quiz'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
