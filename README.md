# AgoraDesk, LocalMonero Apps

There are two apps under one code base in this repository.

## AgoraDesk

<div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 8px;">
<a href="https://play.google.com/store/apps/details?id=com.agoradesk.app" target="_blank" rel="noopener noreferrer">
<img alt="Get it on Google Play" src="https://agoradesk.com/static/img/mobile-app-banner/google.png" style="height: 45px; border-radius: 8px;"></a>
<a href="https://apps.apple.com/app/agoradesk-p2p-btc-trading/id1617601678" target="_blank" rel="noopener noreferrer">
<img alt="Download on the App Store" src="https://agoradesk.com/static/img/mobile-app-banner/apple.png" style="height: 45px; border-radius: 8px;"></a>
<a href="https://f-droid.org/en/packages/com.agoradesk.app/" target="_blank" rel="noopener noreferrer">
<img alt="Get in on F-Droid" src="https://agoradesk.com/static/img/mobile-app-banner/fdroid.png" style="height: 45px; border-radius: 8px;"></a>
<a href="https://github.com/AgoraDesk-LocalMonero/agoradesk-app-foss/releases" target="_blank" rel="noopener noreferrer">
<img alt="Download .apk directly from GitHub" src="https://agoradesk.com/static/img/mobile-app-banner/apk.png" style="height: 45px; border-radius: 8px;"></a>
</div>

## LocalMonero

<div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 8px;">
<a href="https://play.google.com/store/apps/details?id=co.localmonero.app" target="_blank" rel="noopener noreferrer">
<img alt="Get it on Google Play" src="https://localmonero.co/static/img/mobile-app-banner/google.png" style="height: 45px; border-radius: 8px;"></a>
<a href="https://apps.apple.com/app/localmonero-p2p-xmr-trading/id1627693140" target="_blank" rel="noopener noreferrer">
<img alt="Download on the App Store" src="https://localmonero.co/static/img/mobile-app-banner/apple.png" style="height: 45px; border-radius: 8px;"></a>
<a href="https://f-droid.org/en/packages/co.localmonero.app/" target="_blank" rel="noopener noreferrer">
<img alt="Get in on F-Droid" src="https://localmonero.co/static/img/mobile-app-banner/fdroid.png" style="height: 45px; border-radius: 8px;"></a>
<a href="https://github.com/AgoraDesk-LocalMonero/agoradesk-app-foss/releases" target="_blank" rel="noopener noreferrer">
<img alt="Download .apk directly from GitHub" src="https://localmonero.co/static/img/mobile-app-banner/apk.png" style="height: 45px; border-radius: 8px;"></a>
</div>

## App Features 🔥

1. Within one code base there are 2 apps: AgoraDesk, LocalMonero.
Each app can be built as Android and iOS native app.
Design and logic separation made with flavors (more info further in this doc).

2. Universal Links work for Android and iOS. In case the app is installed on the device,
the regular links will run apps instead of browsers.
In case of two apps installed on one device the AgoraDesk app is prioritized (it means in case of link
localmonero/something AgoraDesk app will be opened).

3. Push notifications to work on iOS & Android. In case the user's device
(for example in China or with GrapheneOS) can't receive pushes, the app detects it and start
polling in the background mode. [More info](Notifications.md)

4. For anonymization reasons all notifications are sent without translations and are translated on the client's side.
So, we use data messages to display them with the app code (not with the FCM).

5. Made with Dart & Flutter ❤️

## Build

For build the app locally after getting code from repository use FOSS commands in `Makefile`.

For example, to build a FOSS apk LocalMonero app

`flutter build apk --verbose --flavor localmonero --dart-define=app.flavor=localmonero --dart-define=app.includeFcm=false`

The apps use MapBox for reverse geocoding. In order to build it yourself, you need to create/provide your own MapBox API key. [The instructions can be found here.](https://docs.mapbox.com/help/tutorials/get-started-tokens-api/)

After that, create the file `lib/keys/keys.dart` and add your key there: `key const keysMapToken = 'YOUR_MAPBOX_KEY';`


You will get the app that works without [FCM](https://firebase.google.com/docs/cloud-messaging) services.
Push notifications will be received with polling with foreground service (if the app is closed it still works).

## Translation

The source of truth for the translation files is .json language files for web-version.
https://github.com/AgoraDesk-LocalMonero/translation

In the flutter we use .arb files. For conversion to both directions use dart util
https://github.com/AgoraDesk-LocalMonero/dart-json-arb-json-converter

## Flavors

### How to build iOS with run parameters
- https://stackoverflow.com/a/65315937/7198006

### Fastlane
- https://roszkowski.dev/2019/flutter-flavors/

### Initial settings
- https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b

### Set up Firebase for different flavors
- https://firebase.flutter.dev/docs/cli
- https://firebase.google.com/docs/projects/multiprojects
- https://stackoverflow.com/questions/37615405/use-different-googleservice-info-plist-for-different-build-schemes
- https://stackoverflow.com/questions/56626467/use-different-googleservice-info-plist-for-single-project-in-xcode-using-swift4

### Set up iOS links for the different apps
ios/Runner/Runner.entitlements
ios/Runner/Runner-localmonero.entitlements


## Presspacks
- Agoradesk https://agoradesk.com/static/press/agoradesk-presspack.zip/
- LocalMonero https://localmonero.co/static/press/localmonero-presspack.zip/

## Known issues

### Push notifications

The backend sends data messages. We get them in the app, translate and display them.
So, when the app is terminated, we should run the app, handle the message and display it.

#### iOS issues

1. As we use data messages, when the app is killed (terminated, swipe up), iOS terminate all app activities and 
the app can't display messages.
https://developer.apple.com/forums/thread/132191


## Contribution

1. Commits naming https://www.conventionalcommits.org/en/v1.0.0/

Types other than fix: and feat: are allowed, for example @commitlint/config-conventional (based on the the Angular convention) recommends build:, chore:, ci:, docs:, style:, refactor:, perf:, test:, and others.

Mark commit number with #, for example `fix: #89`.

Also we can use following:

- feat: A new feature
- style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- fix: A bug fix
- docs: Documentation only changes
- refactor: A code change that neither fixes a bug nor adds a feature
- perf: A code change that improves performance
- test: Adding missing tests
- chore: Changes to the build process or auxiliary tools and libraries such as documentation generation

The source: https://ec.europa.eu/component-library/v1.15.0/eu/docs/conventions/git/#:~:text=feat%3A%20A%20new%20feature,bug%20nor%20adds%20a%20feature

## Credits

- We thank shortwavesurfer2009 for extensive accessibility testing



