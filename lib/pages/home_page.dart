import 'package:flutter/material.dart';
// import 'package:jeff_li_dam/main.dart';
import 'package:jeff_li_dam/models/brand.dart';
import 'package:jeff_li_dam/models/model.dart';
import 'package:jeff_li_dam/widgets/client_dropdown.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBrand = true;
  int brandId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ClientDropdown(),
    ));
  }

  Future<List<Brand>> getBrands() async {
    final response =
        await Supabase.instance.client.from('brands').select().execute();
    // print("response.error = ${response.error}");
    // print(response.data);
    final dataList = response.data as List;
    return dataList.map((map) => Brand.fromJson(map)).toList();
  }

  Future<List<Model>> getModels() async {
    final response = await Supabase.instance.client
        .from('models')
        .select()
        .eq('brand_id', brandId)
        .order('name', ascending: true)
        .execute();
    print("response.error = ${response.error}");
    print(response.data);
    final dataList = response.data as List;
    return dataList.map((map) => Model.fromJson(map)).toList();
  }
}

/*
showBrand
          ? FutureBuilder<List<Brand>>(
              future: getBrands(),
              builder: (context, AsyncSnapshot<List<Brand>> snapshot) {
                if (snapshot.hasData == false) {
                  return const CircularProgressIndicator();
                }

                return ListView(
                  children: snapshot.data!
                      .map((brand) => ListTile(
                            title: TextButton(
                              child: Text(brand.name),
                              onPressed: () {
                                setState(() {
                                  showBrand = false;
                                  brandId = brand.id;
                                });
                              },
                            ),
                          ))
                      .toList(),
                );
              })
          : FutureBuilder<List<Model>>(
              future: getModels(),
              builder: (context, AsyncSnapshot<List<Model>> snapshot) {
                if (snapshot.hasData == false) {
                  return const CircularProgressIndicator();
                }

                return ListView(
                  children: snapshot.data!
                      .map((model) => ListTile(
                            title: TextButton(
                              child: Text(model.name),
                              onPressed: () {},
                            ),
                          ))
                      .toList(),
                );
              }),
*/