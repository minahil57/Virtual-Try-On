import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/services/Products_services.dart';

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
      () => ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index].name!),
            onTap: () {
              // Handle the selected search result.
              close(context, searchResults[index].name!);
            },
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
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                searchList.value = snapshot.data as List<ProductModel>;
              }

              return snapshot.data!.isEmpty
                  ? const Text('No results found')
                  : ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(snapshot.data![index].name!.capitalizeFirst),
                          onTap: () {
                            // Handle the selected search result.
                            close(context, snapshot.data![index].name!);
                          },
                        );
                      },
                    );
            });
  }
}
