import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/regidence/api/api.dart';
import 'package:flutter_tutorial/regidence/model/regidence.dart';

final regidenceStateNotifierProvider =
    StateNotifierProvider<RegidenceStateNotifier, RegidenceState>((ref) {
  return RegidenceStateNotifier();
});

class RegidenceStateNotifier extends StateNotifier<RegidenceState> {
  RegidenceStateNotifier() : super(RegidenceState()) {
    _fetchData();
  }

  void updateSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> _fetchData() async {
    state = state.copyWith(isLoading: true);
    try {
      final dio = Dio();
      final api = Api(dio);
      final regidences = await api.getRegidences();
      state = state.copyWith(regidences: regidences, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

class RegidenceState {
  RegidenceState({
    this.regidences = const [],
    this.isLoading = false,
    this.selectedIndex = 0,
  });
  final List<Regidence> regidences;
  final bool isLoading;
  final int selectedIndex;

  RegidenceState copyWith({
    List<Regidence>? regidences,
    bool? isLoading,
    int? selectedIndex,
  }) {
    return RegidenceState(
      regidences: regidences ?? this.regidences,
      isLoading: isLoading ?? this.isLoading,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
