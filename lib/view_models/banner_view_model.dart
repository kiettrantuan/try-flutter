import 'package:f_shop_1/models/banner.dart';
import 'package:f_shop_1/services/api/banner.dart';
import 'package:flutter/foundation.dart';

class BannerViewModel extends ChangeNotifier {
  final BannerApi apiService;
  List<BannerItem> _banners = [];
  List<BannerItem> get banners => _banners;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _disposed = false;
  bool get disposed => _disposed;

  BannerViewModel({required this.apiService}) {
    if (kDebugMode) {
      print('constructor');
    }
    _fetchBanners();
  }

  @override
  void notifyListeners() {
    if (!disposed) super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> _fetchBanners() async {
    _isLoading = true;
    notifyListeners();

    try {
      _banners = await apiService.fetchBanners();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching banners: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
