import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: true).addListener(() {
      print(
          "ThemeSS: ${Provider.of<ThemeProvider>(context, listen: false).themeMode}");
    });
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              AppTheme.mode == Brightness.light ? "Light Theme" : "Dark Theme"),
          FlatButton(
              onPressed: () {
                AppTheme.mode == Brightness.light
                    ? Provider.of<ThemeProvider>(context, listen: false)
                        .changeToDarkTheme()
                    : Provider.of<ThemeProvider>(context, listen: false)
                        .changeToLightTheme();
              },
              child: Text("Change Theme"))
        ],
      ),
    );
  }
}
