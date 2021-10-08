import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injector.iconfig.dart';

final getIt = GetIt.instance;

void setupInjections() {
  configure();
}

@injectableInit
void configure() => $initGetIt(getIt);
