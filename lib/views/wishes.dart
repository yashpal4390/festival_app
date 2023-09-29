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
    return Scaffold(
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
    );
  }
}
