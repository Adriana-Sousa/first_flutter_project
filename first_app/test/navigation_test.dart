import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_app/main.dart';

void main() {
//certo
  testWidgets('Navegação entre as duas telas', (WidgetTester tester) async {
    // Inicializa o widget principal
    await tester.pumpWidget(MyApp());

    // Verifica se estamos na página "Home"
    expect(find.text('Next'), findsOneWidget);
    expect(find.text('Like'), findsOneWidget);

    // Navega para a página de favoritos clicando no ícone de "Favorites"
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle(); // Espera a animação de navegação completar

    // Verifica se a página de favoritos foi carregada
    expect(find.text('No favorites yet.'), findsOneWidget);

    // Navega de volta para a página "Home" clicando no ícone de "Home"
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle(); // Espera a animação de navegação completar

    // Verifica se estamos de volta na página "Home"
    expect(find.text('Next'), findsOneWidget);
    expect(find.text('Like'), findsOneWidget);
  });
}
