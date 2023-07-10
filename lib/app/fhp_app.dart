import 'package:fhp/app/core/provider/application_bindings.dart';
import 'package:fhp/app/pages/splash_page.dart';
import 'package:flutter/material.dart';

class FhpApp extends StatelessWidget {
  const FhpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBindings(
      child: MaterialApp(
        title: 'Flutter Harry Potter App',
        theme: ThemeData(useMaterial3: true),
        routes: {
          '/': (context) => const SplashPage(),
        },
      ),
    );
  }
}
