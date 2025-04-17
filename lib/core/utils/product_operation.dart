class ProductOperationHelper {
  static int incrementQty(int currentQty, dynamic variant) {
    final max = variant?.maxQtyAllow ?? 50;
    return currentQty < max ? currentQty + 1 : currentQty;
  }

  static int decrementQty(int currentQty, dynamic variant) {
    final min = variant?.minQtyAllow ?? 1;
    return currentQty > min ? currentQty - 1 : currentQty;
  }

  static int resetQtyOnVariantSelect() {
    return 1;
  }

  static double calculateTotalPrice(int quantity, dynamic variant) {
    final price = double.tryParse(variant?.salePrice ?? '0') ?? 0;
    return quantity * price;
  }
}
