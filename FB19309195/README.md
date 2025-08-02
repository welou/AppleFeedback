## Issue
Widgets in Notification Center or Desktop do not follow the system appearance on macOS Tahoe (beta 4)

On macOS Tahoe (beta 4, I haven't tested this on earlier betas) a widget in Notification Center or on Desktop does not follow the system appearance and instead always renders in light appearance, ignoring the currently selected system appearance. In comparison on macOS Sequoia widgets do follow system appearance.

Note that specifically on Desktop a widget would only take on the light or dark appearance when no application windows are open. When any application windows are open, widgets on desktop take on a transparent dark appearance (which is outside the scope of this feedback).

### How to reproduce:
**Option 1:** Build and run the attached app (`WidgetAppearanceDemo` - target) and add the `Appearance Test` - widget to Notification Center and to Desktop. Change system appearance.

**Option 2:** Alternatively use any other app which includes a widget which should react to the selected system appearance, for example the system's own Calendar app. Add the widget to Notification Center and to Desktop and change system appearance.

### Expected result:
Widget would update its appearance when system appearance is changed so that widget's appearance always matches system appearance. And more specifically, when system is set to dark appearance, the widget should also be rendered in dark appearance.

### Actual result:
Widget always remains in light appearance.

### Why this is a problem:
Firstly, a widget may have tailored designs for light and dark appearances, and now the design for dark appearance is never used. The design for light appearance may be jarring when it's shown for a user who has set their system to use dark appearance.

Secondly, an app may provide an option for the user to configure a specific appearance for the widgets, which may go against the selected system appearance (for example use dark appearance for widgets, even though system itself is set to use light appearance). This also does not work, because `.preferredColorScheme(.dark)` has no effect.

### Additional information:
I suspect the environments where widgets are shown (Notification Center and Desktop) are somehow incorrectly setting that environment's `ColorScheme`. For example when building just the widgets in Xcode (`Appearance TestExtension` - target) they are shown inside WidgetKit Simulator where they do follow the system's appearance as expected. The environment within WidgetKit Simulator seems to correctly follow the system appearance.
