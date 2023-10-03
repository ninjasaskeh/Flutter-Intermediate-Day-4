import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventory_app/model/response_barang.dart';
import 'package:inventory_app/service/auth_services.dart';

import '../model/response_crud.dart';

class ItemServices {
  // final host = "192.168.70.14";
  Future<List<Barang>> getlistBarang() async {
    final uri = Uri.http(host, "server_inventory/index.php/api/getBarang");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseBarang responseBarang = ResponseBarang.fromJson(decode);
      List<Barang> listBarang = responseBarang.barang;
      return listBarang;
    } else {
      throw Exception('Failed to load barang');
    }
  }

  Future<ResponseCrud?> deleteBarang(String id) async {
    final uri = Uri.http(host, "server_inventory/index.php/api/deleteBarang");
    final response = await http.post(
      uri,
      body: {'id': id},
    );
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseCrud responseCrud = ResponseCrud.fromJson(decode);
      return responseCrud;
    } else {
      throw Exception('Failed to delete baranger');
    }
  }

  Future<ResponseCrud?> insertBarang(String name, String amount, String urlImage) async {
    final uri = Uri.http(host, "server_inventory/index.php/api/insertBarang");
    final response = await http.post(
      uri,
      body: {
        'nama': name,
        'jumlah': amount,
        'gambar': urlImage
        },
    );
      if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseCrud responseCrud = ResponseCrud.fromJson(decode);
      return responseCrud;
    } else {
      throw Exception('Failed to delete baranger');
    }
  }

  Future<ResponseCrud?> updateBarang(String id, String name, String amount, String urlImage) async {
    final uri = Uri.http(host, "server_inventory/index.php/api/updateBarang");
    final response = await http.post(
      uri,
      body: {
        'id': id,
        'nama': name,
        'jumlah': amount,
        'gambar': urlImage
        },
    );
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseCrud responseCrud = ResponseCrud.fromJson(decode);
      return responseCrud;
    } else {
      throw Exception('Failed to update barange');
    }
  }
}
