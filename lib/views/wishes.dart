// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'model.dart';
import 'constant.dart';
import 'data.dart';
import 'util.dart';

class Wish extends StatefulWidget {
  const Wish({super.key});

  @override
  State<Wish> createState() => _WishState();
}

class _WishState extends State<Wish> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _OnBackButtonPressed(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select Any"),
          centerTitle: true,
        ),
        body: Container(
          child: GridView.builder(
            itemCount: greeting.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              Map qt = greeting[index];
              var Description = desc.fromMap(qt);
              return InkWell(
                onTap: (){
                  fest.wish=Description.Wish ??"";
                  Navigator.pushNamed(context, share_save);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(gradient: LinearGradient(colors:[
                    Colors.cyan,
                    Colors.redAccent,
                  ] )),
                  child: Center(
                    child: Text(Description.Wish ??"",style: TextStyle(
                      color: Colors.white,
                    )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  _OnBackButtonPressed(BuildContext context) async{
    bool exitApp= await showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Really ??"),
            content: const Text("Do You Want to Back to Previous Screen??"),
            actions: <Widget>[
              TextButton(onPressed: (){
                Navigator.of(context).pop(false);
              }, child: const Text("No")
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              }, child: const Text("Yes"),
              ),
            ],
          );
        }
    );

    return exitApp ?? false; // ignore: dead_null_aware_expression
  }
}
