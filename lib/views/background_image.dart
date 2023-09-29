import 'package:flutter/material.dart';

import 'constant.dart';
import 'data.dart';
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            print(iIndex);
            print(fest!.bgindex);
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
            child: Image.asset(img[iIndex], fit: BoxFit.contain),
          ),
          Container(
            height: 250,
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
                    fest?.bgindex=index;
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
        ],
      ),
    );
  }
}
