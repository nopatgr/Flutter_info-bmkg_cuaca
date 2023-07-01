import 'package:get_it/get_it.dart';

import '../helpers/app_helpers.dart';

GetIt getItLocator = GetIt.instance;

initLocator() {
  getItLocator.registerSingleton<AppHelpers>(AppHelpers());
}
