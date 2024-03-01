// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_template/modules/home/model/home_listing.dart';

abstract class HomeState extends Equatable {}

class InitialHomeState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedHomeState extends HomeState {
  List<Listing> listings;
  LoadedHomeState({
    required this.listings,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [listings];
}
