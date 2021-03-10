import 'package:flutter/material.dart';
import 'package:flutter_first_app/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
void main() => runApp(Calc());

    class Calc extends StatelessWidget{

      @override
      Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );//Material App
        throw UnimplementedError();
      }
    }

    class HomePage extends StatefulWidget{
    @override
    _HomePageState createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage>{

      final List<String> buttons =
      [
        "C" , "<=" , "%" , "/",
        "7" , "8" , "9" , "*",
        "4" , "5" , "6" , "-",
        "1" , "2" , "3" , "+",
        "00" , "0" , "." , "=",
      ];

      var userQuestion = "Hello";
      var userAnswer = "Answer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body:Column(
        children: <Widget>[
          Expanded(
              child: Container(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                        child: Text(userQuestion,
                          style: TextStyle(color: Colors.white, fontSize: 25),)),
                    Container(alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(20),
                        child: Text(userAnswer,
                      style: TextStyle(color: Colors.white,fontSize: 25),))
                    // Text(userQuestion, style: TextStyle(color: Colors.white),),
                    // Text(userAnswer, style: TextStyle(color: Colors.white),)
                  ],
                ),
              )
          ),
          Expanded(
            flex: 3,
              child: Container(color: Colors.black12,
              //create buttons here
              child: GridView.builder(
                itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),

                  itemBuilder: (BuildContext context, int index){

                  if(index == 0){
                    //Clear all questions
                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                          userQuestion = "";
                        });
                      },
                        buttonText: buttons[index],
                        color: Colors.white12,
                        textColor: Colors.white, );
                  }else if(index == 1){ // DEL LAST SYMBOL
                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                          userQuestion = userQuestion.substring(0, userQuestion.length-1 );
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.white12,
                      textColor: Colors.white, );
                  }
                  else if(index == buttons.length-1){  // MODE
                    return MyButton(
                      buttonTapped: (){
                        equalVoid();
                      },
                      buttonText: buttons[index],
                      color: Colors.white24,
                      textColor: Colors.white, );
                  }
                  else{
                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                    buttonText: buttons[index],
                    color: !isOperator( buttons[index]) ? Colors.white24 : Colors.orange,
                    textColor: !isOperator(buttons[index]) ? Colors.white : Colors.black,
                    ); }



                  }),
              )
          ),
        ],
      ),
    );
  }

  bool isOperator(String x){
    if(x == '-' || x == '+' || x == '*' || x == '/'){
      return true;
    }
    return false;
  }

  void equalVoid(){
    String lastQuestion = userQuestion;
      Parser p = Parser();
      Expression exp = p.parse(lastQuestion);
      ContextModel contextModel = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, contextModel);

      userAnswer = eval.toString();
  }
  }
