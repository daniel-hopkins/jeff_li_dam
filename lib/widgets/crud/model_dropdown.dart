import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeff_li_dam/models/model.dart';
// import 'package:jeff_li_dam/providers/crud_notifier.dart';
import 'package:jeff_li_dam/providers/riverpod/riverpod_providers.dart';
import 'package:jeff_li_dam/services/crud_service.dart';
import 'package:jeff_li_dam/locator.dart';

class ModelDropdown extends ConsumerStatefulWidget {
  const ModelDropdown({Key? key}) : super(key: key);

  @override
  _ModelDropdownState createState() => _ModelDropdownState();
}

class _ModelDropdownState extends ConsumerState<ModelDropdown> {
  int _model = 0;

  var models = <String>[];

  @override
  Widget build(BuildContext context) {
    final crud = ref.watch(crudProvider);
    return FutureBuilder<List<Model>>(
        future: locator<CrudService>().getModels(crud.brandId),
        builder: (context, AsyncSnapshot<List<Model>> snapshot) {
          if (snapshot.hasData == false) {
            return Center(child: const CircularProgressIndicator());
          } else {
            models.clear();
            for (var model in snapshot.data!) {
              models.add(model.name);
            }
          }

          return DropdownButton<int>(
            value: _model == null ? null : snapshot.data![_model].id,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            underline: Container(
              height: 2,
              color: Color.fromARGB(255, 126, 126, 126),
            ),
            onChanged: (value) {
              setState(() {
                // _model = models.indexOf(value!);
                // _model = snapshot.data!.id;
                ref.read(crudProvider).modelId = value!;
              });
            },
            //TODO: redo it dynamically like this https://stackoverflow.com/a/53119947/1318448

            items: snapshot.data?.map<DropdownMenuItem<int>>((Model value) {
              return DropdownMenuItem<int>(
                value: value.id,
                child: Text(value.name),
              );
            }).toList(),
          );
        });
  }
}
