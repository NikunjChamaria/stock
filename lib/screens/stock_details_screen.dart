import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stocks/contants/color.dart';
import 'package:stocks/model/stock_model.dart';
import 'package:stocks/utils/app_text/app_text.dart';
import 'package:stocks/utils/app_text/app_text_type.dart';

class StockDetailPage extends StatelessWidget {
  final StockModel stock;
  const StockDetailPage({super.key, required this.stock});

  Widget _buildInfoRow(IconData icon, String label, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: ColorConstant.blue, size: 20.sp),
          SizedBox(width: 8.w),
          AppText(text: "$label:", appTextType: AppTextType.cardSubheading),
          SizedBox(width: 8.w),
          Expanded(
            child: AppText(
              text: value ?? "N/A",
              appTextType: AppTextType.cardText,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: Padding(
              padding: EdgeInsets.only(left: 8.0.h),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  backgroundColor: ColorConstant.bgColor,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: ColorConstant.white,
                      size: 16.r,
                    ),
                  ),
                ),
              ),
            ),
            expandedHeight: 250.h,
            backgroundColor: ColorConstant.bgColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: (stock.id ?? 0).toString(),
                    child: stock.image?.url != null
                        ? CachedNetworkImage(
                            imageUrl: stock.image!.url!,
                            fit: BoxFit.cover,
                          )
                        : Container(color: ColorConstant.blue),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: AppText(
                  text: stock.name ?? "Stock Details",
                  appTextType: AppTextType.cardHeading,
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    color: ColorConstant.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.info_outline,
                                  color: ColorConstant.blue),
                              SizedBox(width: 8.w),
                              const AppText(
                                text: "Overview",
                                appTextType: AppTextType.cardHeading,
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          _buildInfoRow(Icons.tag, "Symbol", stock.symbol),
                          _buildInfoRow(
                              Icons.business, "Exchange", stock.exchange),
                          _buildInfoRow(Icons.date_range, "Listing Date",
                              stock.listingDate),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Card(
                    color: ColorConstant.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.attach_money,
                                  color: ColorConstant.blue),
                              SizedBox(width: 8.w),
                              const AppText(
                                text: "Financials",
                                appTextType: AppTextType.cardHeading,
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          _buildInfoRow(
                            Icons.monetization_on,
                            "Market Cap",
                            stock.marketCap != null
                                ? "\$${stock.marketCap}"
                                : null,
                          ),
                          _buildInfoRow(Icons.people, "Employees",
                              stock.employees?.toString()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Card(
                    color: ColorConstant.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.category,
                                  color: ColorConstant.blue),
                              SizedBox(width: 8.w),
                              const AppText(
                                text: "Industry",
                                appTextType: AppTextType.cardHeading,
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          _buildInfoRow(
                              Icons.work, "Asset Type", stock.assetType),
                          _buildInfoRow(Icons.business_center, "Industry",
                              stock.industry),
                          _buildInfoRow(
                              Icons.pie_chart, "Sector", stock.sector),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  if (stock.website != null)
                    Card(
                      color: ColorConstant.cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Row(
                          children: [
                            const Icon(Icons.web, color: ColorConstant.blue),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: AppText(
                                text: stock.website!,
                                appTextType: AppTextType.cardSubheadingBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 16.h),
                  Card(
                    color: ColorConstant.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.description,
                                  color: ColorConstant.blue),
                              SizedBox(width: 8.w),
                              const AppText(
                                text: "Description",
                                appTextType: AppTextType.cardHeading,
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            stock.description ?? "No description available.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[300],
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
