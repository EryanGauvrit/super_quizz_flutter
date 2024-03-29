import 'package:flutter/material.dart';
import '../question.dart';
//import '../dialog/dialog.dart';
import '../helpers/navigationHelpers.dart';
import '../main.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.nbrQuestion, required this.score});

  final int nbrQuestion;
  final int score;

  @override

  Widget build(BuildContext context) {

    QuestionData questionData = QuestionData();

    Question question = questionData.questionList[nbrQuestion];
    NavigatorHelper navigatorHelper = NavigatorHelper();

    /***********     End Game Dialog     **********/
    SimpleDialog showEndGameDialog({
      required int score,
      // required BuildContext context
    }) {
      String title = "Honorable ! Ton score : $score";
      String media = "assets/result-sup-5.gif";

      if(score <= 4 ){
        title = "C'est naze ! Ton score : $score";
        media = "assets/result-und-5.gif";
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
          FloatingActionButton(
            onPressed: () {
              navigatorHelper.toSpecificPage(context: context, widget: MyHomePage());
            },
            child: const Text( "Recommencer une partie !" ),
          )
        ],
      );
    }
    /***********   end of  End Game Dialog     **********/

    /***********    Open End Game Dialog function     **********/
    Future<void> sendEnGameDialog () async {
      await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext buildContext) {
            return showEndGameDialog(
              score: score,
              // context: buildContext
            );
          }
      );
    }
    /***********     end of Open End Game Dialog function     **********/

    /***********    Response Dialog     **********/
    SimpleDialog showResponseDialog({
      required String title,
      required String response,
      required String media,
      required int nextQuestionNbr,
      required int score,
      // required BuildContext context
    }) {

      return SimpleDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        elevation: 12,
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            media,
            width: 400.0,
            height: 200.0,
            fit: BoxFit.fitWidth,
          ),
          Text(
            response,
            textAlign: TextAlign.center,
          ),
          const Divider(),
          FloatingActionButton(
            onPressed: () {
              if(nextQuestionNbr != 10){
                navigatorHelper.toSpecificPage(context: context, widget: QuestionPage(nbrQuestion: nextQuestionNbr, score: score));
              }else{
                sendEnGameDialog();
              }

            },
            child: const Text( "Prochaine question !" ),
          )
        ],
      );
    }

    /***********    end of Response Dialog     **********/

    /***********    Open Response Dialog function     **********/
    Future<void> sendResponse (bool userResponse) async {
      if(question.response == userResponse){
        await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext buildContext) {
              return showResponseDialog(
                title: "Bonne réponse !",
                media: 'assets/oui.gif',
                response: question.explanation,
                nextQuestionNbr: nbrQuestion + 1,
                score: score + 1,
                // context: buildContext
              );
            }
        );
      }else {
        await showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext buildContext) {
              return showResponseDialog(
                title: "Dommage !",
                media: 'assets/non.gif',
                response: question.explanation,
                nextQuestionNbr: nbrQuestion + 1,
                score: score,
                //context: buildContext
              );
            }
        );
      }
    }
    /***********    end of Open Response Dialog function     **********/

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          "Score : $score",
          style: const TextStyle(
              letterSpacing: 1.5
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Question  n°${nbrQuestion + 1} / 10",
              style: const TextStyle(
                fontSize: 18
              ),
            ),
            CircleAvatar(
                radius: 185,
                backgroundColor: Colors.blueGrey,
                child: CircleAvatar(
                    radius: 180,
                    backgroundImage: AssetImage(question.imagePath)
                ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
                 child: Text(
                   question.question,
                   textAlign: TextAlign.center,
                   style: const TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18,
                   ),
                 ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      sendResponse(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 35, vertical: 15)
                    ),
                    child: const Text(
                        "Vrai !",
                        style: TextStyle(
                            color: Colors.white,

                        )
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      sendResponse(false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 35, vertical: 15)
                    ),
                    child: const Text(
                        "Faux !",
                        style: TextStyle(
                            color: Colors.white
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
