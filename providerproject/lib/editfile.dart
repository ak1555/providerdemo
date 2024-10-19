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
  int? indx;
  
  @override
  Widget build(BuildContext context) {
     indx=int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Consumer<Todoes>(builder: (context, value, child) => Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 200, 20, 300),
         margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15)
                ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             
                    Expanded(child: TextField(
                      
                      controller: c1,
                      onTap: () {
                       setState(() {
                          c1.text=value.todolist[indx!].toString();
                       });
                      },
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),

                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
                        backgroundColor: Colors.grey.shade300,
                        shape: BeveledRectangleBorder(  borderRadius: BorderRadius.circular(5))
                      ),
                      onPressed: () {
                      var data=c1.text;
                      if(c1.text!=""){
                        value.editdata(indx,data);
                        c1.clear();
                        Navigator.pop(context);
                      }else{
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("OOPS"),
                          );
                        },);
                      }
                    }, child: Text("Edit"))
                 ,
          ],
        ),
      ),
    ),);
  }
}