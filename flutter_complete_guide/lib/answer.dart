import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectHandler;
  final String answertext;

  Answer(this.selectHandler, this.answertext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child : RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(answertext),
        onPressed: selectHandler,
            ),
    );
  }
}