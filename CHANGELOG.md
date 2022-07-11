## 2.0.2

- Fix iOS build

## 2.0.1

- Android v2 embedding.

## 2.0.0

- Migrate to Flutter 2, Dart 2.12.0 and sound null safety

## 1.1.5

- Empty implementation of deferScreenEdges for Android

## 1.1.4

* Bump Kotlin version (fix #2).

## 1.1.3

* (Hopefully) fix a bug with Swift versions.

## 1.1.2

* Add a warning about the interaction between `HomeIndicator.deferScreenEdges` and `HomeIndicator.hide()`.

## 1.1.1

* Protect against a possible crash involving `object_setClass`.

## 1.1.0

* Add `deferScreenEdges`. A "deferred" screen edge is one the user needs to swipe in from _twice_ to trigger the OS behavior. (Deferring the bottom screen edge corresponds to "greying out" the home indicator, hence its inclusion in this package.)

## 1.0.3

* Use proper Swift 4 syntax for overriding property.

## 1.0.2

* iOS: only override `prefersHomeIndicatorAutoHidden` if it is available.

## 1.0.1

* Update repository URL.

## 1.0.0

* Initial release: `show`, `hide`, and `isHidden` functions.
