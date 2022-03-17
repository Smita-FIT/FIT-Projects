

import 'package:flutter/material.dart';

import 'Quants.dart';
import 'Service.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  ApiService api = ApiService();
  TextEditingController quantsId = TextEditingController();
  TextEditingController quantsaccName = TextEditingController();
  TextEditingController quantsaccNo = TextEditingController();
  TextEditingController quantsbankName = TextEditingController();
  TextEditingController quantsifscCode = TextEditingController();
  TextEditingController quantsbankBranch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 10,width: 10),
          TextFormField(
            controller: quantsId,
            decoration: const InputDecoration(
              labelText: "ID",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,width: 10),
          TextFormField(
            controller: quantsaccName,
            decoration: const InputDecoration(
              labelText: "Account Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: quantsaccNo,
            decoration: const InputDecoration(
              labelText: "Account No",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: quantsbankName,
            decoration: const InputDecoration(
              labelText: "bank name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: quantsifscCode,
            decoration: const InputDecoration(
              labelText: "ifcs code",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: quantsbankBranch,
            decoration: const InputDecoration(
              labelText: "bank branch",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          IconButton(onPressed: (){
          Navigator.pop(context);
          api.createQuants(Quants(
            id: int.parse(quantsId.text),
            accName: quantsaccName.text,
            accNo: quantsaccNo.text,
            bankName: quantsbankName.text,
            bankBranch: quantsbankBranch.text,
            ifscCode: quantsifscCode.text,


          ));
          }, icon: const Icon(Icons.done))
        ]),
      ),
    );
  }
}
