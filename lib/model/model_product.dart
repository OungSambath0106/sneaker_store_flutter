// common/models/best_selling_product.dart
abstract class BestSellingProduct {
  String get imagePath;
  String get brand;
  String get name;
  String get size;
  double get discountprice;
  double get originalprice;
  bool get isFavorite;
  set isFavorite(bool value);
}

class BestSellingProducts implements BestSellingProduct {
  @override
  final String imagePath;
  @override
  final String brand;
  @override
  final String name;
  @override
  final String size;
  @override
  final double discountprice;
  @override
  final double originalprice;
  bool _isFavorite;

  BestSellingProducts({
    required this.imagePath,
    required this.brand,
    required this.name,
    required this.size,
    required this.discountprice,
    required this.originalprice,
    bool isFavorite = false,
  }) : _isFavorite = isFavorite;

  @override
  bool get isFavorite => _isFavorite;

  @override
  set isFavorite(bool value) {
    _isFavorite = value;
  }
}
