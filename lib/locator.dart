import 'package:get_it/get_it.dart';
import 'package:jeff_li_dam/services/crud_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CrudService>(() => CrudService());
}
