import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'guards/auth_guard.dart';
import 'services/route_logger.dart';

export 'package:splash/splash.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  RouterLogger get logger => RouterLogger();

  GoRouter get router => _router;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  final GoRouter _router = GoRouter(
    navigatorKey: _navigatorKey,
    observers: <NavigatorObserver>[RouterLogger()],
    initialLocation: RouterConstants.splashRoute,
    // redirect: (BuildContext context, GoRouterState state) {
    //   if (!appLocator<AuthService>().isAuthenticated) {
    //     return RouterConstants.authRoute;
    //   } else {
    //     return null;
    //   }
    // },
    routes: <RouteBase>[
      GoRoute(
        path: RouterConstants.splashRoute,
        name: RouterConstants.splashRoute,
        redirect: AuthGuard(appLocator<AuthService>()).handleRedirect,
        builder: (BuildContext context, GoRouterState state) => SplashScreen(),
      ),
      // GoRoute(
      //   path: RouterConstants.authRoute,
      //   name: RouterConstants.authRoute,
      //   builder: (BuildContext context, GoRouterState state) => AuthScreen(),
      //   routes: <RouteBase>[
      //     GoRoute(
      //       path: RouterConstants.joinUsRoute,
      //       name: RouterConstants.joinUsRoute,
      //       builder: (BuildContext context, GoRouterState state) {
      //         final JoinUsPassExtra joinUsExtra = state.extra! as JoinUsPassExtra;
      //
      //         return JoinUsScreen(joinUsType: joinUsExtra.pageType, userEmail: joinUsExtra.email);
      //       },
      //       routes: <RouteBase>[
      //         GoRoute(
      //           path: RouterConstants.verificationCodeRoute,
      //           name: RouterConstants.verificationCodeRoute,
      //           builder: (BuildContext context, GoRouterState state) {
      //             final String userEmail = state.extra! as String;
      //
      //             return VerificationCodeScreen(userEmail: userEmail);
      //           },
      //         ),
      //         GoRoute(
      //           path: RouterConstants.joinUsPasswordRoute,
      //           name: RouterConstants.joinUsPasswordRoute,
      //           builder: (BuildContext context, GoRouterState state) {
      //             final JoinUsPassExtra joinUsExtra = state.extra! as JoinUsPassExtra;
      //
      //             return JoinUsScreen(
      //               joinUsType: joinUsExtra.pageType,
      //               userEmail: joinUsExtra.email,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       path: RouterConstants.signInRoute,
      //       name: RouterConstants.signInRoute,
      //       builder: (BuildContext context, GoRouterState state) => const SignInScreen(),
      //     ),
      //   ],
      // ),
      // GoRoute(
      //   path: RouterConstants.onBoardingChatRoute,
      //   name: RouterConstants.onBoardingChatRoute,
      //   builder: (BuildContext context, GoRouterState state) {
      //     final OnboardingChatExtra extra = state.extra! as OnboardingChatExtra;
      //
      //     Pavel, [25.07.24 11:01]
      //     return OnboardingChatScreen(userData: extra.userData);
      //   },
      // ),
      // GoRoute(
      //   path: RouterConstants.onBoardingCompleteRoute,
      //   name: RouterConstants.onBoardingCompleteRoute,
      //   builder: (BuildContext context, GoRouterState state) => OnboardingCompleteScreen(),
      // ),
      // GoRoute(
      //   parentNavigatorKey: _navigatorKey,
      //   path: RouterConstants.chatRoute,
      //   name: RouterConstants.chatRoute,
      //   builder: (BuildContext context, GoRouterState state) => ChatScreen(),
      // ),
      // StatefulShellRoute.indexedStack(
      //   builder: (
      //       BuildContext context,
      //       GoRouterState state,
      //       StatefulNavigationShell navigationShell,
      //       ) =>
      //       MainScreen(navigationShell: navigationShell),
      //   branches: <StatefulShellBranch>[
      //     StatefulShellBranch(
      //       routes: <RouteBase>[
      //         GoRoute(
      //           path: RouterConstants.homeRoute,
      //           name: RouterConstants.homeRoute,
      //           builder: (BuildContext context, GoRouterState state) => HomeScreen(),
      //           routes: <RouteBase>[
      //             GoRoute(
      //               parentNavigatorKey: _navigatorKey,
      //               path: RouterConstants.videoTutorialsRoute,
      //               name: RouterConstants.videoTutorialsRoute,
      //               builder: (BuildContext context, GoRouterState state) {
      //                 final int tutorialId = state.extra! as int;
      //
      //                 return VideoTutorialsScreen(tutorialId: tutorialId);
      //               },
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: <RouteBase>[
      //         GoRoute(
      //           path: RouterConstants.settingsRoute,
      //           name: RouterConstants.settingsRoute,
      //           builder: (BuildContext context, GoRouterState state) => SettingsScreen(),
      //           routes: <RouteBase>[
      //             GoRoute(
      //               parentNavigatorKey: _navigatorKey,
      //               path: RouterConstants.settingsEditingRoute,
      //               name: RouterConstants.settingsEditingRoute,
      //               builder: (BuildContext context, GoRouterState state) => EditProfileScreen(),
      //               routes: <RouteBase>[
      //                 GoRoute(
      //                   parentNavigatorKey: _navigatorKey,
      //                   path: RouterConstants.settingsEditingModalRoute,
      //                   name: RouterConstants.settingsEditingModalRoute,
      //                   pageBuilder: (BuildContext context, GoRouterState state) {
      //                     final Widget modalPage = state.extra! as Widget;
      //
      //                     return BottomSheetDialogPage<dynamic>(builder: (_) => modalPage);
      //                   },
      //                 ),
      //               ],
      //             ),
      //             GoRoute(
      //               parentNavigatorKey: _navigatorKey,
      //               path: RouterConstants.settingsLanguageRoute,
      //               name: RouterConstants.settingsLanguageRoute,
      //               pageBuilder: (BuildContext context, GoRouterState state) {
      //                 final Widget modalPage = state.extra! as Widget;
      //
      //                 return BottomSheetDialogPage<dynamic>(builder: (_) => modalPage);
      //               },
      //             ),
      //             GoRoute(
      //               parentNavigatorKey: _navigatorKey,
      //               path: RouterConstants.logoutRoute,
      //               name: RouterConstants.logoutRoute,
      //               pageBuilder: (BuildContext context, GoRouterState state) {
      //                 final Widget widget = state.extra! as Widget;
      //
      //                 return DialogPage<dynamic>(builder: (_) => widget);
      //               },
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    ],
  );
}
