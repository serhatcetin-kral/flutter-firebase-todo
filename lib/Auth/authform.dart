import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatefulWidget {


  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final _formkey=GlobalKey<FormState>();
  var _password="";
  var _email="";
  var _username='';
  bool isLoginPage=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
child:ListView(children: [
       Container(

         padding: EdgeInsets.only(left: 10,right: 10,top: 20),
         child: Form(
           key: _formkey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,

             children: [
               if(!isLoginPage)
   TextFormField(
     keyboardType: TextInputType.emailAddress,
     key: ValueKey('email'),
     validator: (value){
       if(value!.isEmpty || !value!.contains('@')){
   return 'Incorrect email';
       }
       return null;
     },
     onSaved: (value){
       _email=value!;
     },
     decoration: InputDecoration(
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8.0),
         borderSide: BorderSide()
       ),
           labelText: "enter e ameil",
       labelStyle:GoogleFonts.roboto()
     ),
   ),
               SizedBox(height: 20,),
               TextFormField(
                 keyboardType: TextInputType.emailAddress,
                 key: ValueKey('password'),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'invalid password';
                   }
                   return null;
                 },
                 onSaved: (value){
                   _password=value!;
                 },
                 decoration: InputDecoration(
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8.0),
                         borderSide: BorderSide()
                     ),
                     labelText: "enter password",
                     labelStyle:GoogleFonts.roboto()
                 ),
               ),
               SizedBox(height: 20,),
               TextFormField(
                 keyboardType: TextInputType.emailAddress,
                 key: ValueKey('username'),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Incorrect username';
                   }
                   return null;
                 },
                 onSaved: (value){
                   _username=value!;
                 },
                 decoration: InputDecoration(
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8.0),
                         borderSide: BorderSide()
                     ),
                     labelText: "enter a username",
                     labelStyle:GoogleFonts.roboto()
                 ),
               ),
       SizedBox(height: 20,),
       Container(
         padding: EdgeInsets.all(5),
         width: double.infinity,
         height: 70,
         child: ElevatedButton(
           style: ElevatedButton.styleFrom(onSurface: Colors.purple, shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10.0)
           )),

           onPressed: null,
           child: isLoginPage ? Text('Login' ,style: TextStyle(color: Colors.purple,fontSize: 24),) :
           Text("Signup",style:TextStyle(color: Colors.purple,fontSize: 24)),))
             ],
           ),
         ),

       )

],),

    );
  }
}
