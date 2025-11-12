enum GameState {
  welcome,
  play,
  pause,
  end,
}

enum PlayerState {
  idle,
  jump,
}

enum PlayerAsset {
  normal,
  sad,
  shock,
  smile,
}

enum AlienAsset {
  normal,
}

enum GameComponent {
  player,
  ailen,
}

enum LoadingResult {
  update,
  notice,
  error,
  good,
}

enum ModalType {
  reset,
  cloud,
}

enum CoinType {
  playCoin,
  cashCoin,
}

enum ButtonType {
  start,
  select,
  unlock,
}

enum CommandType {
  tr,
  tl,
  br,
  bl,
}

enum QuestionElementStatus {
  correct,
  incorrect,
  idle,
}

enum SettingType {
  sfx,
  bgm,
}
