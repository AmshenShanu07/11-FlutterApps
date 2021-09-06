class Questions {
  int _questionNumber = 0;

  List _qusetions = [
    {
      'q': 'Friends star Lisa Kudrow was originally cast in the sitcom Frasier',
      'a': true,
    },
    {
      'q': 'If you’re born between May 1st and 20th, then you’re a Gemini',
      'a': false,
    },
    {
      'q': 'Emma Roberts is the daughter of Julia Roberts',
      'a': false,
    },
    {
      'q': 'There are over 2,500 stars on the Hollywood Walk of Fame',
      'a': true,
    },
    {
      'q': 'Fruit flies were the first living creatures sent into space',
      'a': true,
    },
    {
      'q': 'Cyclones spin in a clockwise direction in the southern hemisphere',
      'a': true,
    },
    {
      'q': 'Goldfish only have a memory of three seconds',
      'a': false,
    },
    {'q': 'The capital of Libya is Benghazi', 'a': true},
    {
      'q': 'Dolly Parton is the godmother of Miley Cyrus',
      'a': false,
    },
    {
      'q': 'Roger Federer has won the most Wimbledon titles of any player',
      'a': false,
    },
  ];

  String nextQuestion() {
    return _questionNumber != 0
        ? _qusetions[_questionNumber]['q']
        : _qusetions[0]['q'];
  }

  String checkAnswer(ans) {
    if (_questionNumber < _qusetions.length - 1) {
      bool realAnswer = _qusetions[_questionNumber]['a'];
      _questionNumber++;

      if (realAnswer == ans) {
        return 'true';
      } else {
        return 'false';
      }
    } else {
      _questionNumber = 0;
      return 'end';
    }
  }
}
// xnl3150