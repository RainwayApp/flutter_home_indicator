# home_indicator

Flutter plugin to show/hide the iPhone X home indicator.

On Android, this plugin does nothing, and `isHidden` always returns `true`.

## Usage

```dart
import 'package:home_indicator/home_indicator.dart';

await HomeIndicator.show();
await HomeIndicator.hide();
final result = await HomeIndicator.isHidden();
```

## Notes
* Even after calling `HomeIndicator.hide()`, the home indicator will show up when the user gestures near the bottom of the screen. This behavior is impossible to override.
