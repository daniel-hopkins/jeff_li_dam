import 'package:jeff_li_dam/models/brand.dart';
import 'package:jeff_li_dam/models/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CrudService {
  Future<List<Brand>> getBrands() async {
    final response =
        await Supabase.instance.client.from('brands').select().execute();
    // print("response.error = ${response.error}");
    // print(response.data);
    final dataList = response.data as List;
    return dataList.map((map) => Brand.fromJson(map)).toList();
  }

  Future<List<Model>> getModels(int brandId) async {
    // print("entered getModels($brandId)");
    final response = await Supabase.instance.client
        .from('models')
        .select()
        .eq('brand_id', brandId)
        .order('name', ascending: true)
        .execute();
    // print("response.error = ${response.error}");
    // print(response.data);
    final dataList = response.data as List;
    return dataList.map((map) => Model.fromJson(map)).toList();
  }
}
