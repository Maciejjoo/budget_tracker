import 'package:budget_tracker/src/application/local_storage/local_storage_service.dart';
import 'package:budget_tracker/src/data/tracker_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> init({required GetIt locator}) async {
  locator.registerSingleton<LocalStorage>(LocalStorage());

  locator.registerSingleton<LocalStorageService>(
    LocalStorageService(locator<LocalStorage>()),
  );

  locator.registerSingleton<TrackerRepository>(
    TrackerRepositoryImpl(locator<LocalStorageService>()),
  );
}
