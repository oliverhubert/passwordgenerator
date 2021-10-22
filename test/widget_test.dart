
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:passwordgenerator/main.dart';

void main() {
  testWidgets('User Interface Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyApp()));

    final nameFormField = find.byKey(Key('name'));
    final codeFormField = find.byKey(Key('code'));
    final generateButton = find.byKey(Key('button1'));
    final changeSwitch = find.byKey(Key('switch1'));
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
    expect(find.text('Sk0Jc,_0'),findsOneWidget );

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
}

