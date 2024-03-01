import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/modules/home/cubits/home_state.dart';
import 'package:flutter_template/modules/home/model/home_listing.dart';
import 'package:flutter_template/modules/home/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(InitialHomeState());

  HomeRepository homeRepository;

  // Sample listings
  List<Listing> listings = [
    Listing('House 1', HomeFilter.House),
    Listing('Apartment 1', HomeFilter.Apartment),
    Listing('House 2', HomeFilter.House),
    Listing('Apartment 2', HomeFilter.Apartment),
  ];

  getListings(HomeFilter filter) {
    var listings = homeRepository.getListings(filter);

    emit(LoadedHomeState(listings: listings));
  }
}
