import 'package:app_name/app/ui/app.dart';
import 'package:app_name/bootstrap.dart';
import 'package:app_name/config/development.dart';

Future<void> main() async {
  final environment = Development();
  await environment.init();
  await bootstrap(() => const App(), Development());
}
