import 'package:appifylabtask/src/config/import/imports.dart';

class URILauncherComponent {

  static URILauncherComponent? _instance;
  URILauncherComponent._internal();
  factory URILauncherComponent(){
    _instance ??= URILauncherComponent._internal();
    return _instance!;
  }

  void openCompanyWebsite() async {
    const playStoreDevAccountUrl = 'https://google.com';
    if (await canLaunch(playStoreDevAccountUrl)) {
      await launch(playStoreDevAccountUrl);
    } else {
      throw 'Could not launch $playStoreDevAccountUrl';
    }
  }
}