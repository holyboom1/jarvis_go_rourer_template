// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// import '../local_auth_manager/local_auth_manager.dart';
//
// class SecureStorageManager {
//   final FlutterSecureStorage storage = const FlutterSecureStorage(
//     aOptions: AndroidOptions(
//       encryptedSharedPreferences: true,
//     ),
//   );
//
//   final String _currentUser = 'currentUser';
//   final String _authMethodKey = 'authMethod';
//   final String _biometricKey = 'biometric';
//
//   Future<void> saveBiometric({
//     required String userName,
//   }) async {
//     await storage.write(
//       key: '$_biometricKey:$userName',
//       value: 'true',
//     );
//   }
//
//   Future<void> deleteBiometric({
//     required String userName,
//   }) async {
//     await storage.delete(
//       key: '$_biometricKey:$userName',
//     );
//   }
//
//   Future<String?> readBiometric({
//     required String userName,
//   }) async {
//     return await storage.read(
//       key: '$_biometricKey:$userName',
//     );
//   }
//
//   Future<void> saveAuthMethod({
//     required String userName,
//     required AuthMethod method,
//   }) async {
//     await storage.write(
//       key: '$_authMethodKey:$userName',
//       value: method.name,
//     );
//   }
//
//   Future<void> deleteAuthMethod({
//     required String userName,
//   }) async {
//     await storage.delete(
//       key: '$_authMethodKey:$userName',
//     );
//   }
//
//   Future<AuthMethod?> readAuthMethod({
//     required String userName,
//   }) async {
//     AuthMethod? method;
//     String? methodName = await storage.read(
//       key: '$_authMethodKey:$userName',
//     );
//     if (methodName != null) {
//       method = AuthMethod.values.byName(methodName);
//     }
//     return method;
//   }
//
//   Future<void> saveCurrentUser({
//     required String userName,
//   }) async {
//     await storage.write(
//       key: _currentUser,
//       value: userName,
//     );
//   }
//
//   Future<String?> readCurrentUser() async {
//     return await storage.read(
//       key: _currentUser,
//     );
//   }
//
//   Future<void> deleteCurrentUser() async {
//     await storage.delete(
//       key: _currentUser,
//     );
//   }
// }
