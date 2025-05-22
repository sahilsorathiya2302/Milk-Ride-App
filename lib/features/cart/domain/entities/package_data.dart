class PackageData {
  int? id;
  int? productId;
  int? cartId;
  String? name;
  int? minQtyAllow;
  int? maxQtyAllow;
  String? packageSize;
  String? imageUrl;
  String? brand;
  String? volume;
  int? qty;
  String? deliveryType;
  String? price;

  String? priceDecimal;
  String? totalPrice;
  String? totalPriceDecimal;
  String? deliveryDate;
  dynamic salePrice;
  dynamic mrpPrice;
  int? percentageDifference;

  PackageData({
    this.id,
    this.productId,
    this.cartId,
    this.name,
    this.minQtyAllow,
    this.maxQtyAllow,
    this.packageSize,
    this.imageUrl,
    this.brand,
    this.volume,
    this.qty,
    this.deliveryType,
    this.price,
    this.priceDecimal,
    this.totalPrice,
    this.totalPriceDecimal,
    this.deliveryDate,
    this.percentageDifference,
  });

  PackageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    cartId = json['cart_id'];
    name = json['name'];
    minQtyAllow = json['min_qty_allow'];
    maxQtyAllow = json['max_qty_allow'];
    packageSize = json['package_size'];
    imageUrl = json['image_url'];
    brand = json['brand'];
    volume = json['volume'];
    qty = json['qty'];
    deliveryType = json['delivery_type'];
    price = json['price'];
    priceDecimal = json['price_decimal'];
    totalPrice = json['total_price'];
    totalPriceDecimal = json['total_price_decimal'];
    deliveryDate = json['delivery_date'];
    mrpPrice = json['mrp_price'];
    salePrice = json['sale_price'];
    percentageDifference = json['percentage_difference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['cart_id'] = cartId;
    data['name'] = name;
    data['min_qty_allow'] = minQtyAllow;
    data['max_qty_allow'] = maxQtyAllow;
    data['package_size'] = packageSize;
    data['image_url'] = imageUrl;
    data['brand'] = brand;
    data['volume'] = volume;
    data['qty'] = qty;
    data['delivery_type'] = deliveryType;
    data['price'] = price;
    data['price_decimal'] = priceDecimal;
    data['total_price'] = totalPrice;
    data['total_price_decimal'] = totalPriceDecimal;
    data['delivery_date'] = deliveryDate;
    data['mrp_price'] = mrpPrice;
    data['sale_price'] = salePrice;
    data['percentage_difference'] = percentageDifference;
    return data;
  }
}
