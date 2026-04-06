# defaults

macOS Sonoma 14.6

[macOS defaults list](https://macos-defaults.com/)

## Accessibility > Trackpad option

There are five properties: `currentHost com.apple.mouse.tapBehavior`, `currentHost com.apple.trackpad.threeFingerDragGesture`, `DragLock`, `Dragging`, `TrackpadThreeFingerDrag`

`com.apple.AppleMultitouchTrackpad` and `com.apple.driver.AppleBluetoothMultitouch.trackpad` both have `DragLock`, `Dragging`, `TrackpadThreeFingerDrag`, which is separately managed: eight properties total.

|                   | tapBehavior | threeFingerDragGesture | DragLock | Dragging | TrackpadThreeFingerDrag |
| ----------------- | ----------- | ---------------------- | -------- | -------- | ----------------------- |
| Without Drag Lock | 2           | 0                      | 0        | 1        | 0                       |
| With Drag Lock    | 3           | 0                      | 1        | 1        | 0                       |
| Three Finger Drag | 1           | 1                      | 0        | 0        | 1                       |
