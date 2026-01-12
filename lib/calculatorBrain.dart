
import 'package:math_expressions/math_expressions.dart';


class CalculatorBrain {

  CalculatorBrain._internal(); //this will create only single instance of calculator and we can use it throughout the app
  static final CalculatorBrain instance = CalculatorBrain._internal();

  String internalExpression = ''; // this expression will remain internal and will be shown only when user press '='

  ExpressionParser parser = GrammarParser(); //from package math_expressions
  RealEvaluator evaluator = RealEvaluator();



  List <String> operators = ['+', '-', 'x', '/', '%'];
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  CalculatorBrain();
  num expressionEvaluator(String internalExpression) {
    try  {
      Expression parsedExpression = parser.parse(internalExpression);
      return evaluator.evaluate(parsedExpression);
    }catch(e) {
      print('problem while evaluating expression $e');
      return 0.0;
    }

  }


  // this function switches operators if user enters - after + then it switches and also with / and *
  void updateInternalCalculatorFormat(String operator) {
    internalExpression = internalExpression.replaceRange(
        internalExpression.length - 1, internalExpression.length, operator);
  }


  //this func keeps executing as user presses button and we keep on adding to internal expression this will only add what is displayed to screen no double operators can be added here
  // because we handle that inside DisplayExpressionFormat file so it wont let
  // user to screen and hence here in internal expression
  void updateInternalCalculator(String char) {
    if (char != 'del') {
      internalExpression += char;  // if not del then add char to internal expression
      print(internalExpression);
    } else {
      // if user presses del then char holds 'del' then we check if there is only one digit then simply empty string
      // else remove using substring
      if (internalExpression.length ==
          1) { // if internal expression only has 1 digit we just make out internal back to empty

        internalExpression = '';
      } else {
        internalExpression = internalExpression.substring(
            0, internalExpression.length - 1); //this will keep executing
        // unless there is only 1 digit left in internal expression because cant give range
        print(internalExpression);
      }
    }
  }


  //this func executes when user presses Clear and we set internal expression to empty String
  void clearInternalExpression() {
    internalExpression = '';
  }


  //this function executes when user presses equal button and it evaluates everything inside internal expression and returns back
  String calculateInternalExpression() {
    String result = expressionEvaluator(internalExpression).toString();

    internalExpression =
        result; //once user presses equal we change our internalExpression to result
    print(internalExpression);
    calculateRealTimeExpression();
    return result;
  }





  //this function calculates realtime calculation
  String calculateRealTimeExpression() {
    // we are just passing internal expression to evaluator
    // every time user press a number no need to change internal expression unless user presses equal


    if (internalExpression
        .isNotEmpty) { // only execute if internal expression is not empty.
      // we first take last char in out internal expression
      String lastChar = internalExpression.substring(internalExpression.length - 1, internalExpression.length);
      int lastCharIndex = internalExpression.length - 1;

      if (numbers.contains(lastChar)) { //if lastChar is a number then we can evaluate it
        String result = expressionEvaluator(internalExpression).toString();
        return result;
      } else {
        // it means lastChar is either dor or any operator then we can substring expression before evaluating
        //but before that we have a edge case 2nd last char might be / or x because user can do (5x+3 or 5/-3)
        // so when user removes 1 digit we get 5x+ and now we cannot evaluate realTime expression
        //this is needed because when user presses delete and lastchar is operator then we wont be able to perform realtime calculation
        // so instead we skip lastChar which is operator and evaluate the remaining and show it on screen

        String secondLastChar = internalExpression[internalExpression.length-2];
        int secondLastCharIndex = internalExpression.length-2;

        // here we check if 2nd last char is either / or * then we substring accordingly to evaluate
        if (secondLastChar != '/' && secondLastChar != '*') { //remember inside this file calculatorBrain i am storing x as * because our parser does not know x

          String result = expressionEvaluator(internalExpression.substring(0, lastCharIndex)).toString();
          return result;
        }else {
          String result = expressionEvaluator(internalExpression.substring(0, secondLastCharIndex)).toString();
          return result;
        }

      }
    }

    return ''; // if internal expression is empty then return empty string

  }


}




