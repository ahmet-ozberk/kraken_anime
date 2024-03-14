abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState();
}

class HomePaginationLoadingState extends HomeState {
  const HomePaginationLoadingState();
}

class HomeErrorState extends HomeState {
  final String message;
  const HomeErrorState(this.message);
}

class HomeEmptyState extends HomeState {
  const HomeEmptyState();
}
