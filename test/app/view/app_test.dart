import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:random_color/app/app.dart';
import 'package:random_color/injections/injection.dart';
import 'package:random_color/random_color/presentation/random_color_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      GetIt getIt = GetIt.asNewInstance();
      configureDependencies(getIt);
      await tester.pumpWidget(App(
        getIt: getIt,
      ));
      expect(find.byType(RandomColorPage), findsOneWidget);
    });
  });
}
