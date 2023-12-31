import 'package:fischtracker_wear/counter/counter.dart';
import 'package:fischtracker_wear/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Add ambient mode support
    return AmbientMode(
      child: const CounterPage(),
      builder: (context, mode, child) {
        return MaterialApp(
          theme: ThemeData(
            // Uncomment this to use material 3
            // useMaterial3: true,
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            // This makes elements such as buttons have a fewer pixels in
            // padding and general spacing. good for devices with limited screen
            // real state.
            visualDensity: VisualDensity.compact,
            // When in ambient mode, change the apps color scheme
            colorScheme: mode == WearMode.active
                ? const ColorScheme.dark(
                    primary: Color(0xFF00B5FF),
                  )
                : const ColorScheme.dark(
                    primary: Colors.white24,
                    onBackground: Colors.white10,
                    onSurface: Colors.white10,
                  ),
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: child,
        );
      },
    );
  }
}
