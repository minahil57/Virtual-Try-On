import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/models/onboard_model.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  final RxInt currentPage = 0.obs;
  final List<OnboardModel> pages = [
    OnboardModel(
      image: 'assets/images/slide_1.png',
      title: 'Seamless Try On\nExperience',
      description: 'Get your perfect look with our easy-to-use app',
    ),
    OnboardModel(
      image: 'assets/images/slide_1.png',
      title: 'Wishlist: Where Fashion Meets Comfort',
      description: 'Save your favorite items in your wishlist',
    ),
    OnboardModel(
      image: 'assets/images/slide_1.png',
      title: 'Swift and Reliable Delivery',
      description:
          'Get your order within hours with our reliable delivery service',
    ),
  ];

  void setCurrentIndex(int index) {
    currentPage.value = index;
  }

  void next() {
    if (currentPage.value < 2) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(
          milliseconds: 300,
        ),
        curve: Curves.easeInOut,
      );
    }
  }

  void previous() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(
          milliseconds: 300,
        ),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    currentPage.value = pages.length - 1;
    pageController.animateToPage(
      currentPage.value,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOut,
    );
  }

 @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
