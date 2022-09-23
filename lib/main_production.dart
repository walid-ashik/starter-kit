import 'package:app_name/app/ui/app.dart';
import 'package:app_name/bootstrap.dart';
import 'package:app_name/config/production.dart';

Future<void> main() async {
  final environment = Production();
  await environment.init();
  await bootstrap(() => const App(), Production());
}
