///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class profil extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
body:
Stack(
alignment:Alignment.topLeft,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/Frame-2-%281%29.png"),
height:MediaQuery.of(context).size.height,
width:MediaQuery.of(context).size.width,
fit:BoxFit.cover,
),
Align(
alignment:Alignment(0.0, -0.7),
child:Container(
height:65,
width:65,
clipBehavior: Clip.antiAlias,
decoration: BoxDecoration(
shape: BoxShape.circle,
),
child:Image.network(
 "https://picsum.photos/250?image=9",
fit:BoxFit.contain),
),
),
Align(
alignment:Alignment(-0.9, -0.0),
child:Text(
"Tiket Saya",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),
)
;}
}