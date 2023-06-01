import 'package:flutter/material.dart';
import 'main.dart';
import 'package:highlight_text/highlight_text.dart';

class result_ extends StatelessWidget {
  static const routename = '/result.dart';
  final String ans;

  result_(this.ans);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(appBar: AppBar(title: Text('Result')),
        body: myhomepage(ans),
      ),
    );
  }
}

class myhomepage extends StatelessWidget {
  final String ans;
  myhomepage(this.ans);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      SizedBox(height: 100,),
      Container(
        margin: EdgeInsets.only(right: 300, left: 300),
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.grey,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Center(child: Text(ans, style: TextStyle(fontSize: 20),),),
      ),
      Expanded(

        child: Divider(),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 200),
        child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Calculator()));
      }, child: Text("Go Back"),),),
    ], );
  }
}


