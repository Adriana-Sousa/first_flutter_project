import 'package:flutter_test/flutter_test.dart';
import 'package:english_words/english_words.dart';
import 'package:first_app/main.dart';

void main() {
  test('Verificar estado incial', () {
    final appState = MyAppState();

    // Verifica se uma palavra foi gerada
    expect(appState.current, isA<WordPair>());

    // Verifica se a lista de favoritos está vazia
    expect(appState.favorites.isEmpty, isTrue);
  });
}
