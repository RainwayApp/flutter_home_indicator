# home_indicator

Flutter plugin to show/hide the iPhone X home indicator.

Also features an API to "defer" screen edges, i.e. require a second swipe-in from the top/bottom/left/right before OS behavior is triggered. This is how you "grey out" the home indicator.

**Warning:** It appears "deferring" the bottom screen edge does _not_ successfully prevent a "home swipe" when the home indicator is also hidden. That is: if you need the behavior of `HomeIndicator.deferScreenEdges([ScreenEdge.bottom])`, then don't also call `HomeIndicator.hide()`.

On Android, this plugin does nothing, and `isHidden` always returns `true`.

## Usage

```dart
import 'package:home_indicator/home_indicator.dart';

await HomeIndicator.hide();
await HomeIndicator.show();
final result = await HomeIndicator.isHidden();
await HomeIndicator.deferScreenEdges([ScreenEdge.bottom]); // Grey it out
```

## Notes
* Even after calling `HomeIndicator.hide()`, the home indicator will show up when the user gestures near the bottom of the screen. This behavior is impossible to override.
