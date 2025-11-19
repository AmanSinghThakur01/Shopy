class WishlistManager {
  static List<Map<String, dynamic>> wishlist = [];

  static void addToWishlist(Map<String, dynamic> product) {
    bool exists = wishlist.any((item) => item["title"] == product["title"]);

    if (!exists) {
      wishlist.add(product);
    }
  }

  static void removeFromWishlist(String title) {
    wishlist.removeWhere((item) => item["title"] == title);
  }
}
