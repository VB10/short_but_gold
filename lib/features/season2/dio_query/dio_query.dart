import 'package:dio/dio.dart';

enum QueryValues {
  version,
  platform,
  page,
  postId,
  pageSize;

  MapEntry<String, String> toEntry(String value) {
    return MapEntry(name, value);
  }
}

class DioManager {
  void fetch() {
    Dio().get('/sample',
        queryParameters: Map.fromEntries([
          QueryValues.page.toEntry('1'),
          QueryValues.postId.toEntry('10'),
          QueryValues.version.toEntry('ios'),
        ]));
  }
}
