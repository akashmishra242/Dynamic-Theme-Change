// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // static bool darkTheme = false;
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme._isDarkTheme == false
          ? ThemeData.light()
          : ThemeData.dark(),
      // darkTheme: this.darkTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Switch Theme".text.make(),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_rounded),
            onPressed: () {
              currentTheme.toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: "Switch".text.make(),
              trailing: Switch(
                  value: CustomTheme._isDarkTheme,
                  onChanged: (a) {
                    // CustomTheme._isDarkTheme = a;
                    currentTheme.toggleTheme();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
