import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebasetodo/Auth/add_task.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid=" ";
  @override
  void initState() {

    getuid();
    super.initState();
  }

  getuid()async{
    FirebaseAuth auth=FirebaseAuth.instance;
    final User user= await auth.currentUser!;
    setState(() {
      uid=user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title:Text('TO DO'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(stream:FirebaseFirestore.instance.collection("task").
      doc(uid).collection("mytask").snapshots(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Container(
            height: 100,
            child: CircularProgressIndicator(),);

        }
        else{
          final docs=snapshot.data?.docs;
          return ListView.builder(itemCount: docs?.length,
          itemBuilder: (context,index){
            return Container(margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: Colors.blue,
              borderRadius: BorderRadius.circular(10)),
              height: 90,

              child: Column(
            //  children: [Text(docs?[index]["title"])],
                children: [Text(docs?[index]["title"])],
            ),);
          },);
        }
      },),
      color: Colors.redAccent,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.cyan,onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AddTask()));
      },
      ),



    );
  }
}
