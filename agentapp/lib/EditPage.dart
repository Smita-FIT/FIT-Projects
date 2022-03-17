import 'package:flutter/material.dart';
import 'Frontend.dart';
import 'Quants.dart';
import 'Service.dart';

class EditPage extends StatefulWidget {
  int id;
  EditPage({Key? key, required this.id});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    print("hello ${widget.id}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              TextEditingController quantsId =
                  TextEditingController(text: snapshot.data.id.toString());
              TextEditingController quantsaccName =
                  TextEditingController(text: snapshot.data.accName.toString());
              TextEditingController quantsaccNo =
                  TextEditingController(text: snapshot.data.accNo.toString());
              TextEditingController quantsbankName = TextEditingController(
                  text: snapshot.data.bankName.toString());
              TextEditingController quantsifscCode = TextEditingController(
                  text: snapshot.data.ifscCode.toString());
              TextEditingController quantsbankBranch = TextEditingController(
                  text: snapshot.data.bankBranch.toString());
              return Form(
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantsId,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "ID",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
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
                    IconButton(
                        onPressed: () {
                          api.createQuants(Quants(
                            id: int.parse(quantsId.text),
                            accName: quantsaccName.text,
                            accNo: quantsaccNo.text,
                            bankName: quantsbankName.text,
                            bankBranch: quantsbankBranch.text,
                            ifscCode: quantsifscCode.text,
                          ));

                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Display()));
                          });
                        },
                        icon: const Icon(Icons.done))
                  ]),
                ),
              );
            }

            return const CircularProgressIndicator();
          },
          future: api.getQants(widget.id),
        ));
  }
}
