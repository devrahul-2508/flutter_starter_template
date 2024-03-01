import 'package:flutter_template/modules/home/model/home_listing.dart';

class HomeRepository {
  // Sample listings
  List<Listing> listings = [
    Listing('House 1', HomeFilter.House),
    Listing('Apartment 1', HomeFilter.Apartment),
    Listing('House 2', HomeFilter.House),
    Listing('Apartment 2', HomeFilter.Apartment),
  ];

  List<Listing> getListings(HomeFilter filter) {
    return listings.where((listing) => listing.filter == filter).toList();
  }
}
