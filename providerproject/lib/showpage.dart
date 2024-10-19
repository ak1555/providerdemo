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

                         leading: Text("${index.toString()}"),
                      title: Text(value.todolist[index].toString()),
                   
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             IconButton(
                               style: IconButton.styleFrom(
                                backgroundColor: Colors.grey.shade200
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "editpage",arguments: index.toString());
                            }, icon: Icon(Icons.edit)),
                            //  Icon(Icons.delete),
                        
                            IconButton(
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.grey.shade300
                              ),
                              onPressed: () {
                               value.delete(index);
                            }, icon: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    );
                  },),
                ),
              ),
    ),);
  }
}