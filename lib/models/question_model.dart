class Question{
  final String text;
  bool isLocked;
  final List<Option> options;
  Option? selectedOption;


  Question({required this.text, required this.options, this.isLocked = false});
}

class Option{
  String text;
  int score;

  Option({required this.text, required this.score});
}

List<Question> questions = [

  Question(text: "Gehtst du nach dem aufstehen in die Sonne?",options:[
    Option(text: "Ja, immer sofort", score: 4),
    Option(text: "Ja, aber erst nach dem Kaffee", score: 3),
    Option(text: "Manchmal später", score: 2),
    Option(text: "Sonne, nee da bekommt doch einen Sonnenbrand", score: 1),
  ]),
    Question(text: "Schaust du Nachst in künstliches Licht?",options:[
    Option(text: "Ja, immer", score: 1),
    Option(text: "Ja, aber nut mit Blaulichtfilter", score: 3),
    Option(text: "Manchmal", score: 2),
    Option(text: "Nein, da lese ich lieber ein Buch", score: 4),
  ]),
];