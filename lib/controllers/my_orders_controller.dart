import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/models/my_order_model.dart';
import 'package:virtual_try_on/services/order_services.dart';

class MyOrdersController extends GetxController
    with GetTickerProviderStateMixin {
  RxList<OrderModel> orders = <OrderModel>[].obs;
  RxString selectedStatus = 'pending'.obs;
  late TabController tabController;

  @override
  onInit() async {
    tabController = TabController(length: 3, vsync: this)
      ..addListener(() async {
        if (!tabController.indexIsChanging) {
          selectedStatus.value = tabController.index == 0
              ? 'pending'
              : tabController.index == 1
                  ? 'completed'
                  : tabController.index == 2
                      ? 'cancelled'
                      : '';
          log('selectedStatus ${selectedStatus.value}');
          orders.value = await OrderServices.fetchOrders(
            id: supabase.auth.currentUser!.id,
            status: selectedStatus.value,
          );
          orders.refresh();
        }
      });
    orders.value = await OrderServices.fetchOrders(
      id: supabase.auth.currentUser!.id,
      status: selectedStatus.value,
    );
    orders.refresh();

    super.onInit();
  }
}
