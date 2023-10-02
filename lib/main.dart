// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'views/background_image.dart';
import 'views/constant.dart';
import 'views/share_save.dart';
import 'views/splash_screen.dart';
import 'views/text_edit.dart';
import 'views/util.dart';
import 'views/wishes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentMode, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              // theme: ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //   useMaterial3: true,
              theme: ThemeData(primarySwatch: Colors.amber),
              darkTheme: ThemeData.dark(),
              themeMode: currentMode,
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
              routes: {
                home_screen: (context) =>
                    MyHomePage(title: 'Festival Post Maker'),
                splash_screen: (context) => SplashScreen(),
                background: (context) => Background(),
                text: (context) => Txt(),
                wish: (context) => Wish(),
                share_save: (context) => ShareScreen(),
              });
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(height: 2),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              },
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode)),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                if (fest.asUint8List != null)
                  Image.memory(fest.asUint8List!, height: 500, width: 400),
                if (fest.asUint8List == null)
                  Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    height: 290,
                    width: 400,
                    color: Colors.amber,
                    child: Center(
                        child: Text(
                            "Click On the + Button To Create A New Post",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ),
                // if (fest.asUint8List != null) Image.memory(dow[fest.indexofdow],height: 500,width: 400),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 5,
            );
          },
          itemCount: dow.length),
      // body: Column(
      //   children: Dow.map((e) => null)
      //     SizedBox(height: 10),
      //     if (fest.asUint8List == null) Container(
      //       margin: EdgeInsets.all(16),
      //       padding: EdgeInsets.all(16),
      //       height: 290,
      //       width: 400,
      //       color: Colors.amber,
      //       child: Center(child: Text("Click On the + Button To Create A New Post",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))),
      //     ),
      //     if (fest.asUint8List != null) Image.memory(fest.asUint8List!,height: 500,width: 400),
      //
      // ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, background);
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
