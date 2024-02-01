import 'package:flutter/material.dart';
import '../helpers/navigationHelpers.dart';
import '../pages/question.dart';

SimpleDialog showResponseDialog({
  required String title,
  required String response,
  required String media,
  required int nextQuestionNbr,
  required int score,
  // required BuildContext context
}) {

  NavigatorHelper navigatorHelper = NavigatorHelper();

  bool isEndGame (int nbr) {
    if(nbr == 10){
      return true;
    }else{
      return false;
    }
  }

  return SimpleDialog(
    title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold
      ),
    ),
    contentPadding: const EdgeInsetsDirectional.all(25),
    elevation: 12,
    alignment: AlignmentDirectional.center,
    children: [
      Image.asset(
        media,
        width: 400.0,
        height: 300.0,
        fit: BoxFit.fitWidth,
      ),
      Text(
        response,
        textAlign: TextAlign.center,
      ),
      const Divider(),
      FloatingActionButton(
        onPressed: () {
          //navigatorHelper.toSpecificPage(context: context, widget: QuestionPage(nbrQuestion: nextQuestionNbr, score: score));
        },
        child: const Text( "Prochaine question !" ),
      )
    ],
  );
}