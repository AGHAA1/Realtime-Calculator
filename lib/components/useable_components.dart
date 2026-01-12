import 'package:flutter/material.dart';


class CreateCalculatorButtons extends StatelessWidget{


  const CreateCalculatorButtons({super.key, required this.buttonText, required this.onPressedFunc, required this.textStyle});
  final String buttonText;
  final VoidCallback onPressedFunc;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: EdgeInsets.zero,
              backgroundColor: Color(0x70576D7E),
              fixedSize: Size(10, 70)
          ),


          onPressed: onPressedFunc,
          child: Text(
            buttonText  ,
            style: textStyle
          ),

        ),
      ),
    );
  }
}