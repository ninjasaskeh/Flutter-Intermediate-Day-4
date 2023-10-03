import 'package:flutter/material.dart';
import 'package:inventory_app/model/response_barang.dart';
import '../model/response_crud.dart';
import '../service/item_services.dart';

class ItemProvider extends ChangeNotifier {
  final ItemServices _itemServices = ItemServices();

  //GET
  bool _isFetching = false;
  bool get isFetching => _isFetching;
  List<Barang> _listBarang = [];
  List<Barang> get listBarang => _listBarang;

  Future<void> getListBarang() async {
    _isFetching = true;
    notifyListeners();
    _listBarang = await _itemServices.getlistBarang();
    _isFetching = false;
    notifyListeners();
  }

  ItemProvider() {
    getListBarang();
  }

  //CRUD
  ResponseCrud? _responseCrud;
  ResponseCrud? get responseCrud => _responseCrud;

  List<Barang> _listSearchBarang = [];
  List<Barang> get listSearchBarang => _listSearchBarang;

  Future<void> insertBarang(String name, String amount, String urlImage) async {
    final response = await _itemServices.insertBarang(name, amount, urlImage);
    _responseCrud = response;

    Barang itemBarang =  Barang(
      barangId: response!.lastId.toString() ,
      barangNama: name,
      barangJumlah: amount,
      barangGambar: urlImage);
      
    _listBarang.add(itemBarang);
    notifyListeners();
  }

  Future<void> deleteBarang(String id) async {
 final response = await _itemServices.deleteBarang(id);
 _responseCrud = response;
 _listBarang.removeWhere((itemBarang) => itemBarang.barangId == id);
 notifyListeners();
}


Future<void> updateBarang(
   String id, String name, String amount, String urlImage) async {
 final response =
     await _itemServices.updateBarang(id, name, amount, urlImage);
 _responseCrud = response;
 final index = _listBarang.indexWhere((barang) => barang.barangId == id);
 final updatedBarang = Barang(
   barangId: id,
   barangNama: name,
   barangJumlah: amount,
   barangGambar: urlImage,
 );
 _listBarang[index] = updatedBarang;
 notifyListeners();
}


void search(String keywords) {
 List<Barang> listSearch = [];
 if (keywords.isEmpty || keywords == " ") {
   listSearch.clear();
   _listSearchBarang = listSearch;
 } else {
   for (var itemBarang in _listBarang) {
     if (itemBarang.barangNama.toLowerCase().contains(keywords)) {
       listSearch.add(itemBarang);
     }
   }
   _listSearchBarang = listSearch;
 }
 notifyListeners();
}


}
