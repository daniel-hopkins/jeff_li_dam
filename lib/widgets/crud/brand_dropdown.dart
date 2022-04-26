import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeff_li_dam/providers/riverpod/riverpod_providers.dart';

class BrandDropdown extends ConsumerStatefulWidget {
  const BrandDropdown({Key? key}) : super(key: key);

  @override
  _BrandDropdownState createState() => _BrandDropdownState();
}

class _BrandDropdownState extends ConsumerState<BrandDropdown> {
  int _brand = 0;

  var brands = <String>['Select Brand', 'Honda', 'Acura'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _brand == null ? null : brands[_brand],
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 126, 126, 126),
      ),
      onChanged: (value) {
        setState(() {
          _brand = brands.indexOf(value!);
          ref.read(crudProvider).brandId = _brand;
        });
      },
      //TODO: redo it dynamically like this https://stackoverflow.com/a/53119947/1318448

      items: brands.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
