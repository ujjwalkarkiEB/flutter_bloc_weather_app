import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.city,
    required this.updatedTime,
    this.onSearch,
    this.showCurrentLocation = false,
  });

  final String city;
  final String updatedTime;
  final void Function(String)? onSearch;
  final bool showCurrentLocation;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController searchController = TextEditingController();
  void _showSearchDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search City'),
          content: TextField(
            controller: searchController,
            decoration: const InputDecoration(
                hintText: 'Enter city name',
                hintStyle: TextStyle(fontSize: 14)),
            onSubmitted: (value) {
              if (widget.onSearch != null) {
                widget.onSearch!(value);
              }
              searchController.clear();

              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                searchController.clear();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: AppBar(
        titleSpacing: 20,
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.showCurrentLocation)
              ElevatedButton(
                  onPressed: () {
                    context.read<WeatherBloc>().add(
                          WeatherGetLocationButton(),
                        );
                  },
                  child: const Text(
                    'Get Your Location Data',
                    style: TextStyle(fontSize: 14),
                  )),
            Text(
              'Last Updated: ${widget.updatedTime}',
              style: TextStyle(fontSize: widget.showCurrentLocation ? 16 : 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => _showSearchDialog(context),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
