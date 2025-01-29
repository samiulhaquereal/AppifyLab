import 'package:appifylabtask/src/config/import/imports.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey[800]?.withOpacity(.7),
        body: Center(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.transparentColor,
            ),
            child: Loading(),
          ),
        ),
      ),
    );
  }
}