import 'package:appifylabtask/src/config/import/imports.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  AppEnvironment.setupEnv(Environment.development);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppEnvironment.statusBarColor,
    statusBarIconBrightness: AppEnvironment.statusBarIconColor,
  ));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ErrorWidget.builder = (FlutterErrorDetails details)=>SafeArea(child: Scaffold(
    body: CustomErrorWidget(errorMessage: details.exceptionAsString()),
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

