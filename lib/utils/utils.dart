import 'package:flutter/material.dart';
import 'package:qr_scanner/models/app_models.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final Uri _url = Uri.parse(scan.value);

  if (scan.type == 'http') {
    // Open the url in the browser

    await canLaunchUrl(_url)
        ? await launchUrl(_url)
        : throw 'Could not launch $_url';
  } else {    
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
