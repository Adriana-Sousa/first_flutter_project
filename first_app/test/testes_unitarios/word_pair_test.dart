import 'package:flutter_test/flutter_test.dart';
import 'package:english_words/english_words.dart';
import 'package:first_app/main.dart';

void main() {
  test('getNext generates a new word pair', () {
    final appState = MyAppState();

    final initialWord = appState.current;

    // Chama o método getNext() e verifica se a palavra mudou
    appState.getNext();

    expect(appState.current, isNot(initialWord));
  });
}
