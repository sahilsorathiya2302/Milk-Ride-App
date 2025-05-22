import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_product_data.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_state.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product_categories/view_all_product_categories_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories_products/product_information_widget.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories_products/search_text_filed_widget.dart';

import '../../../../../core/key/app_images_key.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/ui_component/custom_empty_screen.dart';

class CategoryProductInfoWidget extends StatefulWidget {
  final List<ViewProductData> packages;
  const CategoryProductInfoWidget({super.key, required this.packages});

  @override
  State<CategoryProductInfoWidget> createState() =>
      _CategoryProductInfoWidgetState();
}

class _CategoryProductInfoWidgetState extends State<CategoryProductInfoWidget> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 0) {
      _fetchMoreProducts();
    }
  }

  void _fetchMoreProducts() {
    final cubit = context.read<ViewAllProductCubit>();
    final categoryId =
        context.read<ViewAllProductCategoriesCubit>().state.categoryId;
    cubit.fetchNextPage(
      categoryId: categoryId.toString(),
      customerId: StorageManager.readData(StorageKeys.customerId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryId =
        context.read<ViewAllProductCategoriesCubit>().state.categoryId;

    return BlocBuilder<ViewAllProductCubit, ViewAllProductState>(
      builder: (context, state) {
        return Column(
          children: [
            categoryId == AppString.empty
                ? SearchTextFiledWidget()
                : const SizedBox(),
            widget.packages[0].packages!.isNotEmpty
                ? Expanded(
                    child: RefreshIndicator(
                      color: AppColors.primaryColor,
                      onRefresh: () async {
                        final getId =
                            context.read<ViewAllProductCategoriesCubit>().state;

                        context.read<ViewAllProductCubit>().viewAllProduct(
                              categoryId: getId.categoryId.toString(),
                              customerId: StorageManager.readData(
                                  StorageKeys.customerId),
                              length: 10,
                              searchKeyword: AppString.empty,
                              isPaginating: false,
                            );
                      },
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: widget.packages.first.packages!.length +
                            (isLoadingMore ? 1 : 0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          if (index == widget.packages.first.packages!.length &&
                              isLoadingMore) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final product =
                              widget.packages.first.packages![index];

                          return ProductInformationWidget(
                            index: index,
                            product: product,
                          );
                        },
                      ),
                    ),
                  )
                : Expanded(
                    child: CustomEmptyScreen(
                      text: AppString.searchProductNotFound,
                      subText: AppString.searchProductNotFoundMsg,
                      imagesPath: AppImagesKey.productGrid,
                      imgHeight: 50.h,
                      imgWidth: 50.w,
                    ),
                  ),
          ],
        ).paddingOnly(top: 2.h);
      },
    );
  }
}
