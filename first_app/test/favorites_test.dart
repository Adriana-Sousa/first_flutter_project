import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/main.dart';

void main() {
  //certo
  testWidgets('Add and remove favorites', (WidgetTester tester) async {
    // Inicializa o widget principal com o Provider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => MyAppState(), // Cria um estado para o MyApp
        child: MyApp(),
      ),
    );

    // Certifica-se de que o primeiro frame foi completamente renderizado
    await tester.pumpAndSettle();

    // Clica no ícone de "Like" dentro do corpo principal (não na NavigationRail)
    await tester.tap(
      find.descendant(
        of: find.byType(
            GeneratorPage), // Especifica o widget onde o ícone de 'favorite_border' está presente
        matching: find.byIcon(Icons.favorite_border),
      ),
    );
    await tester
        .pumpAndSettle(); // Aguarda a atualização do estado e a transição

    // Navega para a página de favoritos clicando no ícone da NavigationRail
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationRail), // Especifica o NavigationRail
        matching: find.byIcon(Icons.favorite),
      ),
    );
    await tester
        .pumpAndSettle(); // Aguarda a transição completa para a página de favoritos

    // Verifica se a palavra foi adicionada à lista de favoritos
    expect(find.byType(ListTile), findsOneWidget);

    // Volta para a página inicial clicando no ícone da NavigationRail
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationRail), // Especifica o NavigationRail
        matching: find.byIcon(Icons.home),
      ),
    );
    await tester
        .pumpAndSettle(); // Aguarda a transição completa de volta à página inicial

    // Clica novamente no ícone de "Like" dentro do corpo principal para remover dos favoritos
    await tester.tap(
      find.descendant(
        of: find.byType(
            GeneratorPage), // Especifica o widget onde o ícone de 'favorite' está presente
        matching: find.byIcon(Icons.favorite),
      ),
    );
    await tester.pumpAndSettle(); // Aguarda a atualização do estado

    // Navega de volta para a página de favoritos
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationRail), // Especifica o NavigationRail
        matching: find.byIcon(Icons.favorite),
      ),
    );
    await tester.pumpAndSettle(); // Aguarda a transição completa

    // Verifica se a lista de favoritos está vazia
    expect(find.text('No favorites yet.'), findsOneWidget);
  });
}
