import 'package:flutter/material.dart';
import 'package:responsive/consts.dart';
import 'package:responsive/desktop_screen.dart';
import 'package:responsive/mobile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          primary: kPrimaryColor,
        ),
        useMaterial3: true,
      ),
      home: LayoutBuilder(builder: (context, constraints) {
        print(constraints.minWidth.toInt());
        return constraints.minWidth.toInt() > 670
            ? MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.25),
                ),
                child: const DesktopScreen())
            : MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(0.8),
                ),
                child: const MobileScreen(),
              );
      }),
    );
  }
}
