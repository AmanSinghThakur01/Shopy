import 'package:flutter/foundation.dart';
import 'package:shopy/model/model.dart';
import 'package:shopy/services/api_services.dart';

class ApiProvider with ChangeNotifier {
  List<Model> products = [];
  bool loading = true;

  Future<void> getData() async {
    loading = true;
    notifyListeners();

    products = await ApiServices().getData();
    loading = false;
    notifyListeners();
  }
}
