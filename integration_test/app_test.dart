import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:passwordgenerator/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('generate password', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final Finder nameFormField = find.bySemanticsLabel('Name');
      final Finder codeFormField = find.bySemanticsLabel('Code');
      final Finder generateButton = find.byType(ElevatedButton);
      final Finder changeSwitch = find.byType(Switch);
      await tester.enterText(nameFormField, 'test');
      await tester.enterText(codeFormField, 'test');
      await tester.tap(generateButton);
      await tester.pump();

      //new
      expect(find.text('fp/c3Vkn'), findsOneWidget);

      await tester.tap(changeSwitch);
      await tester.tap(generateButton);
      await tester.pump();

      //legacy
      expect(find.text('Sk0Jc,_0'), findsOneWidget);

      await tester.tap(changeSwitch);
      await tester.enterText(nameFormField, 'it');
      await tester.enterText(codeFormField, 'wc54(!RF');
      await tester.tap(generateButton);
      await tester.pump();

      //new
      expect(find.text('mx2vW;Xw'), findsOneWidget);

      await tester.tap(changeSwitch);
      await tester.tap(generateButton);
      await tester.pump();

      //legacy
      expect(find.text('Oy:5Av4X'), findsOneWidget);

      await tester.tap(changeSwitch);
      await tester.enterText(nameFormField, 'admin');
      await tester.enterText(codeFormField, 'wc54(!RF');
      await tester.tap(generateButton);
      await tester.pump();

      //new
      expect(find.text('9FgV:qhf'), findsOneWidget);

      await tester.tap(changeSwitch);
      await tester.tap(generateButton);
      await tester.pump();

      //legacy
      expect(find.text('Ou4\$wHcJ'), findsOneWidget);

      await tester.tap(changeSwitch);
      await tester.enterText(nameFormField, 'anothertaskituser');
      await tester.enterText(codeFormField, 'wc54(!RF');
      await tester.tap(generateButton);
      await tester.pump();

      //new
      expect(find.text('<ud5TM:R'), findsOneWidget);

      await tester.tap(changeSwitch);
      await tester.tap(generateButton);
      await tester.pump();

      //legacy
      expect(find.text('FZ6+(rRI'), findsOneWidget);
    });
  });
}

/* 
  start WebDriver Server:

  chromedriver --port=4444

  run Web test:

  flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d web-server
  */
