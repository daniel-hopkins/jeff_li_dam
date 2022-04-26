import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jeff_li_dam/widgets/crud/brand_dropdown.dart';
import 'package:jeff_li_dam/providers/riverpod/riverpod_providers.dart';
import 'package:jeff_li_dam/widgets/crud/model_dropdown.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InsertOrder extends ConsumerStatefulWidget {
  InsertOrder({Key? key}) : super(key: key);

  @override
  _InsertOrderState createState() => _InsertOrderState();
}

class _InsertOrderState extends ConsumerState<InsertOrder> {
  final _formKey = GlobalKey<FormState>();
  File? image;
  @override
  Widget build(BuildContext context) {
    final crud = ref.watch(crudProvider);
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 500,
        child: Column(
          children: [
            // Text('${crud.brandId}'),
            const BrandDropdown(),
            (crud.brandId > 0)
                ? const SizedBox(
                    child: ModelDropdown(),
                  )
                : const SizedBox(),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 17),
                hintText: 'Image Name',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(18),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     try {
            //       final XFile? pickedFile = await ImagePicker()
            //           .pickImage(source: ImageSource.gallery);
            //       if (pickedFile == null) return;
            //       final File file = File(pickedFile.path);

            //       try {
            //         print("try to call saveImagePermanently");
            //         await saveImagePermanently(file);
            //       } catch (e) {
            //         print("---------- $e");
            //       }

            //       // final imageTemporary = File(image.path);
            //       // this.image = imageTemporary;
            //     } on PlatformException catch (e) {
            //       print("failed to pick image $e");
            //     }
            //   },
            //   child: const Text("upload"),
            // ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  print(
                      "create a new job record brand_id = ${crud.brandId}, model_id = ${crud.modelId}, name = ${_formKey.currentState.toString()}");
                  final insertResponse = Supabase.instance.client
                      .from('jobs')
                      .insert({
                    'brand_id': crud.brandId,
                    'model_id': crud.modelId,
                    'name': 'test1'
                  }).execute();
                  print("insertResponse = ${insertResponse.toString()}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Insert Job'),
            ),
          ],
        ),
      ),
    );
  }

  saveImagePermanently(File file) async {
    print("entered saveImagePermanently image.path = ${file}");

    try {
      print("file = $file");
      // File fileToUpload = image;
      final storageResponse = await Supabase.instance.client.storage
          .from('public')
          .upload('jli-dam/test/', file);
      print('upload response : ${storageResponse.data}');
      // Get download url
      final urlResponse = await Supabase.instance.client.storage
          .from('public')
          .createSignedUrl(file.path, 60);
      print('download url : ${urlResponse.data}');
    } on Exception catch (e) {
      print("))))))))))))))$e");
    }

    // final directory = await getApplicationDocumentsDirectory();
    // final name = basename(imagePath);
    // final image = File('${directory.path}/$name');

    // return File(imagePath).copy(image.path);
  }
}
