enum HomeFilter { House, Apartment }


class Listing {
  final String name;
  final HomeFilter filter;

  Listing(this.name, this.filter);
}