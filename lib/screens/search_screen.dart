import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/components/grid_view.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/screens/product_detail/product_detail_screen.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  // Dummy list
  final RxList<ProductModel> searchList = <ProductModel>[].obs;

  // These methods are mandatory you cannot skip them.

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
      () => Expanded(
        child: GridView.builder(
          itemCount: searchResults.length,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // Set the number of columns you want
            crossAxisSpacing: 25.0,
            mainAxisSpacing: 9.0,
            childAspectRatio: 8 / 9, // Number of columns in the grid
          ),
          itemBuilder: (context, index) {
            return GridItem(
              imageUrl: searchResults[index].images![0],
              text: searchResults[index].name!.capitalizeFirst,
              rating: 4.5,
              price: searchResults[index].price!,
            );
          },
        ),
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
                  : Expanded(
                      child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // Set the number of columns you want
                          crossAxisSpacing: 25.0,
                          mainAxisSpacing: 9.0,
                          childAspectRatio:
                              8 / 9, // Number of columns in the grid
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ProductDetailsScreen3State(
                                  product: snapshot.data![index]));
                            },
                            child: GridItem(
                              imageUrl: snapshot.data![index].images![0],
                              text: snapshot.data![index].name!,
                              rating: 4.5,
                              price: snapshot.data![index].price!,
                            ),
                          );
                        },
                      ),
                    );
            });
  }
}
