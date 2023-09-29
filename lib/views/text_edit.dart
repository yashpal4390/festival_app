import 'package:flutter/material.dart';

import 'constant.dart';
import 'util.dart';

class Txt extends StatefulWidget {
  const Txt({super.key});

  @override
  State<Txt> createState() => _TxtState();
}
class _TxtState extends State<Txt> {

  String text = "";

  // double sliderVal = 0;
  // double sliderVal1 = 0;
  // double rotate = 0;
  // int cIndex = 0;
  // int fIndex = 0;
  // double textSize = 12;
  // bool isBold = false;
  // Alignment textTopPos = Alignment(0.5, 0.5);


  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Edit"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, wish);
          }, icon: Icon(Icons.navigate_next))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: 400,
                child: Stack(
                  children: [
                    Image.asset(img[fest!.bgindex], fit: BoxFit.contain),
                    Center(
                      child: Align(
                        alignment: fest.textTopPos,
                        child: Transform.rotate(
                          angle: fest.rotate,
                          child: SelectableText(
                            "${fest.name}",
                            style: fonts[fest.fIndex].copyWith(
                                color: colors[fest.cIndex],
                                fontSize: fest.textSize,
                                fontWeight:
                                fest.isBold ? FontWeight.bold : FontWeight.normal),
                            // style: TextStyle(fontFamily: "Schyler",fontSize: textSize,fontWeight: isBold ? FontWeight.bold:FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Text",
                  fillColor: Colors.grey,
                  filled: true,
                  // border: OutlineInputBorder.none
                ),
                onChanged: (value) {
                  fest.name = value;
                  setState(() {});
                },
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        fest.textSize++;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.format_size,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        fest.textSize--;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.format_size,
                        size: 20,
                      )),
                  IconButton(
                      onPressed: () {
                        fest.isBold = !fest.isBold;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.format_bold,
                        size: 20,
                      )),
                ],
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(10),
                color: Colors.black12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        fest.fIndex = index;
                        setState(() {});
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Aa",
                            style: fonts[index].copyWith(fontSize: 40),
                          )),
                    );
                  },
                  itemCount: fonts.length,
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                color: Colors.black12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        fest.cIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        color: colors[index],
                        margin: EdgeInsets.all(10),
                      ),
                    );
                  },
                ),
              ),
              Slider(
                value: fest.sliderVal,
                min: -1,
                max: 1,
                onChanged: (value) {
                  fest.sliderVal = value;
                  fest.textTopPos = Alignment(value, 0.5);
                  setState(() {});
                },
              ),
              Slider(
                value: fest.sliderVal1,
                min: -1,
                max: 1,
                onChanged: (value) {
                  fest.sliderVal1 = value;
                  fest.textTopPos = Alignment(fest.sliderVal, fest.sliderVal1);
                  setState(() {});
                },
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        fest.rotate = 0;
                        setState(() {});
                      },
                      icon: Icon(Icons.restart_alt_sharp)),
                  IconButton(
                      onPressed: () {
                        fest.rotate = fest.rotate + 35;
                        setState(() {});
                      },
                      icon: Icon(Icons.rotate_90_degrees_ccw)),
                ],
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        fest.cIndex = 0;
                        fest.fIndex = 0;
                        text = "";
                        fest.textSize = 12;
                        fest.isBold = false;
                        controller.clear();
                        controller1.clear();
                        setState(() {});
                      },
                      icon: Icon(Icons.refresh)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

