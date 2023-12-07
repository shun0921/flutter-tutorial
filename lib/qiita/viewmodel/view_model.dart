import 'package:flutter_tutorial/qiita/model/article_state/article_state.dart';
import 'package:flutter_tutorial/qiita/repository/repository.dart';
import 'package:riverpod/riverpod.dart';

final qiitaViewModelProvider =
    StateNotifierProvider.autoDispose<QiitaViewModel, ArticleState>(
  QiitaViewModel.new,
);

class QiitaViewModel extends StateNotifier<ArticleState> {
  QiitaViewModel(this._ref) : super(const ArticleState());

  final Ref _ref;

  QiitaRepository get _qiitaRepository => _ref.read(qiitaRepositoryProvider);

  Future<void> fetchArticles(String tag) async {
    state = state.copyWith(isLoading: true);

    final articles = await _qiitaRepository.fetchArticles(tag);

    if (!mounted) {
      return;
    }
    if (articles.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        isReadyData: true,
        currentTag: tag,
        articles: articles,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        isReadyData: false,
        articles: articles,
      );
    }
  }

  Future<void> onBackHome() async {
    state = state.copyWith(
      isLoading: false,
      isReadyData: false,
      currentTag: '',
    );
  }
}
