import 'package:milk_ride_live_wc/features/home/domain/entities/banners.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';

import '../../../auth/domain/entities/customer.dart';
import '../../../product/domain/entities/cetegories.dart';
import 'config.dart';

class HomeData {
  Config? config;
  Customer? customer;
  List<Banners>? headerBanners;
  List<Categories>? categories;
  List<ProductData>? bestSeller;
  List<Banners>? middleBanners;
  List<ProductData>? newArrival;
  List<Banners>? footerBanners;
  List<ProductData>? seasonal;
  int? isVacation;
  int? cartQty;
  List<dynamic>? referralProgram;

  HomeData(
      {this.config,
      this.customer,
      this.headerBanners,
      this.categories,
      this.bestSeller,
      this.middleBanners,
      this.newArrival,
      this.footerBanners,
      this.seasonal,
      this.isVacation,
      this.cartQty,
      this.referralProgram});

  HomeData.fromJson(Map<String, dynamic> json) {
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['headerBanners'] != null) {
      headerBanners = <Banners>[];
      json['headerBanners'].forEach((v) {
        headerBanners!.add(Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['bestSeller'] != null) {
      bestSeller = <ProductData>[];
      json['bestSeller'].forEach((v) {
        bestSeller!.add(ProductData.fromJson(v));
      });
    }
    if (json['middleBanners'] != null) {
      middleBanners = <Banners>[];
      json['middleBanners'].forEach((v) {
        middleBanners!.add(Banners.fromJson(v));
      });
    }
    if (json['newArrival'] != null) {
      newArrival = <ProductData>[];
      json['newArrival'].forEach((v) {
        newArrival!.add(ProductData.fromJson(v));
      });
    }
    if (json['footerBanners'] != null) {
      footerBanners = <Banners>[];
      json['footerBanners'].forEach((v) {
        footerBanners!.add(Banners.fromJson(v));
      });
    }
    if (json['seasonal'] != null) {
      seasonal = <ProductData>[];
      json['seasonal'].forEach((v) {
        seasonal!.add(ProductData.fromJson(v));
      });
    }
    isVacation = json['isVacation'];
    cartQty = json['cart_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (config != null) {
      data['config'] = config!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }

    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (bestSeller != null) {
      data['bestSeller'] = bestSeller!.map((v) => v.toJson()).toList();
    }

    if (newArrival != null) {
      data['newArrival'] = newArrival!.map((v) => v.toJson()).toList();
    }

    if (seasonal != null) {
      data['seasonal'] = seasonal!.map((v) => v.toJson()).toList();
    }
    data['isVacation'] = isVacation;
    data['cart_qty'] = cartQty;

    return data;
  }
}
