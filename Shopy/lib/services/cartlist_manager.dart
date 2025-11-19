
class CartlistManager {
  static List<Map<String, dynamic>> cartlist = [];

  static void addToCartlist(Map<String, dynamic> product) {
    bool exists = cartlist.any((item) => item["title"] == product["title"]);
    if (!exists) cartlist.add(product);
  }

  static void removeFromCartlist(String title) {
    cartlist.removeWhere((item) => item["title"] == title);
  }
}
