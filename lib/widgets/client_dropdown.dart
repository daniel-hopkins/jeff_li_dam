import 'package:flutter/material.dart';

class ClientDropdown extends StatefulWidget {
  const ClientDropdown({Key? key}) : super(key: key);

  @override
  State<ClientDropdown> createState() => _ClientDropdownState();
}

class _ClientDropdownState extends State<ClientDropdown> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 126, 126, 126),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
