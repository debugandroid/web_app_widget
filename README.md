# web_app_widget

web_app_widget is the collection of widget for the web apps.
 - WebAppDrawer

## Installation

Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  web_app_widget: ^0.0.1
```
With Flutter:
```bash
flutter pub add web_app_widget
```

## Usage

```dart
class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebApps  Demo"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Open',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WebAppDrawer(
            divider: true,
            children: [
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: Text("DashBoard"),
                leading: Icon(Icons.apps),
              )
            ],
          ),
          Expanded(
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                Center(
                  child: body(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)