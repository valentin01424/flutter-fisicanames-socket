// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_curso_avanzado2/models/band.dart';

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
     Band(id: "1", name:"relatividad general" , votes: 5),
     Band(id: "2", name:"cuantica" , votes: 5),
     Band(id: "3", name:"relatividad espacial" , votes: 4),
     Band(id: "4", name:"union de campos" , votes: 3),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fisica teorias", style: TextStyle(color: Colors.black87),) ,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int i) => _bandTile(bands[i]),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: addNewBand,
          elevation: 1,
        ),
    );
  }

  Widget _bandTile( Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print("directiob:$direction");
        print("id: ${band.id}");
      },
      background: Container(
        padding: EdgeInsets.only(left: 10),
        color: Colors.red,
        child: Align(
          alignment:Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.red[900],),
          ),
      ),
      child: ListTile(
              leading: CircleAvatar(
                child: Text(band.name.substring(0,2)),
                backgroundColor: Colors.blue[100],
              ),
              title: Text(band.name),
              trailing: Text("${band.votes}", style: TextStyle(fontSize: 20),),
              onTap: (){
                print(band.name);
              },
            ),
    );
  }
  addNewBand(){
    // ignore: unused_local_variable, unnecessary_new
    final textController = new TextEditingController(); 
    showDialog(
    context: context, 
    builder: (context){
      return AlertDialog(
          title: Text("New theory name:"),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => addBandToList(textController.text),
              child: Text("add"),
              textColor: Colors.blue,
              elevation: 5,
              )
          ],
      );
    }
    );
  } 
  void addBandToList(String name){
    print(name);
    if (name.length > 1) {
      //agregamos
      this.bands.add( new Band(id: DateTime.now().toString(), name: name, votes: 5));
      setState(() {
        
      });
    }
    Navigator.pop(context);
  }
}