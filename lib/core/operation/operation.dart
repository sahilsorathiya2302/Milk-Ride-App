class Operation {
  static double parsePrice(String? price) {
    return double.tryParse(price ?? "0") ?? 0;
  }

  static double calculateDiscount(double salePrice, double mrpPrice) {
    return (mrpPrice > 0) ? ((mrpPrice - salePrice) / mrpPrice) * 100 : 0;
  }
}
