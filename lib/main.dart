import 'package:budget_tracker/src/application/injection_container.dart';
import 'package:budget_tracker/src/application/theme/theme_cubit.dart';
import 'package:budget_tracker/src/config/app_theme.dart';
import 'package:budget_tracker/src/data/tracker_repository.dart';
import 'package:budget_tracker/src/features/home_page/cubits/tracker_cubit/tracker_cubit.dart';
import 'package:budget_tracker/src/features/home_page/pages/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await init(locator: locator);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'EN')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'EN'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(locator.get<SharedPreferences>()),
        ),
        BlocProvider(
          create: (context) => TrackerCubit(locator.get<TrackerRepository>()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Budget Tracker',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
