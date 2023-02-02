import 'package:flutter/material.dart';
import 'package:movie_app/src/screen/bottom_nav_bar.dart';
import 'package:movie_app/src/screen/index/index_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => IndexState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
            // useMaterial3: true
            fontFamily: "Poppins"),
        home: const MyBottomNavBar(),
      ),
    );
  }
}
