import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeff_li_dam/locator.dart';
import 'package:jeff_li_dam/pages/home_page.dart';
import 'package:jeff_li_dam/private/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:jeff_li_dam/pages/account_page.dart';
import 'package:jeff_li_dam/pages/login_page.dart';
import 'package:jeff_li_dam/pages/splash_page.dart';

// final SupabaseClient supabase =
//     SupabaseClient(Config.supabaseURL, Config.supabaseAnonKey);

Future<void> main() async {
  // Register all the models and services before the app starts
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Config.supabaseURL,
    anonKey: Config.supabaseAnonKey,
  );
  // await supabase.auth.signUp('daniel@jefflistudio.com', '111qqq');

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        // '/': (_) => HomePage(),
        '/login': (_) => const LoginPage(),
        '/account': (_) => const AccountPage(),
        '/home': (_) => HomePage(),
      },
    );
  }
}
