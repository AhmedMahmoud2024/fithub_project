
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../screens/circles/circle_chat/circle_chat_main.dart';
import '../screens/circles/circles_main.dart';
import '../screens/events/events_main.dart';
import '../screens/exercises/exercises_main.dart';
import '../screens/mainScreen/home-screen.dart';
import '../screens/profile/profile-page.dart';
import 'main_screen_widgets/scaffold_with_navbar.dart';

void main() {
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(navigatorKey: _sectionNavigatorKey, routes: [
          GoRoute(
            path: "/home",
            builder: (context, state) => const MyHomePage(),
          )
        ]),
        StatefulShellBranch(routes: [GoRoute(
          path: "/circles",
          builder: (context, state) => CirclesMain(),
        )]),
        StatefulShellBranch(routes: [GoRoute(
          path: "/events",
          builder: (context, state) => const EventsMain(),
        )]),
        StatefulShellBranch(routes: [GoRoute(
          path: "/exercises",
          builder: (context, state) => const ExercisesMain(),
        )]),
        StatefulShellBranch(routes: [GoRoute(
          path: "/profile",
          builder: (context, state) => const ProfilePage(),
        )])
      ],
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(navigationShell);
      },
    ),
    GoRoute(path: "/chat/:chatId", builder: (context, state) => CircleChatMain(groupName: state.pathParameters["chatId"]!, avatarUrls: const ["avatarUrls"]))
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: const Locale('en', 'US'),
      // This forces the app to use Arabic layout
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // Arabic
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0560FD)),
        useMaterial3: true,
      //  textTheme:  GoogleFonts.poppinsTextTheme(),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routerConfig: _router,
    );
  }
}
