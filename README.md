⚠️ Not production ready yet

# fbs

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)



Is a brick to generate new background service based on [flutter_background_service](https://pub.dev/packages/flutter_background_service)

## Why ?
In my current project I wanted to create 3 different background services which is not an easy task using method channels and not yet achievable using jni.

[flutter_background_service](https://pub.dev/packages/flutter_background_service) is a very good package to create a foreground service and its communication channels and I wanted 3 of it.

That's why I made a whole package as template to create any foreground service and easy to keep the template and the upstream repository in sync for farther updates thanks to `git subtree`

## How to use it:

1-  install `mason_cli` using pub `dart pub global activate mason_cli`

2- `mason init`

3- add `fbs` brick to `mason.yaml`
```yaml
bricks:
  fbs:
    git:
      url: https://github.com/HosamHasanRamadan/fbs.git
      ref: main
```
4- run `mason get`

5- use the brick to generate new background service 

- `mason make fbs`
- enter service  name in camel case for example `UploadAudio`
-  now you can add `flutter_upload_audio_background_service` to `pubspec.yaml` in your project
