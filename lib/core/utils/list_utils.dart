import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';

class ListUtils {
  static List<ProductData> getUniqueProductsByProductId(
      List<ProductData> products) {
    final List<ProductData> uniqueProds = [];
    for (var prod in products) {
      if (!uniqueProds.any((p) => p.productId == prod.productId)) {
        uniqueProds.add(prod);
      }
    }
    return uniqueProds;
  }
}
