
//import 'dart:html';

import 'package:flutter/material.dart';

import 'AddPage.dart';
import 'EditPage.dart';
import 'Service.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}
//Display method
class _DisplayState extends State<Display> {

  ApiService serviceApi = ApiService();
  String value = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.blue,
       title: const Text("Agent BankAccount"),
       actions: [
         IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPage()));
         }, icon: const Icon(Icons.add))
           ]
     ),
      body: FutureBuilder(builder: (
          BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {

            serviceApi.getAll();
            return InkWell(
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("id: ${snapshot.data[index].id}"),
                            Text("Account Name: ${snapshot.data[index].accName}"),
                            Text("Account No: ${snapshot.data[index].accNo}"),
                            Text("Bank Name: ${snapshot.data[index].bankName}"),
                            Text("IFSC code: ${snapshot.data[index].ifscCode}"),
                            Text("Bank Branch: ${snapshot.data[index].bankBranch}"),
                            Text("Created date: ${snapshot.data[index].createdDate}"),
                            Text("Modified date: ${snapshot.data[index].modifiedDate}"),

                            // TextFormField(
                            //   decoration: InputDecoration(
                            //       hintText: "${snapshot.data[index].id}"
                            //   ),
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(id: snapshot.data[index].id)));

                            }, icon: Icon(Icons.edit)
                            ),
                            IconButton(onPressed: () {
                              //Delete function
                                serviceApi.deleteQuants(snapshot.data[index].id);
                                setState(() {
                                  serviceApi.getAll();
                              });
                            }, icon: Icon(Icons.delete_forever)
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          },
        );
      },
        future: serviceApi.getAll(),
      ),
    );
  }
}