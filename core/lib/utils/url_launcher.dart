import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(String url) async {
  final Uri urlUri = Uri.parse(url);
  if (!await launchUrl(urlUri)) {
    throw Exception('Could not launch $urlUri');
  }
}
