import 'package:flutter/material.dart';
import 'package:farmjigipromo/pages/landing_page.dart';
import 'package:farmjigipromo/theme/app_theme.dart';

void main() {
  runApp(const FarmjigiPromoApp());
}

class FarmjigiPromoApp extends StatelessWidget {
  const FarmjigiPromoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '팜지기 — 스마트 농장 관리 플랫폼',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const LandingPage(),
    );
  }
}
