// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'features/authentication/screens/splash_screen/splash_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'The Flutter Way',
//       theme: ThemeData(
//         fontFamily: "Intel",
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
//         ),
//         inputDecorationTheme: const InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.white,
//           errorStyle: TextStyle(height: 0),
//           border: defaultInputBorder,
//           enabledBorder: defaultInputBorder,
//           focusedBorder: defaultInputBorder,
//           errorBorder: defaultInputBorder,
//         ),
//       ),
//       home: const SplashScreen(),
//       routes: {
//
//         // Add routes for other screens
//       },
//     );
//   }
// }
//
// const defaultInputBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(16)),
//   borderSide: BorderSide(
//     color: Color(0xFFDEE3F2),
//     width: 1,
//   ),
// );


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/routes_pages_navigation/named_routes_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        fontFamily: "Intel",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
      initialRoute: AppRoutes.splash, // Set the initial route
      getPages: AppRoutes.routes,
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);


/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}

 */





