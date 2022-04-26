import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:jeff_li_dam/models/model.dart';
import 'package:jeff_li_dam/providers/crud_notifier.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

final crudProvider =
    ChangeNotifierProvider<CrudNotifier>((ref) => CrudNotifier());

// final modelListProvider = FutureProvider<List<Model>>((ref) async {
//   Future<List<Model>> getModels(int brandId) async {
//     final response = await Supabase.instance.client
//         .from('models')
//         .select()
//         .eq('brand_id', brandId)
//         .order('name', ascending: true)
//         .execute();
//     print("response.error = ${response.error}");
//     print(response.data);
//     final dataList = response.data as List;
//     return dataList.map((map) => Model.fromJson(map)).toList();
//   }
// });
