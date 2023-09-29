import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

import 'util.dart';
class Share extends StatefulWidget {
  const Share({super.key});

  @override
  State<Share> createState() => _ShareState();
}
TextEditingController controller3 = TextEditingController(text: "${fest.wish}");
GlobalKey key = GlobalKey();
Uint8List? asUint8List;

class _ShareState extends State<Share> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share & Save"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            // Share.share(desc.Wish ?? "");
          }, icon: Icon(Icons.share)),
          IconButton(onPressed: () async{
            // To get byte data
            RenderRepaintBoundary renderObject = key.currentContext?.findRenderObject() as RenderRepaintBoundary;
            var image = await renderObject.toImage();
            ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
            asUint8List = byteData?.buffer.asUint8List();

            // To save file
            var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
            var date = DateTime.now().toString();
            String filePath = "${applicationDocumentsDirectory.path}/${date}_img.jpg";
            File file = File(filePath);
            await file.writeAsBytes(asUint8List?.toList() ?? []);
            setState(() {

            });
            print("Downlaod");
          }, icon: Icon(Icons.download)),
        ],
      ),
      body: SingleChildScrollView(
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
                  Align(
                    alignment: fest.textTopPos1,
                    child: Transform.rotate(
                      angle: fest.rotate1,
                      child: SelectableText(
                        "${fest.wish}",
                        style: fonts[fest.fIndex1].copyWith(
                            color: colors[fest.cIndex1],
                            fontSize: fest.textSize1,
                            fontWeight:
                            fest.isBold1 ? FontWeight.bold : FontWeight.normal),
                        // style: TextStyle(fontFamily: "Schyler",fontSize: textSize,fontWeight: isBold ? FontWeight.bold:FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       color: Colors.greenAccent,
            //     ),
            //     child: Text("Change Position Of Name")
            // ),
            // Slider(
            //   value: fest.sliderVal,
            //   min: -1,
            //   max: 1,
            //   onChanged: (value) {
            //     fest.sliderVal = value;
            //     fest.textTopPos = Alignment(value, 0.5);
            //     setState(() {});
            //   },
            // ),
            // Slider(
            //   value: fest.sliderVal1,
            //   min: -1,
            //   max: 1,
            //   onChanged: (value) {
            //     fest.sliderVal1 = value;
            //     fest.textTopPos = Alignment(fest.sliderVal, fest.sliderVal1);
            //     setState(() {});
            //   },
            // ),
            SizedBox(height: 10),
            TextField(
              controller: controller3,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                // hintText: "${fest.wish}",
                fillColor: Colors.white60,
                filled: true,
                // border: OutlineInputBorder.none
              ),
              onChanged: (value) {
                fest.wish = value;
                setState(() {});
              },
            ),
            Slider(
              value: fest.sliderVal2,
              min: -1,
              max: 1,
              onChanged: (value) {
                fest.sliderVal2 = value;
                fest.textTopPos1 = Alignment(value, 0.5);
                setState(() {});
              },
            ),
            Slider(
              value: fest.sliderVal3,
              min: -1,
              max: 1,
              onChanged: (value) {
                fest.sliderVal3 = value;
                fest.textTopPos1 = Alignment(fest.sliderVal2, fest.sliderVal3);
                setState(() {});
              },
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      fest.textSize1++;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.format_size,
                      size: 28,
                    )),
                IconButton(
                    onPressed: () {
                      fest.textSize1--;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.format_size,
                      size: 20,
                    )),
                IconButton(
                    onPressed: () {
                      fest.isBold1 = !fest.isBold1;
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
                      fest.fIndex1 = index;
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
                      fest.cIndex1 = index;
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
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      fest.rotate1 = 0;
                      setState(() {});
                    },
                    icon: Icon(Icons.restart_alt_sharp)),
                IconButton(
                    onPressed: () {
                      fest.rotate1 = fest.rotate1 + 35;
                      setState(() {});
                    },
                    icon: Icon(Icons.rotate_90_degrees_ccw)),

                IconButton(
                    onPressed: () {
                      fest.cIndex1 = 0;
                      fest.fIndex1 = 0;
                      fest.textSize1 = 12;
                      fest.isBold1 = false;

                      controller3.clear();
                      setState(() {});
                    },
                    icon: Icon(Icons.clear)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
