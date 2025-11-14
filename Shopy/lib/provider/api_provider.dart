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

  final List<Model> _watchlist = [];

  List<Model> get watchlist => _watchlist;

  void addToWatchlist(Model product) {
    if (!_watchlist.any((item) => item.id == product.id)) {
      _watchlist.add(product);
      notifyListeners();
    }
  }

  void removeFromWatchlist(Model product) {
    _watchlist.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  bool isInWatchlist(Model product) {
    return _watchlist.any((item) => item.id == product.id);
  }
  //


  final List<Model> _cartlist = [];

  List<Model> get cartist => _cartlist;

  void addToCartlist(Model product) {
    if (!_cartlist.any((item) => item.id == product.id)) {
      _cartlist.add(product);
      notifyListeners();
    }
  }

  void removeFromCartlist(Model product) {
    _cartlist.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  bool isInCartlist(Model product) {
    return _cartlist.any((item) => item.id == product.id);
  }

}
