// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../main.dart';
import 'constant.dart';
import 'util.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {

  int iIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _OnBackButtonPressed(context),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              // print(iIndex);
              // print(fest!.bgindex);
              Navigator.pushNamed(context, text);
            }, icon: Icon(Icons.navigate_next)),
          ],
          title: Text("Select Your Background"),
        ),
        // resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 300,
              width: 400,
              child: Image.asset(img[iIndex], fit: BoxFit.fill),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                color: Colors.black12,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        iIndex = index;
                        fest?.bgindex=index; // ignore: invalid_null_aware_operator
                        setState(() {});
                      },
                      child: Container(
                        height: 280,
                        width: 40,
                        margin: EdgeInsets.all(10),
                        child: Image.asset(img[index], fit: BoxFit.fill),
                      ),
                    );
                  },
                ),
                // child: ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: img.length,
                //   itemBuilder: (context, index) {
                //     return InkWell(
                //       onTap: () {
                //         iIndex = index;
                //         setState(() {});
                //       },
                //       child: Container(
                //         height: 280,
                //         width: 40,
                //         margin: EdgeInsets.all(10),
                //         child: Image.asset(img[index], fit: BoxFit.fill),
                //       ),
                //     );
                //   },
                // ),
              ),
            ),
          ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Festival Post Maker')),
                );
              }, child: const Text("Yes"),
              ),
            ],
          );
        }
    );
    // ignore: dead_null_aware_expression
    return exitApp ?? false;
  }
}
