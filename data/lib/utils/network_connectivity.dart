// import 'dart:async';
// import 'dart:io';
// import 'package:auto_route/auto_route.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:liquid_2_mobile_app/news_details.dart';
//
// import '../navigation/app_router.dart';
//
// class NetworkConnectivity {
//   NetworkConnectivity._();
//
//   static final NetworkConnectivity _instance = NetworkConnectivity._();
//   static NetworkConnectivity get instance => _instance;
//
//   static Connectivity _networkConnectivity = Connectivity();
//
//   @visibleForTesting
//   set networkConnectivity(value) => _networkConnectivity = value;
//
//   final StreamController<Map<ConnectivityResult, bool>> _controller =
//       StreamController<Map<ConnectivityResult, bool>>.broadcast();
//
//   Stream<Map<ConnectivityResult, bool>> get connection => _controller.stream;
//   // TODO: Add Splash page
//   // Splash page by default
//   PageRouteInfo disconnectedPage = const DataCenterRoute();
//   bool disconnected = false;
//
//   void initialise(AppRouter router) async {
//     await _networkConnectivity.checkConnectivity();
//     _networkConnectivity.onConnectivityChanged.listen((ConnectivityResult result) async {
//       logger.w('NetworkConnectivity onConnectivityChanged: ${result.name}');
//       await _checkStatus(result);
//     });
//     handleNoInternetConnection(router);
//   }
//
//   void handleNoInternetConnection(AppRouter router) {
//     connection.listen((Map<ConnectivityResult, bool> connection) {
//       getStatus(
//         connection: connection,
//         onOnline: () {
//           if (connection.entries.first.value && disconnected) {
//             logger.w(
//               'NetworkConnectivity: onOnline\ndisconnectedPage: ${disconnectedPage.routeName} args: ${disconnectedPage.args}',
//             );
//             router.replaceAll(<PageRouteInfo>[disconnectedPage]);
//             disconnected = false;
//           }
//         },
//         onOffline: () {
//           disconnected = true;
//           disconnectedPage = router.topRoute.route.toPageRouteInfo();
//           logger.w(
//             'NetworkConnectivity: onOffline\ndisconnectedPage: ${disconnectedPage.routeName} args: ${disconnectedPage.args}',
//           );
//           // TODO: add InternetConnectionFailureRoute
//           router.replaceAll(<PageRouteInfo>[const DataCenterRoute()]);
//         },
//       );
//     });
//   }
//
//   Future<void> _checkStatus(ConnectivityResult result) async {
//     bool isOnline = false;
//     try {
//       await Future.delayed(const Duration(milliseconds: 200));
//       final List<InternetAddress> result = await InternetAddress.lookup('example.com');
//       isOnline = result.isNotEmpty && result.first.rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       isOnline = false;
//     }
//
//     _controller.sink.add(<ConnectivityResult, bool>{result: isOnline});
//   }
//
//   bool isOnline = true;
//
//   void getStatus({
//     required Map<ConnectivityResult, bool> connection,
//     required VoidCallback onOnline,
//     required VoidCallback onOffline,
//   }) {
//     final bool isOnline = connection.values.toList().first;
//     switch (connection.keys.toList().first) {
//       case ConnectivityResult.mobile ||
//             ConnectivityResult.wifi ||
//             ConnectivityResult.vpn ||
//             ConnectivityResult.other:
//         if (isOnline) {
//           onOnline();
//           this.isOnline = true;
//         } else {
//           onOffline();
//           this.isOnline = false;
//         }
//         break;
//       case ConnectivityResult.none:
//         onOffline();
//         this.isOnline = false;
//       default:
//         onOffline();
//         this.isOnline = false;
//     }
//   }
//
//   void disposeStream() => _controller.close();
// }
