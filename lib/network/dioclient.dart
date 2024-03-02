import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

const apiBaseUrlProd = "";
const apiBaseUrlDev = "";

class DioClient {
  static final dio = Dio();

  static Future<Dio> init() async {
    final baseUrl = await getApiBaseUrl();

    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60), // 60 seconds
      receiveTimeout: const Duration(seconds: 60), // 60 seconds
      responseType: ResponseType.plain,
    );

    return dio;
  }
}

Future<String> getApiBaseUrl() async {
  final packageInfo = await PackageInfo.fromPlatform();

  // Use packageInfo to check for the app's environment (e.g., dev or prod).
  // You can set this information in your app's AndroidManifest.xml and Info.plist.

  if (packageInfo.packageName == 'com.example.{product}.dev') {
    print("Connecting to $apiBaseUrlDev");
    return apiBaseUrlDev;
  } else if (packageInfo.packageName == 'com.example.{product}') {
    print("Connecting to $apiBaseUrlProd");

    return apiBaseUrlProd;
  } else {
    return apiBaseUrlDev;
  }
}
