import 'package:app_name/app/ui/app.dart';
import 'package:app_name/bootstrap.dart';
import 'package:app_name/config/staging.dart';

Future<void> main() async {
  final environment = Staging();
  await environment.init();
  await bootstrap(() => const App(), Staging());
}
