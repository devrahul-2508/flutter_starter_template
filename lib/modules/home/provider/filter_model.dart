import 'package:flutter/material.dart';
import 'package:flutter_template/modules/home/model/home_listing.dart';

class FilterModel extends ChangeNotifier {
  HomeFilter _selectedFilter = HomeFilter.House;

  HomeFilter get selectedFilter => _selectedFilter;

  void setSelectedFilter(HomeFilter filter) {
    _selectedFilter = filter;
    notifyListeners();
  }
}