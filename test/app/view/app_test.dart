import 'package:flutter_test/flutter_test.dart';
import 'package:hank_talker_mobile/app/app.dart';
import 'package:hank_talker_mobile/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
