<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Create Slide action in flutter. It's highly customizable

## Features

Create customizable slide button

<!-- ## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package. -->

## Usage

```dart
FlutterSlide(
    height: 60,
    buttonSize: 50,
    shimmer: false,
    width: double.infinity,
    action: () {},
    baseColor: Colors.white,
    backgroundColor: Colors.black,
    label: const Text(
    "Slide to Done",
    style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.w500,
        fontSize: 20),
    ),
    child: const Icon( 
        Icons.arrow_forward_ios,
        size: 50,
        color: Colors.white,
    ),
)
```

<!-- ## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more. -->
