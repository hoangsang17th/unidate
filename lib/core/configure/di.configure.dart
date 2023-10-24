import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.configure.config.dart';


final getIt = GetIt.instance;

/// This function will be called by [main.dart] to configure all dependencies
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
