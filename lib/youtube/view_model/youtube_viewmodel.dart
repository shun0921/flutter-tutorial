import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/youtube/api/api.dart';
import 'package:flutter_tutorial/youtube/model/movie.dart';

final youtubeStateNotifierProvider =
    StateNotifierProvider<YoutubeStateNotifier, YoutubeState>((ref) {
  return YoutubeStateNotifier();
});

class YoutubeStateNotifier extends StateNotifier<YoutubeState> {
  YoutubeStateNotifier() : super(YoutubeState()) {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    state = state.copyWith(isLoading: true);

    try {
      final dio = Dio();
      final api = Api(dio);
      final movies = await api.getMovies();
      state = state.copyWith(movies: movies, isLoading: false);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}

class YoutubeState {
  YoutubeState({
    this.selectedIndex = 0,
    this.movies = const [],
    this.isLoading = false,
  });
  final int selectedIndex;
  final List<Movie> movies;
  final bool isLoading;

  YoutubeState copyWith({
    int? selectedIndex,
    List<Movie>? movies,
    bool? isLoading,
  }) {
    return YoutubeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
