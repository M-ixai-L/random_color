import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:random_color/injections/injection.config.dart';

@InjectableInit()
void configureDependencies(GetIt getIt) => getIt.init();
