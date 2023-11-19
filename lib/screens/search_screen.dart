import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/components/grid_view.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/product_model.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final RxList<ProductModel> searchList = <ProductModel>[].obs;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () async {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final RxList<ProductModel> searchResults = searchList.value
        .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
        .toList()
        .obs;
    return Obx(
      () => GridView.builder(
        itemCount: searchResults.length,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns you want
          crossAxisSpacing: 12.0,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          return GridItem(
            productData: searchResults[index],
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.length < 2
        ? const Center(child: Text('Enter at least 3 characters'))
        : FutureBuilder(
            future: supabase
                .from('products')
                .select('id,name,price,images,sizes,colors,description')
                .textSearch('name', "'$query'")
                .withConverter(
                  (data) => List<ProductModel>.from(
                    data.map((item) => ProductModel.fromJson(item)),
                  ),
                ),
            builder: (context, snapshot) {
              if (snapshot.hasError && query.length > 2) {
                return Center(
                    child: Image.asset(
                  'assets/images/error.gif',
                  height: 150.h,
                  width: 150.w,
                ));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                searchList.value = snapshot.data as List<ProductModel>;
              }

              return snapshot.data!.isEmpty
                  ? Center(
                      child: Image.asset(
                      'assets/images/no.gif',
                      height: 250.h,
                      width: 250.w,
                    ))
                  : GridView.builder(
                      itemCount: snapshot.data!.length,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Set the number of columns you want
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 3 / 4,
                      ),
                      itemBuilder: (context, index) {
                        return GridItem(
                          productData: snapshot.data![index],
                        );
                      },
                    );
            });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
          titleLarge: globalTextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      )),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        hintStyle: globalTextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
