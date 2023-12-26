import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class GridViewButtonsPage extends StatefulWidget {
  const GridViewButtonsPage({super.key});

  @override
  State<GridViewButtonsPage> createState() => _GridViewButtonsPageState();
}

class _GridViewButtonsPageState extends State<GridViewButtonsPage> {
  final _exportKey = GlobalKey<JsonWidgetExporterData>();

  final registry = JsonWidgetRegistry();

  final List<String> keys = [
    "#1",
    "#2",
    "#3",
    "#4",
    "#5",
    "#6",
    "#7",
    "#8",
    "#9",
    "#10",
  ];

  @override
  void initState() {
    super.initState();

    // registry.s('id', () => () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return JsonWidgetExporter(
      key: _exportKey,
      child: JsonExportable(
        child: JsonScaffold(
          floatingActionButton: JsonFloatingActionButton(
            onPressed: () {
              final data = _exportKey.currentState!.export(
                indent: '  ',
                mode: ReverseEncodingMode.json,
              );
              Clipboard.setData(ClipboardData(text: data));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Copied to clipboard'),
                ),
              );
            },
          ),
          appBar: JsonAppBar(title: JsonText('AppBar')),
          body: JsonPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: JsonListView(
              children: List.generate(keys.length, (index) {
                return JsonElevatedButton(
                  onPressed: null,
                  child: JsonText(keys[index],
                      args: {
                        'id': keys[index],
                        // 'color': '{color}',
                      },
                      style: const TextStyle(color: Colors.red)
                      // registry: JsonWidgetRegistry(
                      //   parent: registry,
                      // ),
                      ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
