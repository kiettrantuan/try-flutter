import 'package:f_shop_1/models/banner.dart';
import 'package:f_shop_1/services/api_service.dart';
import 'package:flutter/material.dart';

class BannerViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<BannerItem> _banners = [];
  bool _isLoading = false;

  List<BannerItem> get banners => _banners;
  bool get isLoading => _isLoading;

  Future<void> fetchBanners() async {
    _isLoading = true;
    notifyListeners();

    try {
      _banners = await _apiService.fetchBanners();
    } catch (e) {
      print('Error fetching banners: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
