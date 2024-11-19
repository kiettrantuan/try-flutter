part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object?> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final List<BannerItem> banners;

  const BannerLoaded({required this.banners});

  @override
  List<Object?> get props => [banners];
}

class BannerError extends BannerState {
  final String error;

  const BannerError({required this.error});

  @override
  List<Object?> get props => [error];
}
