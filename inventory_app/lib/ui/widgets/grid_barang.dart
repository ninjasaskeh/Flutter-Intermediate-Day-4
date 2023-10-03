import 'package:flutter/material.dart';
import 'package:inventory_app/provider/item_provider.dart';
import 'package:inventory_app/ui/widgets/grid_item.dart';
import 'package:provider/provider.dart';

import '../pages/form_page.dart';

class GridBarang extends StatelessWidget {
  const GridBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: itemProvider.isFetching
            ? const CircularProgressIndicator()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: itemProvider.listBarang.length,
                itemBuilder: (context, index) {
                  final barang = itemProvider.listBarang[index];
                  return InkWell(
                    splashColor: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                    final route = MaterialPageRoute(
                        builder: (context) => FormPage(
                        itemBarang: barang,
                      ));
                    Navigator.push(context, route);
                    },
                    child: GridItem(barang: barang),
                  );
                }),
      ),
    );
  }
}
