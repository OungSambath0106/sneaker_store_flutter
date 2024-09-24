// common/models/best_selling_product.dart
abstract class BestSellingProduct {
  String get imagePath;
  String get brand;
  String get name;
  String get discountprice; // Change to String for formatted output
  double get originalprice;
  double get discountPercentage;
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
  final double originalprice;
  @override
  final double discountPercentage;
  bool _isFavorite;

  BestSellingProducts({
    required this.imagePath,
    required this.brand,
    required this.name,
    required this.originalprice,
    required this.discountPercentage,
    bool isFavorite = false,
  }) : _isFavorite = isFavorite;

  @override
  bool get isFavorite => _isFavorite;

  @override
  set isFavorite(bool value) {
    _isFavorite = value;
  }

  // Calculate discount price and format it
  @override
  String get discountprice => (originalprice * (1 - discountPercentage / 100))
      .toStringAsFixed(2); // Format to 2 decimal places
}
