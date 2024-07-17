import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todolist/main.dart';

void main() {
  testWidgets('Add a task to the to-do list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our to-do list is empty.
    expect(find.text('Add a task'), findsOneWidget);
    expect(find.text('Task 1'), findsNothing);

    // Enter a task in the text field.
    await tester.enterText(find.byType(TextField), 'Task 1');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our task has been added.
    expect(find.text('Task 1'), findsOneWidget);
  });

  testWidgets('Remove a task from the to-do list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Add a task to the list.
    await tester.enterText(find.byType(TextField), 'Task 1');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our task has been added.
    expect(find.text('Task 1'), findsOneWidget);

    // Remove the task from the list.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify that the task has been removed.
    expect(find.text('Task 1'), findsNothing);
  });
}
