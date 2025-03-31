class BestSeller {
  int? id;
  String? name;
  String? salePrice;
  String? mrpPrice;
  String? indexType;
  int? productId;
  String? packageSize;
  String? imageUrl;
  String? brand;
  String? volume;
  String? foodType;
  bool? isEggless;
  bool? mustTry;

  BestSeller(
      {this.id,
      this.name,
      this.salePrice,
      this.mrpPrice,
      this.indexType,
      this.productId,
      this.packageSize,
      this.imageUrl,
      this.brand,
      this.volume,
      this.foodType,
      this.isEggless,
      this.mustTry});

  BestSeller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price'];
    mrpPrice = json['mrp_price'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sale_price'] = this.salePrice;
    data['mrp_price'] = this.mrpPrice;
    data['index_type'] = this.indexType;
    data['product_id'] = this.productId;
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
