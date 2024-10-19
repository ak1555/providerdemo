import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/providertodo/providertodos.dart';

class MainFile extends StatefulWidget {
  const MainFile({super.key});

  @override
  State<MainFile> createState() => _MainFileState();
}

class _MainFileState extends State<MainFile> {
  TextEditingController c1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Todoes>(builder: (context, value, child) => Scaffold(
      body: Container(
       height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Container(
                // height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("Add Elements", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          )),),
              Container(
                height: 100,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      controller: c1,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                    SizedBox(width: 10,),
                    TextButton(
                      style: TextButton.styleFrom(
                        // padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
                        backgroundColor: Colors.grey.shade300,
                        shape: BeveledRectangleBorder(  borderRadius: BorderRadius.circular(1))
                      ),
                      onPressed: () {
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
                ),
              ),
              SizedBox(height: 25,),
              Expanded(child: 
              ListView.builder(
                itemCount: value.todolist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.todolist[index].toString()),
                  );
                
              },))
            ],
          ),
        ),

      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 2.0,
        // color: Colors.blueGrey,
       padding: EdgeInsets.all(5),
       clipBehavior: Clip.antiAlias,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Move To Next Page  ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, "showpage");
          }, icon:Icon(Icons.arrow_forward_outlined))
          ],),
        // child: BottomNavigationBar(items: [
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.refresh), label: "Clear"),

        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.arrow_forward), label:"Go"),
        // ]),
          
          ),
    ),
    );
  }
}