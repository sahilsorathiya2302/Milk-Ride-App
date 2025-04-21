class FilteredPackages {
  int? id;
  String? name;
  String? salePrice;
  String? salePriceDecimal;
  String? mrpPrice;
  String? mrpPriceDecimal;
  String? indexType;
  int? productId;
  String? packageSize;
  String? imageUrl;
  String? brand;
  String? volume;
  String? foodType;
  bool? isEggless;
  String? deliveryType;
  bool? allowInCart;
  bool? allowInSubscription;
  bool? mustTry;
  int? minQtyAllow;
  int? maxQtyAllow;
  dynamic otherInfo;
  dynamic storageUsage;
  dynamic benefits;
  dynamic description;
  int? percentageDifference;
  bool? inStock;
  bool? isTrial;
  dynamic trialPackage;
  bool? isSubscriptionPlan;
  String? planTitle;

  FilteredPackages(
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
      this.deliveryType,
      this.allowInCart,
      this.allowInSubscription,
      this.mustTry,
      this.minQtyAllow,
      this.maxQtyAllow,
      this.otherInfo,
      this.storageUsage,
      this.benefits,
      this.description,
      this.percentageDifference,
      this.inStock,
      this.isTrial,
      this.trialPackage,
      this.isSubscriptionPlan});

  FilteredPackages.fromJson(Map<String, dynamic> json) {
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
    deliveryType = json['delivery_type'];
    allowInCart = json['allow_in_cart'];
    allowInSubscription = json['allow_in_subscription'];
    mustTry = json['must_try'];
    minQtyAllow = json['min_qty_allow'];
    maxQtyAllow = json['max_qty_allow'];
    otherInfo = json['other_info'];
    storageUsage = json['storage_usage'];
    benefits = json['benefits'];
    description = json['description'];
    percentageDifference = json['percentage_difference'];
    inStock = json['in_stock'];
    isTrial = json['is_trial'];
    trialPackage = json['trial_package'];
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
    data['image_url'] = imageUrl;
    data['brand'] = brand;
    data['volume'] = volume;
    data['food_type'] = foodType;
    data['is_eggless'] = isEggless;
    data['delivery_type'] = deliveryType;
    data['allow_in_cart'] = allowInCart;
    data['allow_in_subscription'] = allowInSubscription;
    data['must_try'] = mustTry;
    data['min_qty_allow'] = minQtyAllow;
    data['max_qty_allow'] = maxQtyAllow;
    data['other_info'] = otherInfo;
    data['storage_usage'] = storageUsage;
    data['benefits'] = benefits;
    data['description'] = description;
    data['percentage_difference'] = percentageDifference;
    data['in_stock'] = inStock;
    data['is_trial'] = isTrial;
    data['trial_package'] = trialPackage;
    data['is_subscription_plan'] = isSubscriptionPlan;
    return data;
  }
}
