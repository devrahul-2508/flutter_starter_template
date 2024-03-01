import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/modules/home/cubits/home_cubit.dart';
import 'package:flutter_template/modules/home/cubits/home_state.dart';
import 'package:flutter_template/modules/home/model/home_listing.dart';
import 'package:flutter_template/modules/home/provider/filter_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filterModel = Provider.of<FilterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Cubit and Provider Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<FilterModel>(
              builder: (context, filterModel, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterChip(
                    label: Text('House'),
                    selected: filterModel.selectedFilter == HomeFilter.House,
                    onSelected: (selected) {
                      if (selected) {
                        filterModel.setSelectedFilter(HomeFilter.House);
                        context.read<HomeCubit>().getListings(HomeFilter.House);
                      }
                    },
                    selectedColor: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  FilterChip(
                    label: Text('Apartment'),
                    selected:
                        filterModel.selectedFilter == HomeFilter.Apartment,
                    onSelected: (selected) {
                      if (selected) {
                        filterModel.setSelectedFilter(HomeFilter.Apartment);
                        context
                            .read<HomeCubit>()
                            .getListings(HomeFilter.Apartment);
                      }
                    },
                    selectedColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is LoadedHomeState) {
                  final listings = state.listings;
                  return ListView.builder(
                    itemCount: listings.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listings[index].name),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("No listings found"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
