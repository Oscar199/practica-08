import 'pregunta.dart';
class CerebroCuestionario {

  int _numeroPregunta = 0;

  List<Pregunta> _bancoPreguntas = [
    Pregunta(p: 'Dos mas dos es 5', r: false),
    Pregunta(p: 'El año tiene 12 meses', r: true),
    Pregunta(p: 'El cielo es color celeste', r: true),
    Pregunta(p: 'Rusia es el pais mas grande del mundo', r: true),
    Pregunta(p: 'Cristiano Ronaldo juega en el Real Madrid', r: false),
    Pregunta(p: 'El color rojo es un color primario', r: true),
    Pregunta(p: 'La nieve es calida', r: false),
    Pregunta(p: 'Netflix es una app de series', r: true),
    Pregunta(p: 'La semana tiene 7 dias', r: true),
    Pregunta(p: 'Roma es la capital de Italia', r: true),
  ];


  String getTextoPregunta() {
    return _bancoPreguntas [_numeroPregunta].textoPregunta;
  }

  bool getRespuestaPregunta() {
    return _bancoPreguntas[_numeroPregunta].respuestaPregunta;
  }

  void siguintePregunta() {
    if (_numeroPregunta < _bancoPreguntas.length - 1) {
      _numeroPregunta++; // _numeroPRegunta ++
    }
  }
}