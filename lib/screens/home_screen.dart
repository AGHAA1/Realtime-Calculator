import 'package:flutter/material.dart';
import 'package:calculator_app/components/useable_components.dart';
import 'package:calculator_app/calculatorBrain.dart';
import 'package:calculator_app/display_expression_format.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen ({super.key});

  @override
  State <HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State <HomeScreen> {

  String displayExpression = '';

  String realTimeExpression = '';

  CalculatorBrain calculatorBrain = CalculatorBrain();
  ///checks if user enters double operators consecutively;




  /////////////////////////////////
  @override
  Widget build (BuildContext context) {



    return Column (

      children : [



        Expanded(
          child: Column(
            children: [

              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x5089C763),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Color(0x4089C763))
                    ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.bottomRight,
                    width: double.infinity,
                    child: Text (
                      displayExpression,
                      style: TextStyle(color: Colors.white, fontSize: 35),

                    )
                  ),
                ),
              ),
              Expanded(

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.bottomRight,
                    color: Colors.black,
                    width: double.infinity,
                    child: Text (
                      realTimeExpression,
                      style: TextStyle(color: Colors.white, fontSize: 25),

                    )
                ),
              ),
            ],
          ),
        ),




        Expanded(

          flex: 2,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0x9035495C),),

            padding: EdgeInsets.all(12), //gives padding to container and padding is always inside unlike margin which is outside
            child: Column (

              children: [

                Expanded(
                  child: Row (

                    children: [

                      CreateCalculatorButtons(buttonText: 'C', onPressedFunc: () {
                        setState(() {
                          displayExpression = '';
                          realTimeExpression = '';
                          CalculatorBrain.instance.clearInternalExpression(); //this method is from displayExpressionFormat which then clears out internalExpression from expression solver.
                        });

                      }, textStyle: TextStyle(fontSize: 50, color: Colors.red)),


                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (displayExpression.isNotEmpty) {
                                  //first we check isNotEmpty then we remove last char of the string.
                                  displayExpression = displayExpression.substring(0, displayExpression.length-1);
                                  CalculatorBrain.instance.updateInternalCalculator('del'); //this will delete from internalExpression
                                  realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression();
                                }
                              });
                            },
                            child: Icon(Icons.backspace, size: 30 )
                          ),
                        ),
                      ),



                      CreateCalculatorButtons(buttonText: '/', onPressedFunc: () {
                        setState(() {

                          String newDispExpression = checkOperatorsFormat(displayExpression, '/');
                          if (newDispExpression  == 'null') {
                            displayExpression += '/';
                          }else {
                            displayExpression = newDispExpression;
                          }

                        });
                      } , textStyle: TextStyle(fontSize: 40, color: Colors.white)),
                    ]
                  ),
                ),

                Expanded(
                  child: Row (
                      children: [
                        CreateCalculatorButtons(buttonText: '7', onPressedFunc: () {
                          setState(() {
                           displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '7');

                           realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed

                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),

                        CreateCalculatorButtons(buttonText: '8', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '8');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed

                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                        CreateCalculatorButtons(buttonText: '9', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '9');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed

                          });

                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                        CreateCalculatorButtons(buttonText: 'x', onPressedFunc: () {
                          setState(() {
                            String newDispExpression = checkOperatorsFormat(displayExpression, 'x');
                              if (newDispExpression  == 'null') {
                                displayExpression += 'x';
                              }else {
                                displayExpression = newDispExpression;
                              }
                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),
                      ]
                  ),
                ),

                Expanded(
                  child: Row (
                      children: [
                        CreateCalculatorButtons(buttonText: '4', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '4');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed
                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                        CreateCalculatorButtons(buttonText: '5', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '5');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed
                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                        CreateCalculatorButtons(buttonText: '6', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '6');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed
                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                        CreateCalculatorButtons(buttonText: '-', onPressedFunc: () {
                          setState(() {

                            String newDispExpression = checkOperatorsFormat(displayExpression, '-');

                            if (newDispExpression == 'null') {
                              displayExpression += '-';
                            }else {
                              displayExpression = newDispExpression;
                            }


                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                      ]
                  ),
                ),

                Expanded(
                  child: Row (
                      children: [
                        CreateCalculatorButtons(buttonText: '1', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '1');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed

                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),



                        CreateCalculatorButtons(buttonText: '2', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '2');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed
                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),



                        CreateCalculatorButtons(buttonText: '3', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '3');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed
                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                        CreateCalculatorButtons(buttonText: '+', onPressedFunc: () {
                          setState(() {
                            String newDispExpression = checkOperatorsFormat(displayExpression, '+');

                            if (newDispExpression == 'null') {
                              displayExpression += '+';
                            }else {
                              displayExpression = newDispExpression;
                            }


                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                      ]
                  ),
                ),

                Expanded(
                  child: Row (
                      children: [
                        CreateCalculatorButtons(buttonText: '0', onPressedFunc: () {
                          setState(() {
                            displayExpression = checkPercentageAndNumberDisplayFormat(displayExpression, '0');
                            realTimeExpression = CalculatorBrain.instance.calculateRealTimeExpression(); //this calculates real time expression when button gets pressed



                          });
                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                        CreateCalculatorButtons(buttonText: '.', onPressedFunc: () {
                          setState(() {
                            String newDispExpression = checkOperatorsFormat(displayExpression, '.');


                            if (newDispExpression == 'null') {// we will get null if display text is empty and user presses '.'

                              displayExpression += '0.'; // put 0. instead of dot if newDispExpression is null

                            }else {
                              displayExpression =
                                  newDispExpression; // if it is not null then we set displayExpression to newDispExpression that we got format class

                            }
                            });


                        }, textStyle: TextStyle(fontSize: 40, color: Colors.white)),


                        CreateCalculatorButtons(buttonText: '=', onPressedFunc: () {

                          setState(() {

                            String result = CalculatorBrain.instance.calculateInternalExpression();
                            displayExpression = result;
                          });
                        }, textStyle: TextStyle(fontSize: 50, color: Colors.green)),


                      ]
                  ),
                ),

              ]
            ),
          ),
        ),


      ]
    );
  }
}


