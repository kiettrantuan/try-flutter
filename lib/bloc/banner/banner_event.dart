part of 'banner_bloc.dart';

@immutable
sealed class BannerEvent {}

class FetchBanners extends BannerEvent {}
