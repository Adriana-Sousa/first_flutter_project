import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/main.dart';

void main() {
  //certo
  //Next
  testWidgets('Pressing Next generates a new word',
      (WidgetTester tester) async {
    // Inicializa o widget principal
    await tester.pumpWidget(MyApp());

    // Obtém o texto do widget BigCard antes de apertar o botão "Next"
    var initialWordPair = find.byType(BigCard);

    // Clica no botão "Next"
    await tester.tap(find.text('Next'));
    await tester.pump(); // Espera que a tela seja redesenhada

    // Verifica se a palavra gerada é diferente
    var newWordPair = find.byType(BigCard);
    expect(initialWordPair, isNot(newWordPair));
  });
  //Like
  testWidgets('Pressing Like adds/removes the word to/from favorites',
      (WidgetTester tester) async {
    // Inicializa o widget principal
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => MyAppState(),
        child: MyApp(),
      ),
    );

    await tester
        .pumpAndSettle(); // Aguarda que a tela esteja completamente renderizada

    // Verifica se o ícone é de um coração vazio (não curtido) dentro do botão "Like"
    expect(
      find.descendant(
        of: find.byType(GeneratorPage), // Busca entre todos os botões
        matching: find.byIcon(
            Icons.favorite_border), // Verifica se o ícone é do coração vazio
      ),
      findsOneWidget,
    );

    // Clica no botão "Like"
    await tester.tap(find.text('Like'));
    await tester.pump(); // Aguarda o rebuild

    // Verifica se o ícone mudou para um coração cheio (curtido) dentro do botão "Like"
    expect(
      find.descendant(
        of: find.byType(GeneratorPage), // Busca entre todos os botões
        matching: find
            .byIcon(Icons.favorite), // Verifica se o ícone é do coração cheio
      ),
      findsOneWidget,
    );

    // Clica no botão "Like" novamente para remover dos favoritos
    await tester.tap(find.text('Like'));
    await tester.pump(); // Aguarda o rebuild

    // Verifica se o ícone voltou para um coração vazio (não curtido) dentro do botão "Like"
    expect(
      find.descendant(
        of: find.byType(GeneratorPage), // Busca entre todos os botões
        matching: find.byIcon(
            Icons.favorite_border), // Verifica se o ícone é do coração vazio
      ),
      findsOneWidget,
    );
  });
}
