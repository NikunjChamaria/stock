import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:stocks/contants/color.dart';
import 'package:stocks/model/stock_model.dart';
import 'package:stocks/providers/providers.dart';
import 'package:stocks/screens/stock_details_screen.dart';
import 'package:stocks/utils/app_text/app_text.dart';
import 'package:stocks/utils/app_text/app_text_type.dart';
import 'package:shimmer/shimmer.dart';

class StockSearchPage extends ConsumerStatefulWidget {
  const StockSearchPage({super.key});

  @override
  ConsumerState<StockSearchPage> createState() => _StockSearchPageState();
}

class _StockSearchPageState extends ConsumerState<StockSearchPage> {
  final TextEditingController _searchController = TextEditingController();

  String query = "";
  Timer? _debounce;
  Set<int> _animatedIndexes = {};

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        query = value;
        _animatedIndexes = {};
      });
    });
  }

  Widget _buildStockItem(StockModel stock, int index) {
    bool shouldAnimate = !_animatedIndexes.contains(index);
    if (shouldAnimate) {
      _animatedIndexes.add(index);
    }

    return shouldAnimate
        ? FadeInUp(
            delay: Duration(milliseconds: 20 * index),
            child: _stockItemContent(stock),
          )
        : _stockItemContent(stock);
  }

  Widget _buildShimmerCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorConstant.cardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[800]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                width: 60.w,
                height: 60.h,
                color: Colors.grey[800],
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[800]!,
                  highlightColor: Colors.grey[600]!,
                  child: Container(
                    width: double.infinity,
                    height: 16.h,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[800]!,
                  highlightColor: Colors.grey[600]!,
                  child: Container(
                    width: 100.w,
                    height: 14.h,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[800]!,
                  highlightColor: Colors.grey[600]!,
                  child: Container(
                    width: 150.w,
                    height: 14.h,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stockItemContent(StockModel stock) {
    return GestureDetector(
      onTap: () {
        Get.to(() => StockDetailPage(stock: stock));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: stock.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: stock.image != null && stock.image!.url != null
                    ? CachedNetworkImage(
                        imageUrl: stock.image!.url!,
                        width: 60.w,
                        height: 60.h,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.show_chart,
                        size: 60.w,
                        color: ColorConstant.blue,
                      ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: stock.name ?? "Unknown Stock",
                    appTextType: AppTextType.cardHeading,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      AppText(
                        text: stock.symbol ?? '',
                        appTextType: AppTextType.cardSubheading,
                      ),
                      SizedBox(width: 8.w),
                      if (stock.exchange != null &&
                          stock.exchange.toString().isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: ColorConstant.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: AppText(
                            text: stock.exchange!,
                            appTextType: AppTextType.cardSubheadingBlue,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    text: stock.marketCap != null
                        ? 'Market Cap: \$${stock.marketCap}'
                        : 'Market Cap: N/A',
                    appTextType: AppTextType.cardText,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: ColorConstant.white,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stockList = ref.watch(searchStocksProvider(query));

    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.bgColor,
        elevation: 0,
        centerTitle: true,
        title: const AppText(
          text: "Stocks",
          appTextType: AppTextType.bigText,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              style: selectTextStyle(AppTextType.smallText),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                prefixIcon: const Icon(Icons.search, color: ColorConstant.blue),
                hintText: "Search stocks",
                hintStyle: selectTextStyle(AppTextType.smallTextLight),
                contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: stockList.when(
              data: (stocks) => stocks.isEmpty
                  ? const Center(
                      child: AppText(
                        text: "No stocks found",
                        appTextType: AppTextType.cardHeading,
                      ),
                    )
                  : ListView.builder(
                      itemCount: stocks.length,
                      itemBuilder: (context, index) {
                        final stock = stocks[index];
                        return _buildStockItem(stock, index);
                      },
                    ),
              loading: () => ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) => _buildShimmerCard(),
              ),
              error: (err, _) => const Center(
                child: AppText(
                  text: "Error in finding stocks",
                  appTextType: AppTextType.cardHeading,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
