import 'package:flutter/material.dart';



class Task {
  String title;
  String description;
  String date;

  Task(this.title, this.description, this.date);
}


TextStyle bodyTxtTitle(){
  return const TextStyle(fontSize: 20);
}

TextStyle bottomSheetHeadingTitle(){
  return const TextStyle( fontSize: 20, fontWeight: FontWeight.bold);
}
TextStyle bottomSheetTitle(){
  return const TextStyle(fontWeight: FontWeight.bold);
}
TextStyle bottomSheetDate(){
  return const TextStyle(fontWeight: FontWeight.bold);
}





