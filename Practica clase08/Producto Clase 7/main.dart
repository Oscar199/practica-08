import 'package:flutter/material.dart';
import 'cerebroCuestionario.dart';

CerebroCuestionario cerebroCuestionario =CerebroCuestionario();


void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> guardadaPuntos = [];
  void verificarRespuesta(bool respuestaDelUsuario){
    bool respuestaCorrecta = cerebroCuestionario.getRespuestaPregunta();
    setState(() {
      if (respuestaDelUsuario == respuestaCorrecta) {
        guardadaPuntos.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        guardadaPuntos.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      cerebroCuestionario.siguintePregunta();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                cerebroCuestionario.getTextoPregunta(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Verdadero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                verificarRespuesta(true);
                setState(() {
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                verificarRespuesta(false);
                setState(() {
                });
              },
            ),
          ),
        ),
        Row(
          children: guardadaPuntos,
        )
      ],
    );
  }
}