import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<JsonWidgetData?> loadData() async {
    try {
      final registry = JsonWidgetRegistry.instance.copyWith();
      final pageStr = await rootBundle.loadString(
        // 'assets/data/buttons.json',
        'assets/data/gridview.json',
      );
      final dataJson = yaon.parse(pageStr);

      // This is put in to give credit for when designs from online were used in
      // example files.  It's not actually a valid attribute to exist in the JSON
      // so it needs to be removed before we create the widget.
      dataJson.remove('_designCredit');

      return JsonWidgetData.fromDynamic(
        dataJson,
        registry: registry,
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<JsonWidgetData?>(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;

          return data!.build(context: context);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
