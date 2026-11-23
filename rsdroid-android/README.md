# rsdroid-android

Android entry point for the Anki backend. This Android library exposes
[`:rsdroid`](../rsdroid) through an `api` dependency, so consumers can use the
backend API through this module.


Maven consumers should depend on ths via `org.ankiquest:ankiquest-backend-android`.

## Contents

`ankiquest-backend-android` contains:

- Android native libraries (`librsdroid.so` for each supported architecture).
- Web assets packaged as Android assets.
- Android SQLite adapters
