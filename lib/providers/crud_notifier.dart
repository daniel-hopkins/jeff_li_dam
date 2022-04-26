import 'package:flutter/material.dart';

class CrudNotifier with ChangeNotifier {
  int _brandId = 0;
  int _modelId = 0;

  int get brandId => _brandId;
  int get modelId => _modelId;

  set brandId(int newValue) {
    _brandId = newValue;
    notifyListeners();
  }

  set modelId(int newValue) {
    _modelId = newValue;
    notifyListeners();
  }
}
