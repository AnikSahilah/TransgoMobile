///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class Resetpassword extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
body:
Stack(
alignment:Alignment.topLeft,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/Frame 2 (1).png"),
height:MediaQuery.of(context).size.height,
width:MediaQuery.of(context).size.width,
fit:BoxFit.cover,
),
Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:30),
child:Align(
alignment:Alignment(0.0, -0.9),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/Reset Password 1.png"),
height:130,
width:225,
fit:BoxFit.cover,
),
),
),
Align(
alignment:Alignment(-0.3, -0.3),
child:Text(
"Reset Password",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w800,
fontStyle:FontStyle.normal,
fontSize:24,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:30),
child:Align(
alignment:Alignment(0.0, 0.4),
child:TextField(
controller:TextEditingController(),
obscureText:true,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(5.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
focusedBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(5.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
enabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(5.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
labelText:"New Password",
labelStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
hintText:"Masukkan new password",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:true,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
prefixIcon:Icon(Icons.lock_open,color:Color(0xff212435),size:24),
suffixIcon:Icon(Icons.visibility_off,color:Color(0xff212435),size:24),
),
),
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:30),
child:Align(
alignment:Alignment(0.0, 0.2),
child:TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(5.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
focusedBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(5.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
enabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(5.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
labelText:"Username",
labelStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
hintText:"Masukkan username",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:true,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
prefixIcon:Icon(Icons.person,color:Color(0xff212435),size:24),
),
),
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:30),
child:Align(
alignment:Alignment(0.0, 0.9),
child:MaterialButton(
onPressed:(){},
color:Color(0xdd1d1397),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.all(16),
child:Text("Konfirmasi", style: TextStyle( fontSize:18,
fontWeight:FontWeight.w800,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:40,
minWidth:140,
),
),
),
],),
)
;}
}