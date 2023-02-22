import 'package:get_it/get_it.dart';
import 'package:random_color/app/app.dart';
import 'package:random_color/bootstrap.dart';

void main() {
  bootstrap((GetIt getIt) async {
    return App(getIt: getIt);
  });
}
