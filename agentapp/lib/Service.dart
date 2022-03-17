import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'Quants.dart';

class ApiService {

  void deleteQuants(id) async {
    final response = await http.patch(
        Uri.parse('http://192.168.68.109:8080/ClientBank/delete/$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',

        });
    print(response);
  }

  Future<List<Quants>> getAll() async {
    Response res =
        await get(Uri.parse("http://192.168.68.109:8080/ClientBank/getAllActive"));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Quants> quants = body.map((e) => Quants.fromJson(e)).toList();
      print(quants.toString());
      return quants;
    }
    throw Exception("Data Not Found");
  }

  Future<Quants> getQants(id)
  async {
    Response res = await get(Uri.parse("http://192.168.68.109:8080/ClientBank/$id"));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      Quants quants = Quants.fromJson(body);
      return quants;
    }
    throw Exception("Data not found");
  }


  Future<Quants> createQuants(Quants quans) async {
    final response = await http.post(
      Uri.parse('http://192.168.68.109:8080/ClientBank/add'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "id": quans.id,
        "acc_name": quans.accName,
        "acc_no": quans.accNo,
        "bank_Name": quans.bankName,
        "ifsc_code": quans.ifscCode,
        "bank_branch": quans.bankBranch,
        //"is_active": 1,
        "created_date": quans.createdDate,
        "modified_date": quans.modifiedDate,
      }),
    );
    return Quants.fromJson(jsonDecode(response.body));
  }

  Future<Quants> updateQuants(id, Quants quans) async {
    final response = await http.patch(
      Uri.parse('http://192.168.68.109:8080/update/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "id": quans.id,
        "acc_name": quans.accName,
        "acc_no": quans.accNo,
        "bank_Name": quans.bankName,
        "ifsc_code": quans.ifscCode,
        "bank_branch": quans.bankBranch,
        //"is_active": 1,
        "created_date": quans.createdDate,
        "modified_date": quans.modifiedDate,
      }),
    );
    return Quants.fromJson(jsonDecode(response.body));
  }
}
//Post method

//delete



