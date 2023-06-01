import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:highlight_text/highlight_text.dart';
import 'result.dart';

void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  Color col = Colors.blue;
  Color col2 = Colors.blue;
  Color col3 = Colors.blue;


  String equation = "0";
  String result = "0";

  String first_operaand = "0";
  String second_operand = "0";
  String operator = "-";
  bool flag = false;
  String expression = "";
  double equationFontSize = 30.0;
  double resultFontSize = 30.0;

  buttonPressed(String buttonText){
    setState(() {
      if(!flag && (buttonText!='+' && buttonText!='-' &&
          buttonText != '×' && buttonText
          != '÷' )) {
        if(first_operaand== '0'){
          first_operaand=buttonText;
        }
        else {
          first_operaand+=buttonText;
        }
      }
        if(buttonText == '×' || buttonText
          == '÷' || buttonText == '+' || buttonText == '-') {
        setState(() {
          flag = true;
          operator = buttonText;
        });
      }
      if(flag == true) {
        if((buttonText!='+' && buttonText!='-' &&
            buttonText != '×' && buttonText
            != '÷' )) {
          print(buttonText);
          if (second_operand == '0') {
            second_operand = buttonText;
          }
          else {
            second_operand += buttonText;
          }
        }
        }
      if(buttonText == "C"){
        first_operaand = '0';
        second_operand = '0';
        flag = false;
        equation = "0";
        result = "0";
        operator = "NULL";
        col = Colors.blue;
        col2 = Colors.blue;
        col3 = Colors.blue;
        equationFontSize = 30.0;
        resultFontSize = 40.0;
      }

      else if(buttonText == "⌫") {
        first_operaand = '0';
        second_operand = '0';
        flag = false;
        equation = "0";
        result = "0";
        operator = "NULL";
        col = Colors.white;
        col2 = Colors.white;
        col3 = Colors.white;
        equationFontSize = 30.0;
        resultFontSize = 40.0;
      }
      else if(buttonText == "="){

        equationFontSize = 30.0;
        resultFontSize = 40.0;

        expression = equation;
        print(equation);

        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';

        Navigator.push(context, MaterialPageRoute(builder: (context) => result_(result)));

      }

      else{

        equationFontSize = 30.0;
        resultFontSize = 40.0;
        if(equation == "0"){
          equation = buttonText;
        }else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: Colors.grey,
      child: ElevatedButton (
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: Colors.white
            ),
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: <Widget>[


          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              color: col2,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(first_operaand, style: TextStyle(fontSize: equationFontSize),),
          ),
          Container(

            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(operator, style: TextStyle(fontWeight: FontWeight.bold, fontSize: equationFontSize),),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              color: col3,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(second_operand, style: TextStyle(fontSize: resultFontSize),),
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .55,
                child: Table(
                  children: [

                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.white),
                          buildButton("8", 1, Colors.white),
                          buildButton("9", 1, Colors.white),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.white),
                          buildButton("5", 1, Colors.white),
                          buildButton("6", 1, Colors.white),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.white),
                          buildButton("2", 1, Colors.white),
                          buildButton("3", 1, Colors.white),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.white),
                          buildButton("0", 1, Colors.white),
                          buildButton("00", 1, Colors.white),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("C", 1, Colors.white),
                          buildButton("⌫", 1, Colors.white),
                          buildButton("=", 1, Colors.white),
                        ]
                    ),

                  ],
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("×", 1, Colors.grey),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.grey),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.grey),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("÷", 2, Colors.grey),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}

