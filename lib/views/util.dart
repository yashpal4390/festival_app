// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import 'class.dart';
List<String> img = [
  "images/f1.jpeg",
  "images/f2.jpeg",
  "images/f3.jpeg",
  "images/f4.jpeg",
  "images/f5.jpeg",
  "images/f6.jpeg",
  "images/f7.jpeg",
];


List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.cyan,
  Colors.brown,
  Colors.orange
];
List<TextStyle> fonts = [
  GoogleFonts.lato(),
  GoogleFonts.dancingScript(),
  GoogleFonts.freehand(),
  GoogleFonts.megrim(),
  GoogleFonts.moul(),
];
Festival fest=Festival();


List<Uint8List> dow=[];


List<Map <Uint8List, dynamic>> adddow=[];

