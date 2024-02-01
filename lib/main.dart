import 'package:flutter/material.dart';
import 'package:super_quizz/question.dart';
import 'pages/question.dart';
import 'question.dart';
import 'helpers/navigationHelpers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String title = "Score";
  int scoreCount = 0;
  String titlePage = "Quiz time";

  NavigatorHelper navigatorHelper = NavigatorHelper();
  QuestionData questionData = QuestionData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          titlePage,
          style: const TextStyle(
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Card(
          color: Colors.lightBlueAccent,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(15),
            child: Column(
              children: [
                Image.asset(
                    width: 400.0,
                    height: 400.0,
                    fit: BoxFit.fitWidth,
                    'assets/quiz.png'
                ),
                ElevatedButton(
                    onPressed: () {
                      navigatorHelper.toSpecificPage(context: context, widget: const QuestionPage(nbrQuestion: 0, score: 0));
                    },
                    child: const Text("Start the quizz !")
                )
              ],
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}
