class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= ImageConstants._();
    return _instance!;
  }

  ImageConstants._();

  final String appIcon = 'icon/app_icon'.toPNG;
  final String markerUser = 'icon/ic_marker_user'.toPNG;
}

extension _ImageConstantsExtension on String {
  String get toPNG => 'assets/$this.png';
}
