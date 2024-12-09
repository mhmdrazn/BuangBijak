import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fp_tekber/firebase_options.dart';
import 'package:fp_tekber/routes/routes.dart';
import 'package:fp_tekber/screens/not_found.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuangBijak App',
      initialRoute: '/login', // debugging
      theme: ThemeData(
        // Basis hijau yang akan digunakan
        primarySwatch: Colors.green, // Warna utama (green)
        primaryColor: Colors.green, // Warna utama untuk AppBar, buttons, dll.
        hintColor: Colors.greenAccent, // Warna aksen jika diperlukan
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.green, // Tombol utama menggunakan hijau
          textTheme:
              ButtonTextTheme.primary, // Menjaga teks tombol menjadi putih
        ),
        scaffoldBackgroundColor: Colors.white, // Background default putih
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green, // AppBar warna hijau
          foregroundColor: Colors.white, // Teks dan ikon putih
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green, // Tombol teks hijau
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Tombol Elevated hijau
            foregroundColor: Colors.white, // Teks tombol putih
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green, // Floating button hijau
        ),
        iconTheme: const IconThemeData(
          color: Colors.green, // Warna ikon hijau secara default
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor:
              Colors.green, // Warna item terpilih di BottomNavigationBar
          unselectedItemColor:
              Colors.grey, // Warna item tidak terpilih di BottomNavigationBar
        ),
      ),
      routes: appRoutes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
      },
    );
  }
}
