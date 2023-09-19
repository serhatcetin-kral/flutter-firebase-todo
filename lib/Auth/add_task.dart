import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTask extends StatefulWidget {

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController=TextEditingController();
  TextEditingController discriptionController=TextEditingController();

  addtasktofirebase()async{
    FirebaseAuth auth=FirebaseAuth.instance;

    final User user=await  auth.currentUser!;

    String uid=user.uid;
    var time =DateTime.now;
    await FirebaseFirestore.instance.collection("task").doc(uid).collection("mytask").doc(time.toString()).set({"title":titleController.text,"description":discriptionController.text,
    "time":time.toString()});


    Fluttertoast.showToast(
      msg: "data added",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("New Task"),

      ),
      body: Container(child: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(5),
            child: TextField(
              controller:titleController,

          decoration: InputDecoration(
            labelText: "Enter Title",
            border: OutlineInputBorder()
          ),
        ),),
          SizedBox(height: 10,),
          Container(
            margin:EdgeInsets.all(5),
            child: TextField(
              controller: discriptionController,
            decoration: InputDecoration(
                labelText: "Enter Desciription",
                border: OutlineInputBorder()
            ),
          ),),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.all(5),
          width: double.infinity,
          height: 50,
          child:ElevatedButton(
            child: Text('Add Task'),
            onPressed: () {
                        addtasktofirebase();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 22))),
          ))
        ],
      ),),);
  }
}