import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

enum ConfirmControllerState {
  error,
  success,
  reset,
  stop,
}

confirmControllerState({required RoundedLoadingButtonController controller, required ConfirmControllerState? state}) {
  switch (state) {
    case ConfirmControllerState.reset:
      return controller.reset();
    case ConfirmControllerState.error:
      return controller.error();
    case ConfirmControllerState.success:
      return controller.success();
    case ConfirmControllerState.stop:
      return controller.stop();
    default:
      return controller.reset();
  }
}
