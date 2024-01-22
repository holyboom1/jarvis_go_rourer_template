// import 'package:flutter/services.dart';
// import 'package:liquid_2_mobile_app/news_details.dart';
// import 'package:local_auth/error_codes.dart' as auth_error;
// import 'package:local_auth/local_auth.dart';
//
// import '../secure_storage_manager/secure_storage_manager.dart';
//
// class LocalAuthManager extends LocalAuthentication {
//   LocalAuthManager(this.storage);
//
//   final SecureStorageManager storage;
//
//   /// Check whether there is local authentication with
//   /// any of Biometric types available on this device
//   Future<bool> get canAuthenticateWithBiometrics async {
//     final List<BiometricType> availableBiometrics = await getAvailableBiometrics();
//     final bool deviceCanCheckBiometrics = await canCheckBiometrics;
//     final bool deviceSupported = await isDeviceSupported();
//
//     logger.print('LocalAuthManager: availableBiometrics: $availableBiometrics, '
//         'canCheckBiometrics: $deviceCanCheckBiometrics, '
//         'isDeviceSupported: $deviceSupported');
//     return deviceCanCheckBiometrics && deviceSupported;
//   }
//
//   Future<String?> get currentUser async => await storage.readCurrentUser();
//   Future<String?> get biometric async =>
//       await storage.readBiometric(userName: await currentUser ?? '');
//   Future<AuthMethod> get authMethod async =>
//       await storage.readAuthMethod(userName: await currentUser ?? '') ?? AuthMethod.pincode;
//
//   Future<bool> tryAuthWithBiometrics(String localizedReason) async {
//     bool isAuthenticate = false;
//     if (await canAuthenticateWithBiometrics) {
//       try {
//         isAuthenticate = await authenticate(
//           localizedReason: localizedReason,
//           options: const AuthenticationOptions(
//             useErrorDialogs: true,
//           ),
//         );
//       } on PlatformException catch (e) {
//         logger.e('tryAuthWithBiometrics ERROR', error: e);
//         if (e.code == auth_error.notEnrolled) {
//           logger.e('Biometric authentication isn\'t setup!', error: e);
//         }
//         storage.deleteBiometric(userName: (await currentUser)!);
//         await storage.saveAuthMethod(
//           userName: (await currentUser)!,
//           method: AuthMethod.pincode,
//         );
//       }
//     }
//
//     return isAuthenticate;
//   }
// }
//
// enum AuthMethod {
//   pincode,
//   biometric,
// }
