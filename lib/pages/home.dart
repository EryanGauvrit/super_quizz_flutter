import 'package:flutter/material.dart';
import 'package:super_quizz/question.dart';
import '../helpers/navigationHelpers.dart';
import '../question.dart';

class Home extends StatefulWidget {
  const Home({super.key, required int nbrQuestion});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  NavigatorHelper navigatorHelper = NavigatorHelper();

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.lightBlueAccent,
        child: Padding(
        padding: const EdgeInsetsDirectional.all(15),
          child: Column(
            children: [
              Image.asset(
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.fitWidth,
                  '../assets/quiz.png'
              ),
              ElevatedButton(
                  onPressed: () {
                    navigatorHelper.toSpecificPage(context: context, widget: widget);
                  },
                  child: const Text("Start the quizz !")
              )
            ],
          ),
        ),
    );
  }
}