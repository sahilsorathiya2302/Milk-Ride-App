// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
// import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_all_product_packages.dart';
// import 'package:milk_ride_live_wc/features/view_all_product/domain/use_case/view_product_use_case.dart';
// import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_state.dart';
//
// class ViewAllProductCubit extends Cubit<ViewAllProductState> {
//   final ViewProductUseCase viewProductUseCase;
//
//   ViewAllProductCubit({required this.viewProductUseCase})
//       : super(ViewAllProductInitial());
//
//   List<ViewAllProductPackages> _allPackages = [];
//   final TextEditingController searchKeywordController = TextEditingController();
//
//   void searchProduct({
//     required String categoryId,
//     required int customerId,
//     required int page,
//     required int length,
//     required String searchKeyword,
//   }) async {
//     Get.context?.loaderOverlay.show();
//     final result = await viewProductUseCase.call(ViewAllProductParam(
//       categoryId: categoryId,
//       customerId: customerId,
//       page: page,
//       length: length,
//       searchKeyword: searchKeyword,
//     ));
//
//     result.fold(
//       (failure) {
//         Get.context?.loaderOverlay.hide();
//         FunctionalComponent.errorMessageSnackbar(message: failure.message);
//       },
//       (result) {
//         emit(ViewAllProductLoaded(viewProductResponse: result));
//         Get.context?.loaderOverlay.hide();
//       },
//     );
//     Get.context?.loaderOverlay.hide();
//   }
//
//   Future<void> viewAllProduct({
//     required String categoryId,
//     required String searchKeyword,
//     required int customerId,
//     required int page,
//     required int length,
//     bool isPaginating = false,
//   }) async {
//     if (!isPaginating) emit(ViewAllProductLoading());
//
//     final result = await viewProductUseCase.call(ViewAllProductParam(
//       categoryId: categoryId,
//       customerId: customerId,
//       page: page,
//       length: length,
//       searchKeyword: searchKeyword,
//     ));
//
//     result.match(
//       (failure) {
//         emit(ViewAllProductError(errorMessage: failure.message));
//       },
//       (response) {
//         final newPackages = response.data?.first.packages ?? [];
//
//         if (page == 1) {
//           _allPackages = newPackages;
//         } else {
//           _allPackages.addAll(newPackages as Iterable<ViewAllProductPackages>);
//         }
//
//         response.data?.first.packages =
//             _allPackages.cast<ViewAllProductPackages>();
//         emit(ViewAllProductLoaded(viewProductResponse: response));
//       },
//     );
//   }
// }
//

//==============> Final Code :--
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_all_product_packages.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/use_case/view_product_use_case.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_state.dart';

class ViewAllProductCubit extends Cubit<ViewAllProductState> {
  final ViewProductUseCase viewProductUseCase;

  ViewAllProductCubit({required this.viewProductUseCase})
      : super(ViewAllProductInitial());

  final TextEditingController searchKeywordController = TextEditingController();

  List<ViewAllProductPackages> _allPackages = [];

  Future<void> searchProduct({
    required String categoryId,
    required int customerId,
    required int page,
    required int length,
    required String searchKeyword,
  }) async {
    // Get.context?.loaderOverlay.show();
    final result = await viewProductUseCase.call(ViewAllProductParam(
      categoryId: categoryId,
      customerId: customerId,
      page: page,
      length: length,
      searchKeyword: searchKeyword,
    ));

    result.fold(
      (failure) {
        Get.context?.loaderOverlay.hide();
        FunctionalComponent.errorMessageSnackbar(message: failure.message);
      },
      (result) {
        emit(ViewAllProductLoaded(viewProductResponse: result));
        Get.context?.loaderOverlay.hide();
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  int _currentPage = 1;
  int _totalCount = 0;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;

  void resetPagination() {
    _currentPage = 1;
    _allPackages.clear();
    _hasMoreData = true;
  }

  Future<void> viewAllProduct({
    required String categoryId,
    required String searchKeyword,
    required int customerId,
    int length = 10,
    bool isPaginating = false,
  }) async {
    // emit(ViewAllProductLoading());
    if (isPaginating) {
      _isLoadingMore = true;
    } else {
      // emit(ViewAllProductLoading());
      resetPagination();
    }

    final result = await viewProductUseCase.call(ViewAllProductParam(
      categoryId: categoryId,
      customerId: customerId,
      page: _currentPage,
      length: length,
      searchKeyword: searchKeyword,
    ));

    result.fold(
      (failure) {
        _isLoadingMore = false;
        emit(ViewAllProductError(errorMessage: failure.message));
      },
      (response) {
        final data = response.data?.first;
        final newPackages = data?.packages ?? [];

        _totalCount = data?.totalProductCount ?? 0;

        if (_currentPage == 1) {
          _allPackages = newPackages;
        } else {
          final existingIds = _allPackages.map((e) => e.id).toSet();
          final filteredNewPackages = newPackages
              .where((pkg) => !existingIds.contains(pkg.id))
              .toList();
          _allPackages.addAll(filteredNewPackages);
        }

        _hasMoreData = _allPackages.length < _totalCount;
        _isLoadingMore = false;

        data?.packages = _allPackages;
        emit(ViewAllProductLoaded(viewProductResponse: response));

        if (_hasMoreData) _currentPage++;
      },
    );
  }

  Future<void> fetchNextPage({
    required String categoryId,
    required int customerId,
  }) async {
    if (!_isLoadingMore && _hasMoreData) {
      Get.context?.loaderOverlay.show();
      viewAllProduct(
        categoryId: categoryId,
        customerId: customerId,
        searchKeyword: searchKeywordController.text,
        isPaginating: true,
      ).then((_) {
        Get.context?.loaderOverlay.hide();
      });
    }
  }

  bool get hasMoreData => _hasMoreData;
  bool get isLoadingMore => _isLoadingMore;
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
// import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_all_product_packages.dart';
// import 'package:milk_ride_live_wc/features/view_all_product/domain/use_case/view_product_use_case.dart';
// import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_state.dart';
//
// class ViewAllProductCubit extends Cubit<ViewAllProductState> {
//   final ViewProductUseCase viewProductUseCase;
//
//   ViewAllProductCubit({required this.viewProductUseCase})
//       : super(ViewAllProductInitial());
//
//   final TextEditingController searchKeywordController = TextEditingController();
//
//   List<ViewAllProductPackages> _allPackages = [];
//
//   void searchProduct({
//     required String categoryId,
//     required int customerId,
//     required String searchKeyword,
//     int pageSize = 10,
//   }) async {
//     _allPackages.clear();
//     _currentPage = 1;
//     _hasMoreData = true;
//
//     Get.context?.loaderOverlay.show();
//
//     while (_hasMoreData) {
//       final result = await viewProductUseCase.call(ViewAllProductParam(
//         categoryId: categoryId,
//         customerId: customerId,
//         page: _currentPage,
//         length: pageSize,
//         searchKeyword: searchKeyword,
//       ));
//
//       final isLastPage = result.fold(
//         (failure) {
//           Get.context?.loaderOverlay.hide();
//           FunctionalComponent.errorMessageSnackbar(message: failure.message);
//           return true;
//         },
//         (response) {
//           final newPackages = response.data?.first.packages ?? [];
//           final total = response.data?.first.totalProductCount ?? 0;
//
//           if (newPackages.isEmpty) return true;
//
//           _allPackages.addAll(newPackages);
//
//           response.data?.first.packages = _allPackages;
//           emit(ViewAllProductLoaded(viewProductResponse: response));
//
//           return _allPackages.length >= total;
//         },
//       );
//
//       _hasMoreData = !isLastPage;
//     }
//
//     Get.context?.loaderOverlay.hide();
//   }
//
//   int _currentPage = 1;
//   int _totalCount = 0;
//   bool _isLoadingMore = false;
//   bool _hasMoreData = true;
//
//   void resetPagination() {
//     _currentPage = 1;
//     _allPackages.clear();
//     _hasMoreData = true;
//   }
//
//   Future<void> viewAllProduct({
//     required String categoryId,
//     required String searchKeyword,
//     required int customerId,
//     int length = 10,
//     bool isPaginating = false,
//   }) async {
//     if (isPaginating) {
//       _isLoadingMore = true;
//     } else {
//       emit(ViewAllProductLoading());
//       resetPagination();
//     }
//
//     final result = await viewProductUseCase.call(ViewAllProductParam(
//       categoryId: categoryId,
//       customerId: customerId,
//       page: _currentPage,
//       length: length,
//       searchKeyword: searchKeyword,
//     ));
//
//     result.fold(
//       (failure) {
//         _isLoadingMore = false;
//         emit(ViewAllProductError(errorMessage: failure.message));
//       },
//       (response) {
//         final data = response.data?.first;
//         final newPackages = data?.packages ?? [];
//
//         _totalCount = data?.totalProductCount ?? 0;
//
//         if (_currentPage == 1) {
//           _allPackages = newPackages;
//         } else {
//           _allPackages.addAll(newPackages);
//         }
//
//         _hasMoreData = _allPackages.length < _totalCount;
//         _isLoadingMore = false;
//
//         data?.packages = _allPackages;
//         emit(ViewAllProductLoaded(viewProductResponse: response));
//
//         if (_hasMoreData) _currentPage++;
//       },
//     );
//   }
//
//   void fetchNextPage({
//     required String categoryId,
//     required int customerId,
//   }) {
//     if (!_isLoadingMore && _hasMoreData) {
//       Get.context?.loaderOverlay.show();
//       viewAllProduct(
//         categoryId: categoryId,
//         customerId: customerId,
//         searchKeyword: searchKeywordController.text,
//         isPaginating: true,
//       ).then((_) {
//         Get.context?.loaderOverlay.hide();
//       });
//     }
//   }
//
//   bool get hasMoreData => _hasMoreData;
//   bool get isLoadingMore => _isLoadingMore;
// }
