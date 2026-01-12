


import 'package:calculator_app/calculatorBrain.dart';


List <String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];





String switchOperators (String displayExpression, String operator, lastCharIndex) {

  CalculatorBrain.instance.updateInternalCalculatorFormat(operator);

  return displayExpression = displayExpression.replaceRange(
      lastCharIndex, lastCharIndex + 1, operator);
}


String checkSecondLastChar (String displayExpression, String secondLastChar, int lastCharIndex, String operator) {

    if(secondLastChar == 'x'|| secondLastChar == '/'){
      return displayExpression;
    }else {
      String expressionAfterOperatorSwitch = switchOperators(displayExpression, operator, lastCharIndex); //this will switch operators
      return expressionAfterOperatorSwitch;
    }


}

//this function will not execute for number buttons
String checkOperatorsFormat (String displayExpression, String operator) {
  //List<String> numbers = ['1','2','3','4','5','6','7','8','9','0']; //created list of numbers because i cant enter (if statement) that checks lastChar as i want to only add dot when last char is a number...

  if (displayExpression != '') {
    String lastChar = displayExpression[displayExpression.length - 1];

    int lastCharIndex = displayExpression.length - 1;
    String secondLastChar = '';

    if (displayExpression.length > 1) { // if length is more than 1 only then we can store 2nd last value
      secondLastChar= displayExpression[lastCharIndex - 1]; //storing second last char for multiply and divide edge case
    }





//    if (lastChar == '+' || lastChar == '-' || lastChar == 'x' || lastChar == '/' || lastChar == '.' ||  numbers.contains(lastChar)) {

    //we enter here only if lastChar is one of above because if displayExpression already has above and user tried to add that operator or dot again then its bad
    switch (operator) {


      case '+': // this executes if user pressed + button which is being stored inside operator variable
        if (lastChar == operator) { //if lastChar is == '+' then we simply return what was on the screen no need to add double + operators
          return displayExpression; //returns string as is because last char is same as user pressing
        } else if (lastChar == '-') {
          //if lastChar was '-' and user pressed '+' then we simply replace '-' with '+' no point in putting negative and positive operators side by side

          String expressionAfterOperatorSwitch = switchOperators(displayExpression, '+', lastCharIndex);
          return expressionAfterOperatorSwitch;

        }else {
          //this means we have a number and we can show operator
          CalculatorBrain.instance.updateInternalCalculator(operator);
          return displayExpression+='+';
        }

        break; // if above case was true and everything executes in that code block then simply break switch statement.


      case '-': // same here but opposite just read comments for '+' case
        if (lastChar == operator) {
          return displayExpression;

        } else if (lastChar == '+') {
          String expressionAfterOperatorSwitch = switchOperators(displayExpression, '-', lastCharIndex);
          return expressionAfterOperatorSwitch;

        }else {
          //this means we have a number and we can show operator
          CalculatorBrain.instance.updateInternalCalculator(operator);
          return displayExpression+='-';
        }

        break;


      case 'x' : // same logic like above cases
        if (lastChar == operator) {
          return displayExpression;
        } else if (lastChar == '/' || lastChar == '-' || lastChar == '+') {


          String updatedDisplayExpression = checkSecondLastChar(displayExpression, secondLastChar, lastCharIndex, 'x');//calling function that will check secondLastChar and then after checking format we display
          return updatedDisplayExpression;


        }else {
          //this means we have a number and we can show operator
          CalculatorBrain.instance.updateInternalCalculator('*'); //also changing internal calculator format and passing * sign not x
          return displayExpression+='x';
        }

        break;


      case '/' : //same logic like above cases.
        if (lastChar == operator) {
          return displayExpression;

        } else if (lastChar == 'x' || lastChar == '-' || lastChar == '+') {

         String updatedDisplayExpression = checkSecondLastChar(displayExpression, secondLastChar, lastCharIndex, '/'); //calling function that will check secondLastChar and then after checking format we display
          return updatedDisplayExpression;

        }else {
          //this means we have a number and we can show operator
          CalculatorBrain.instance.updateInternalCalculator(operator);
          return displayExpression+='/';
        }

        break;



      case '.':
        if (lastChar ==
            operator) { // if lastChar == '.' then we do not put more dots just return back what is already being showed on screen
          return displayExpression;
          //below we make sure that lastChar is no operators and dot only then dot can be displayed
        } else if (numbers.contains(lastChar)) { //
          displayExpression += '.'; //display dot only when above condition is true
          CalculatorBrain.instance.updateInternalCalculator(operator);
          return displayExpression;
        }else {

          CalculatorBrain.instance.updateInternalCalculator('0.');
          return displayExpression+='0.';
        }

//lastChar != '+' && lastChar != '-' && lastChar != 'x' &&
//             lastChar != '/' && lastChar != '.' && lastChar != '%'
        break;

      // case '%':
      //   if (lastChar == operator) { // if lastChar == '.' then we do not put more dots just return back what is already being showed on screen
      //     return displayExpression;
      //     //below we make sure that lastChar is no operators and dot only then dot can be displayed
      //   }else {
      //     //this means we have a number and we can show operator
      //
      //     return displayExpression+='%';
      //   }
    }
  }

  // }



// this return also executes when no conditions was met inside switch statement case so we return null if condition had met we return from there which exists whole function and this return null doesnt get executed
  return ''; // if displayExpression was empty when user tried to press any operator then dont show him anything

}










//function that will add mutliple sign before modulo operator because 5%10 means 5%*10 and modulo later will be converted into /100 so final expression will be in this case 5/100*10
String checkPercentageAndNumberDisplayFormat (String displayExpression, number) {

  if (displayExpression.isNotEmpty) { //only check if there is expression inside displayExpression
    String lastChar = displayExpression[displayExpression.length - 1]; //storing last char of the displayExpression
    if (lastChar == '%') {

      CalculatorBrain.instance.updateInternalCalculator('*$number');

      return displayExpression += 'x$number'; //if lastChar is % then our we automatically add multiplication sign after modulo before number pressed

    }else {

      CalculatorBrain.instance.updateInternalCalculator('$number');
      return displayExpression += number; //if lastChar is something else than just display whatever it is in the string including number pressed
    }
  }else {
    CalculatorBrain.instance.updateInternalCalculator('$number');
    return displayExpression += number;
  }

}

