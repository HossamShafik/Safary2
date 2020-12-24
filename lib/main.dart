import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/view/on_boarding_screen.dart';
import 'package:project/view/splash_screen.dart';
import 'package:provider/provider.dart';

import 'models/prograss_model_hud.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<prograssHud>(
          create: (context)=>prograssHud(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0
          ),
        ),
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          OnBoardingScreen.id: (context) =>  OnBoardingScreen(),
        },
      ),
    );
  }
}
