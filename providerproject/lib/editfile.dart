import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/providertodo/providertodos.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController c1 =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Todoes>(builder: (context, value, child) => Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
             Container(child:  Row(
                  children: [
                    Expanded(child: TextField(
                      controller: c1,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                    TextButton(onPressed: () {
                      var data=c1.text;
                      if(c1.text!=""){
                        value.adddata(data);
                        c1.clear();
                      }else{
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("OOPS"),
                          );
                        },);
                      }
                    }, child: Text("ADD"))
                  ],
                ),)
          ],
        ),
      ),
    ),);
  }
}