abstract class PokemonEvent {
  final int page;

  PokemonEvent(this.page);
}

class LoadPokemonEvent extends PokemonEvent {
  LoadPokemonEvent(super.page);
}

class PullToRefreshEvent extends PokemonEvent {
  PullToRefreshEvent(super.page);
}
