class CategoriesProductData {
  int? id;
  int? productId;
  String? name;
  int? salePrice;
  String? salePriceDecimal;
  int? mrpPrice;
  String? mrpPriceDecimal;
  String? indexType;
  String? packageSize;
  String? imageUrl;
  String? brand;
  String? volume;
  String? foodType;
  bool? isEggless;
  bool? mustTry;

  CategoriesProductData(
      {this.id,
      this.productId,
      this.name,
      this.salePrice,
      this.salePriceDecimal,
      this.mrpPrice,
      this.mrpPriceDecimal,
      this.indexType,
      this.packageSize,
      this.imageUrl,
      this.brand,
      this.volume,
      this.foodType,
      this.isEggless,
      this.mustTry});

  CategoriesProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    salePrice = json['sale_price'];
    salePriceDecimal = json['sale_price_decimal'];
    mrpPrice = json['mrp_price'];
    mrpPriceDecimal = json['mrp_price_decimal'];
    indexType = json['index_type'];
    packageSize = json['package_size'];
    imageUrl = json['image_url'];
    brand = json['brand'];
    volume = json['volume'];
    foodType = json['food_type'];
    isEggless = json['is_eggless'];
    mustTry = json['must_try'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['sale_price'] = this.salePrice;
    data['sale_price_decimal'] = this.salePriceDecimal;
    data['mrp_price'] = this.mrpPrice;
    data['mrp_price_decimal'] = this.mrpPriceDecimal;
    data['index_type'] = this.indexType;
    data['package_size'] = this.packageSize;
    data['image_url'] = this.imageUrl;
    data['brand'] = this.brand;
    data['volume'] = this.volume;
    data['food_type'] = this.foodType;
    data['is_eggless'] = this.isEggless;
    data['must_try'] = this.mustTry;
    return data;
  }
}
