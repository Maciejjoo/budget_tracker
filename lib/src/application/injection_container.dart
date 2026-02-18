import 'package:budget_tracker/src/application/local_storage/local_storage_service.dart';
import 'package:budget_tracker/src/data/tracker_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> init({required GetIt locator}) async {
  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  locator.registerSingleton<LocalStorage>(LocalStorage());

  locator.registerSingleton<LocalStorageService>(
    LocalStorageService(locator<LocalStorage>()),
  );

  locator.registerSingleton<TrackerRepository>(
    TrackerRepositoryImpl(locator<LocalStorageService>()),
  );
}
