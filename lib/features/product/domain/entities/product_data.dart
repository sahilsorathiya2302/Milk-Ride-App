class ProductData {
  int? id;
  String? name;
  dynamic salePrice;
  String? salePriceDecimal;
  dynamic mrpPrice;
  String? mrpPriceDecimal;
  String? indexType;
  int? productId;
  String? packageSize;
  String? imageUrl;
  String? brand;
  String? volume;
  String? foodType;
  bool? isEggless;
  bool? mustTry;

  ProductData(
      {this.id,
      this.name,
      this.salePrice,
      this.salePriceDecimal,
      this.mrpPrice,
      this.mrpPriceDecimal,
      this.indexType,
      this.productId,
      this.packageSize,
      this.imageUrl,
      this.brand,
      this.volume,
      this.foodType,
      this.isEggless,
      this.mustTry});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price'];
    salePriceDecimal = json['sale_price_decimal'];
    mrpPrice = json['mrp_price'];
    mrpPriceDecimal = json['mrp_price_decimal'];
    indexType = json['index_type'];
    productId = json['product_id'];
    packageSize = json['package_size'];
    imageUrl = json['image_url'];
    brand = json['brand'];
    volume = json['volume'];
    foodType = json['food_type'];
    isEggless = json['is_eggless'];
    mustTry = json['must_try'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sale_price'] = salePrice;
    data['sale_price_decimal'] = salePriceDecimal;
    data['mrp_price'] = mrpPrice;
    data['mrp_price_decimal'] = mrpPriceDecimal;
    data['index_type'] = indexType;
    data['product_id'] = productId;
    data['package_size'] = packageSize;
    data['image_url'] = imageUrl;
    data['brand'] = brand;
    data['volume'] = volume;
    data['food_type'] = foodType;
    data['is_eggless'] = isEggless;
    data['must_try'] = mustTry;
    return data;
  }
}
