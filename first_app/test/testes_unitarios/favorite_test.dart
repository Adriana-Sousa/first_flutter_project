import 'package:flutter_test/flutter_test.dart';
import 'package:first_app/main.dart';

void main() {
  test('toggleFavorite adds and removes word from favorites', () {
    final appState = MyAppState();
    final word = appState.current;

    // Verifica que a lista de favoritos inicialmente não contém a palavra
    expect(appState.favorites.contains(word), isFalse);

    // Adiciona a palavra aos favoritos
    appState.toggleFavorite();

    // Verifica se a palavra foi adicionada
    expect(appState.favorites.contains(word), isTrue);

    // Remove a palavra dos favoritos
    appState.toggleFavorite();

    // Verifica se a palavra foi removida
    expect(appState.favorites.contains(word), isFalse);
  });

  test('Multiple words can be added to favorites', () {
    final appState = MyAppState();

    // Adiciona várias palavras aos favoritos
    final word1 = appState.current;
    appState.toggleFavorite();
    expect(appState.favorites.contains(word1), isTrue);

    // Gera uma nova palavra e adiciona aos favoritos
    appState.getNext();
    final word2 = appState.current;
    appState.toggleFavorite();
    expect(appState.favorites.contains(word2), isTrue);

    // Verifica se ambas as palavras estão na lista de favoritos
    expect(appState.favorites.length, 2);
    expect(appState.favorites.contains(word1), isTrue);
    expect(appState.favorites.contains(word2), isTrue);
  });
}
