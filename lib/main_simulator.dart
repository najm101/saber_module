import 'package:saber_module/data/flavor_config.dart';
import 'package:saber_module/main_common.dart' as common;
import 'package:simulator/simulator.dart';

Future<void> main(List<String> args) async {
  FlavorConfig.setup();

  await common.mainEditor(
    initWidgetsBinding: SimulatorWidgetsFlutterBinding.ensureInitialized,
    runApp: runSimulatorApp,
  );
}
