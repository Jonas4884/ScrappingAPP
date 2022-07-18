import 'package:flutter/material.dart';
import 'package:my_app/Result_item.dart';
import 'package:my_app/http_service.dart';
import 'package:my_app/scrapper_service.dart';
import 'package:web_scraper/web_scraper.dart';

class ResultList extends StatefulWidget {
  const ResultList({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultList> createState() => _ResultlistState();
}

class _ResultlistState extends State<ResultList> {
  bool loaded = false;
  List<Resultitem> resultlist = [];

  Future<void> getData() async {
    resultlist.clear();
    loaded = true;
    setState(() {});
    final html = await HttpService.get();
    if (html != null) {
      resultlist = ScraperService.run(html);
      loaded = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (loaded)
            ? ListView(
                physics: BouncingScrollPhysics(),
                children: resultlist,
              )
            : CircularProgressIndicator(),
      ),
    );
    ;
  }

  /* void getData() async {
    resultlist.clear();
    WebScraper webScraper = WebScraper();
    if (await webScraper.loadWebPage(
        '$pageExtension{widget.search.trim().replaceAll(' ',' ')}')) {
      List<Map<String, dynamic>> images =
          webScraper.getElement("div > div.max > article", ['src']);
      List<Map<String, dynamic>> description = webScraper.getElement(
          'div > div.max > article > aside.contenu_annonce', ['innerHtml']);
      List<Map<String, dynamic>> lien = webScraper
          .getElement('aside.contenu_annonce > h3 > a > strong', ['href']);
      List<Map<String, dynamic>> situation = webScraper
          .getElement("aside.date_annonce > div.urgent_flag", ['innerHtml']);

      images.forEach((image) {
        int i = images.indexOf(image);
        resultlist.add(Resultitem(
            image: images[i]['attributes']['src'],
            description:
                description[i]['attributes']['innerHtml'].toString().trim(),
            situation: situation[i]['attributes']['innerHtml'],
            url: lien[i]['attributes']['href']));
      });

      setState(() {
        loaded = true;
      })
    }
  }*/
}
