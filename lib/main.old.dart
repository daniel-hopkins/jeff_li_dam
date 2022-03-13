// import 'package:flutter/material.dart';
// import 'package:jeff_li_dam/pages/home_page.dart';
// import 'package:jeff_li_dam/utils/config.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// // Future<Supabase> supabaseClient = Supabase.initialize(
// //     url: Config.supabaseURL, anonKey: Config.supabaseAnonKey);

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//       url: Config.supabaseURL,
//       anonKey: Config.supabaseAnonKey,
//       authCallbackUrlHostname: 'login-callback', // optional
//       debug: true // optional
//       );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }
