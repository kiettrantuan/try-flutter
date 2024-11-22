import 'package:equatable/equatable.dart';
import 'package:f_shop_1/models/banner.dart';
import 'package:f_shop_1/services/api/banner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  // BannerBloc() : super(BannerInitial()) {
  //   on<BannerEvent>((event, emit) {
  //   });
  // }
  final BannerApi apiService;

  BannerBloc({required this.apiService}) : super(BannerInitial()) {
    on<FetchBanners>(_onFetchBanners);
  }

  Future<void> _onFetchBanners(
      FetchBanners event, Emitter<BannerState> emit) async {
    emit(BannerLoading());

    try {
      final banners = await apiService.fetchBanners();
      emit(BannerLoaded(banners: banners));
    } catch (e) {
      emit(BannerError(error: e.toString()));
    }
  }
}
