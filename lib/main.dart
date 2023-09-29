import 'package:flutter/material.dart';

import 'views/background_image.dart';
import 'views/constant.dart';
import 'views/share_save.dart';
import 'views/text_edit.dart';
import 'views/wishes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Festival Post Maker'),
        routes:
        {
          // detail: (context) => PostDetail(),
          background:(context)=> Background(),
          text:(context)=> Txt(),
          wish:(context)=> Wish(),
          share_save:(context)=> Share(),

        }
    );
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
        title: Text(widget.title),
      ),
      body: Text("Hello"),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.pushNamed(context, background);
          }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
