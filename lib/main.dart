import 'package:anamel/screens/address/address_repository/address_repository.dart';
import 'package:anamel/screens/address/domain/address_bloc.dart';
import 'package:anamel/screens/auth/data/repository/auth_firebase_repository.dart';
import 'package:anamel/screens/auth/data/repository/user_repository.dart';
import 'package:anamel/screens/auth/domain/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/routes/go_router_generator.dart';
import 'core/styling/app_themes.dart';
import 'core/styling/theme_notifier.dart';
import 'firebase_options.dart';
import 'core/routes/app_routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final initialRoute = await _getInitialRoute();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(initialRoute: initialRoute),
    ),
  );
}

Future<String> _getInitialRoute() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isFirstTime = prefs.getBool("is_first_time") ?? true;

  if (isFirstTime) {
    prefs.setBool("is_first_time", false);
    return AppRouting.onboarding;
  }

  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    return AppRouting.home;
  } else {
    return AppRouting.login;
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            authFirebaseRepo: AuthFirebaseRepository(),
            userRepo: UserRepository(),
          ),
        ),
        BlocProvider<AddressBloc>(
          create: (context) => AddressBloc(repository: AddressRepository()),
        ),

        // BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) {
          return MaterialApp.router(
            title: "Anamel",
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: Provider.of<ThemeNotifier>(context).themeMode,
            routerConfig: GoRouterGenerator.generateRouter(initialRoute),
            routerConfig: GoRouterGenerator.mainRouter,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
