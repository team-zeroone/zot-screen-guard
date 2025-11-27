# ZOT Screen Guard

ZOT Screen Guard is a lightweight Flutter utility designed to streamline cross-platform screenshot prevention. It acts as a unified abstraction over existing native screenshot-blocking solutions, enabling engineering teams to seamlessly enforce content-protection policies across Android, iOS, macOS, and Windows with a single API surface.

Web is gracefully ignored (no-op), ensuring smooth multi-platform CI/CD workflows.

---

## ✨ Features

- **Cross-platform screenshot blocking**  
  Single API to enable/disable secure-screen modes across supported platforms.
- **Screen-recording prevention** where available.  
- **Failsafe logging** for unsupported platforms or runtime exceptions.
- **Zero configuration** — plug and play.

---

## 📦 Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  zot_screen_guard:
    git:
      url: https://github.com/team-zeroone/zot-screen-guard
      ref: main
````

Then import it into your project:

```dart
import 'package:zot_screen_guard/zot_screen_guard.dart';
```

---

## 🚀 Usage

### Disable Screenshot Capture

```dart
await ZOTScreenGuard.disableScreenCapture();
```

### Enable Screenshot Capture

```dart
await ZOTScreenGuard.enableScreenCapture();
```

Both APIs automatically handle:

* Android
* iOS
* macOS
* Windows

Web is safely ignored.

---

## 🛠 Supported Platforms

| Platform | Supported    | Notes                   |
| -------- | ------------ | ----------------------- |
| Android  | ✅            | Uses `no_screenshot`    |
| iOS      | ✅            | Uses `no_screenshot`    |
| macOS    | ✅            | Uses `no_screenshot`    |
| Windows  | ✅            | Uses `screenshot_guard` |
| Web      | 🚫 (ignored) | No secure-screen API     |
| Linux    | 🚫           | Not supported.           |

---

## 📘 API Reference

### `disableScreenCapture()`

Activates screenshot and screen-recording prevention.
Includes platform detection and graceful error handling.

### `enableScreenCapture()`

Restores normal screenshot and recording behavior.

---

## 🧩 Example

```dart
import 'package:zot_screen_guard/zot_screen_guard.dart';

class ExamplePage extends StatefulWidget {
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  void initState() {
    super.initState();
    ZOTScreenGuard.disableScreenCapture();
  }

  @override
  void dispose() {
    ZOTScreenGuard.enableScreenCapture();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Secure content area")),
    );
  }
}
```

---

## 🤝 Contributing

Contributions, enhancements, and issue reports are warmly welcomed.

---

## 📜 License

MIT — fully open for commercial and private use.
