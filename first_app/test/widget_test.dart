import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_app/main.dart';

void main() {
  //certo
  testWidgets('Verificar se a página inicial está sendo iniciada corretamente',
      (WidgetTester tester) async {
    // Inicializa o widget principal
    await tester.pumpWidget(MyApp());

    // Verifica se o botão "Next" está presente
    expect(find.text('Next'), findsOneWidget);

    // Verifica se o botão "Like" está presente
    expect(find.text('Like'), findsOneWidget);
  });
}
