import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/features/home/presentation/widgets/card_widget.dart';
import 'package:go_egypt_with_firebase/features/home/presentation/widgets/place_item_widget.dart';
import 'package:go_egypt_with_firebase/features/home/presentation/widgets/shimmer_card_widget.dart';
import 'package:go_egypt_with_firebase/features/home/presentation/widgets/shimmer_place_item.dart';
import 'package:go_egypt_with_firebase/generated/l10n.dart';

import '../bloc/places_bloc.dart';
import '../bloc/places_event.dart';
import '../bloc/places_state.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<PlacesBloc>().add(LoadPlaces());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).suggested_places_to_visit,
        ),
      ),
      body: BlocBuilder<PlacesBloc, PlacesState>(
        builder: (context, state) {
          if (state is PlacesLoading) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.4,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) =>
                            const ShimmerPlaceItem(),
                        itemCount: 5, // Number of shimmer placeholders
                      ),
                    ),
                    Text(
                      S.of(context).popular_places,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.4,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const ShimmerCardWidget(),
                        itemCount: 5, // Number of shimmer placeholders
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is PlacesError) {
            return Center(child: Text(state.message));
          } else if (state is PlacesLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.4,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) =>
                            PlaceItemWidget(place: state.places[index]),
                        itemCount: state.places.length,
                      ),
                    ),
                    Text(
                      S.of(context).popular_places,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.4,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CardWidget(
                          card: state.cards[index],
                          place: state.places[index],
                        ),
                        itemCount: state.cards.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
