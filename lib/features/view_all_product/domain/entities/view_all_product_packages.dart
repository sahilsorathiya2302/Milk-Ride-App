class ViewAllProductPackages {
  int? id;
  int? productId;
  String? name;
  String? salePrice;
  String? mrpPrice;
  String? indexType;
  String? packageSize;
  String? imageUrl;
  String? brand;
  String? volume;
  String? foodType;
  bool? isEggless;
  bool? mustTry;
  int? minQtyAllow;
  int? maxQtyAllow;
  bool? allowInCart;
  bool? allowInSubscription;
  bool? productVariants;
  String? deliveryType;
  bool? isSubscriptionPlan;
  String? planTitle;

  ViewAllProductPackages(
      {this.id,
      this.productId,
      this.name,
      this.salePrice,
      this.mrpPrice,
      this.indexType,
      this.packageSize,
      this.imageUrl,
      this.brand,
      this.volume,
      this.foodType,
      this.isEggless,
      this.mustTry,
      this.minQtyAllow,
      this.maxQtyAllow,
      this.allowInCart,
      this.allowInSubscription,
      this.productVariants,
      this.deliveryType,
      this.isSubscriptionPlan,
      this.planTitle});

  ViewAllProductPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    salePrice = json['sale_price'];
    mrpPrice = json['mrp_price'];
    indexType = json['index_type'];
    packageSize = json['package_size'];
    imageUrl = json['image_url'];
    brand = json['brand'];
    volume = json['volume'];
    foodType = json['food_type'];
    isEggless = json['is_eggless'];
    mustTry = json['must_try'];
    minQtyAllow = json['min_qty_allow'];
    maxQtyAllow = json['max_qty_allow'];
    allowInCart = json['allow_in_cart'];
    allowInSubscription = json['allow_in_subscription'];
    productVariants = json['product_variants'];
    deliveryType = json['delivery_type'];
    isSubscriptionPlan = json['is_subscription_plan'];
    planTitle = json['plan_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['name'] = name;
    data['sale_price'] = salePrice;
    data['mrp_price'] = mrpPrice;
    data['index_type'] = indexType;
    data['package_size'] = packageSize;
    data['image_url'] = imageUrl;
    data['brand'] = brand;
    data['volume'] = volume;
    data['food_type'] = foodType;
    data['is_eggless'] = isEggless;
    data['must_try'] = mustTry;
    data['min_qty_allow'] = minQtyAllow;
    data['max_qty_allow'] = maxQtyAllow;
    data['allow_in_cart'] = allowInCart;
    data['allow_in_subscription'] = allowInSubscription;
    data['product_variants'] = productVariants;
    data['delivery_type'] = deliveryType;
    data['is_subscription_plan'] = isSubscriptionPlan;
    data['plan_title'] = planTitle;
    return data;
  }
}
