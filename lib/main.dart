import 'package:anamel/screens/auth/data/repository/auth_firebase_repository.dart';
import 'package:anamel/screens/auth/data/repository/user_repository.dart';
import 'package:anamel/screens/auth/domain/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/routes/go_router_generator.dart';
import 'core/styling/app_themes.dart';
import 'core/styling/theme_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authFirebaseRepo: AuthFirebaseRepository(),
            userRepo: UserRepository(),
          ),
        ),
        // BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
        // BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) {
          return MaterialApp.router(
            title: "Amanel",
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: Provider.of<ThemeNotifier>(context).themeMode,
            routerConfig: GoRouterGenerator.mainRouter,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
