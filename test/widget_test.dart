import 'package:flutter_test/flutter_test.dart'
    show WidgetTester, expect, find, findsOneWidget, testWidgets;
import 'package:fresh_market_app/main.dart';

void main() {
  testWidgets('App starts and shows HomePage', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(FreshMarketApp());

    // Verify that HomePage shows title
    expect(find.text('Fresh Market'), findsOneWidget);
  });
}
