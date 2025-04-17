class VariantData {
  int? id;
  String? name;
  dynamic salePrice;
  dynamic mrpPrice;
  String? salePriceDecimal;

  String? mrpPriceDecimal;
  String? indexType;
  int? productId;
  String? packageSize;
  String? brand;
  String? volume;
  String? foodType;
  bool? isEggless;
  String? deliveryType;
  bool? allowInCart;
  bool? allowInSubscription;
  bool? inStock;
  bool? mustTry;
  int? percentageDifference;
  int? minQtyAllow;
  int? maxQtyAllow;
  bool? isSubscriptionPlan;

  VariantData(
      {this.id,
      this.name,
      this.salePrice,
      this.salePriceDecimal,
      this.mrpPrice,
      this.mrpPriceDecimal,
      this.indexType,
      this.productId,
      this.packageSize,
      this.brand,
      this.volume,
      this.foodType,
      this.isEggless,
      this.deliveryType,
      this.allowInCart,
      this.allowInSubscription,
      this.inStock,
      this.mustTry,
      this.percentageDifference,
      this.minQtyAllow,
      this.maxQtyAllow,
      this.isSubscriptionPlan});

  VariantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price'];
    salePriceDecimal = json['sale_price_decimal'];
    mrpPrice = json['mrp_price'];
    mrpPriceDecimal = json['mrp_price_decimal'];
    indexType = json['index_type'];
    productId = json['product_id'];
    packageSize = json['package_size'];
    brand = json['brand'];
    volume = json['volume'];
    foodType = json['food_type'];
    isEggless = json['is_eggless'];
    deliveryType = json['delivery_type'];
    allowInCart = json['allow_in_cart'];
    allowInSubscription = json['allow_in_subscription'];
    inStock = json['in_stock'];
    mustTry = json['must_try'];
    percentageDifference = json['percentage_difference'];
    minQtyAllow = json['min_qty_allow'];
    maxQtyAllow = json['max_qty_allow'];
    isSubscriptionPlan = json['is_subscription_plan'];
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
    data['brand'] = brand;
    data['volume'] = volume;
    data['food_type'] = foodType;
    data['is_eggless'] = isEggless;
    data['delivery_type'] = deliveryType;
    data['allow_in_cart'] = allowInCart;
    data['allow_in_subscription'] = allowInSubscription;
    data['in_stock'] = inStock;
    data['must_try'] = mustTry;
    data['percentage_difference'] = percentageDifference;
    data['min_qty_allow'] = minQtyAllow;
    data['max_qty_allow'] = maxQtyAllow;
    data['is_subscription_plan'] = isSubscriptionPlan;
    return data;
  }
}
