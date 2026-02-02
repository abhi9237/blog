import 'package:blog/core/secure_storage/storage_constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  /// Save tokens
   Future<void> saveTokens({
    required String accessToken,
  }) async {
    await _storage.write(
      key: StorageConstant.accessTokenKey,
      value: accessToken,
    );
    // await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  /// Read access token
  // static Future<String?> getAccessToken() async {
  //   return _storage.read(key: _accessTokenKey);
  // }

  /// Read refresh token
   Future<String?> getToken() async {
    return _storage.read(key: StorageConstant.accessTokenKey);
  }

  /// Clear tokens (logout)
  static Future<void> clearTokens() async {
    await _storage.deleteAll();
  }
}
