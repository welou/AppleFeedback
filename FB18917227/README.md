## Issue
On macOS Tahoe (beta 3) if a `MenuBarExtra` uses the `.window` style, the window is always rendered in dark appearance, regardless of the currently selected system appearance.

### How to reproduce:
1. On macOS Tahoe (beta 3) with Xcode 26.0 beta 3, create an app that has a `MenuBarExtra` that uses the `.window` style.
2. Run the application.
3. While application is running, switch system appearance between light and dark appearance.

### Expected result:
The `MenuBarExtra` window should react to system appearance changing.

### Actual result:
The `MenuBarExtra` window always remains in dark appearance.

### Why is this a problem:
If an app includes a complex view inside a `MenuBarExtra` and the user has configured macOS to use the light appearance, it is jarring to see the Menu Bar window in the dark appearance. Furthermore, if the app includes a setting where user can specifically choose whether they want to see the application itself use light or dark appearance, regardless of system’s appearance, this setting would be ignored as system will anyway force the dark appearance on the Menu Bar window.

### Additional information:
It doesn’t make a difference, whether system appearance is changed while app is running or before the app is launched. In either case, the `MenuBarExtra` window will be in dark appearance.

If nothing else is specified, the Menu Bar window is actually rendered using a transparent glass style (seemingly in dark appearance). When a `.background(.windowBackground)` is added to the view, the view takes the visual style of a regular window material, but remains in dark appearance. Even after adding `.preferredColorScheme(.light)` the window still remains in dark appearance.

A demo app is attached (`MenuBarExtraDemo`) which includes a regular window and a `MenuBarExtra` in `.window` style. The regular window reacts to system appearance changing between light and dark, but the window in Menu Bar always remains in dark appearance.
