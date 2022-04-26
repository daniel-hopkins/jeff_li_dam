import 'package:flutter/material.dart';
import 'package:jeff_li_dam/pages/job_list_page.dart';
// import 'package:jeff_li_dam/main.dart';
// import 'package:jeff_li_dam/models/brand.dart';
// import 'package:jeff_li_dam/models/model.dart';
// // import 'package:jeff_li_dam/widgets/crud/brand_dropdown.dart';
import 'package:jeff_li_dam/widgets/crud/insert_order.dart';
import 'package:jeff_li_dam/widgets/side_layout.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
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
        body: Row(
      children: [
        const SideLayout(),
        Expanded(
          flex: 4,
          child: JobListPage(),
        ),
      ],
    ));
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