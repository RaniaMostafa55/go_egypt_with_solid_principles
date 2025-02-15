import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/features/favorites/presentation/bloc/favorites_state.dart';
import 'package:go_egypt_with_firebase/generated/l10n.dart';
import '../../domain/entities/favorite_place.dart';
import '../bloc/favorites_bloc.dart';
import '../widgets/favorite_card_item.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favorites),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoritesError) {
            return Center(child: Text(state.message));
          } else if (state is FavoritesLoaded) {
            return _buildFavoritesGrid(state.favorites);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildFavoritesGrid(List<FavoritePlace> favorites) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return FavoriteCardItem(place: favorites[index]);
      },
    );
  }
}
