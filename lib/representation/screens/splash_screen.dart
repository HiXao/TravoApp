import 'package:flutter/material.dart';
import 'package:hotel/core/helpers/image_helper.dart';
import 'package:hotel/core/helpers/asset_helper.dart';
import 'package:hotel/core/helpers/local_storage_helper.dart';
import 'package:hotel/representation/screens/intro_screen.dart';
import 'package:hotel/representation/screens/main_app.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async{
    final ignoreIntroScreen = LocalStorageHelper.getVaLue('ignoreIntroScreen') as bool?;
    await Future.delayed(const Duration(milliseconds: 2000));
    // ignore: use_build_context_synchronously
    if(ignoreIntroScreen != null && ignoreIntroScreen){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Positioned.fill(  
          child: ImageHelper.loadFromAsset(
            AssetHelper.imageBackGroundSplash,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.imageCircleSplash,
          ),
        ),
      ],
    );
  }
}