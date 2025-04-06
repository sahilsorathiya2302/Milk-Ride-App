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
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['headerBanners'] != null) {
      headerBanners = <Banners>[];
      json['headerBanners'].forEach((v) {
        headerBanners!.add(new Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['bestSeller'] != null) {
      bestSeller = <ProductData>[];
      json['bestSeller'].forEach((v) {
        bestSeller!.add(new ProductData.fromJson(v));
      });
    }
    if (json['middleBanners'] != null) {
      middleBanners = <Banners>[];
      json['middleBanners'].forEach((v) {
        middleBanners!.add(new Banners.fromJson(v));
      });
    }
    if (json['newArrival'] != null) {
      newArrival = <ProductData>[];
      json['newArrival'].forEach((v) {
        newArrival!.add(new ProductData.fromJson(v));
      });
    }
    if (json['footerBanners'] != null) {
      footerBanners = <Banners>[];
      json['footerBanners'].forEach((v) {
        footerBanners!.add(new Banners.fromJson(v));
      });
    }
    if (json['seasonal'] != null) {
      seasonal = <ProductData>[];
      json['seasonal'].forEach((v) {
        seasonal!.add(new ProductData.fromJson(v));
      });
    }
    isVacation = json['isVacation'];
    cartQty = json['cart_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }

    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.bestSeller != null) {
      data['bestSeller'] = this.bestSeller!.map((v) => v.toJson()).toList();
    }

    if (this.newArrival != null) {
      data['newArrival'] = this.newArrival!.map((v) => v.toJson()).toList();
    }

    if (this.seasonal != null) {
      data['seasonal'] = this.seasonal!.map((v) => v.toJson()).toList();
    }
    data['isVacation'] = this.isVacation;
    data['cart_qty'] = this.cartQty;

    return data;
  }
}
