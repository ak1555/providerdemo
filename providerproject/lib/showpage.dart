import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/providertodo/providertodos.dart';

class Showpage extends StatefulWidget {
  const Showpage({super.key});

  @override
  State<Showpage> createState() => _ShowpageState();
}

class _ShowpageState extends State<Showpage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Todoes>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Data")),
      ),
              body: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: ListView.builder(
                    itemCount: value.todolist.length,
                    itemBuilder: (context, index) {
                    return ListTile(
                      // leading: IconButton(onPressed: () {
                        
                      // }, icon: Icon(Icons.edit)),
                         leading: Text(index.toString()),
                      title: Text(value.todolist[index].toString()),
                   
                      // trailing: Row(
                      //   children: [
                      //     IconButton(onPressed: () {
                            
                      //     }, icon: Icon(Icons.edit)),

                      //     IconButton(onPressed: () {
                            
                      //     }, icon: Icon(Icons.delete))
                      //   ],
                      // ),
                      
                      trailing: IconButton(onPressed: () {
                        // int data=value.todolist[index];
                        value.delete(index);

                      }, icon: Icon(Icons.delete)),
                    );
                  },),
                ),
              ),
    ),);
  }
}