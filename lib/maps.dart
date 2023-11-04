import 'package:url_launcher/url_launcher.dart';
import 'user.dart';

class MapUtils {

  MapUtils._();

  static Future<User?> openMap(double? latitude, double? longitude) async {
    // String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    var httpsUri = Uri(
    scheme: 'https',
    host: 'www.google.com',
    path: '/maps/search/',
    queryParameters: {
        'api': '1',
        'query': '$latitude,$longitude'
    }
    );
    if (await canLaunchUrl(httpsUri)) {
      await launchUrl(httpsUri);
    } else {
      throw 'Could not open the map.';
    }
  }
}