import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kanban_test/core/utils/hive_service.dart';
import 'package:kanban_test/service_locator.dart' as sl;
import 'package:easy_localization/easy_localization.dart';
import 'package:kanban_test/core/routes/app_router.dart';
import 'package:kanban_test/core/themes/theme_bloc.dart';
import 'package:kanban_test/core/themes/theme_state.dart';
import 'package:kanban_test/core/themes/themes.dart';
import 'package:kanban_test/presentation/blocs/task/task_bloc.dart';
import 'package:kanban_test/presentation/blocs/task_details/task_details_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await sl.init();
  await sl.sl<HiveService>().init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider<TaskBloc>(
            create: (context) => TaskBloc(),
          ),
          BlocProvider<TaskDetailsBloc>(
            create: (context) => TaskDetailsBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (c, state) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: sl.sl<AppRouter>().router,
            theme: state.themeData,
            darkTheme: darkTheme,
            themeMode: ThemeMode
                .system, // Automatically switch based on system settings
          );
        }));
  }
}
