import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Resultitem extends StatelessWidget {
  final String image;
  final String url;
  final String contrat;
  final String description;
  final String situation;

  Resultitem(
      {Key? key,
      required this.image,
      required this.description,
      required this.situation,
      required this.url,
      required this.contrat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => _launchUrl(),
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(image,
                    height: 200.0, width: 200.0, fit: BoxFit.fitHeight),
              ),
              Text(
                description ?? "Failed to load",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                situation ?? "Unknown ",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.2),
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchUrl() async {
    await launchUrlString(url);
  }
}
