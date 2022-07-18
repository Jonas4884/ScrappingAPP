import 'dart:developer';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:httpservice/httpservice.dart' as http;
import 'package:my_app/Result_item.dart';

class ScraperService {
  static List<Resultitem> run(String html) {
    try {
      final soup = BeautifulSoup(html);
      final items = soup.findAll('article', class_: 'item_annonce prem');
      List<Resultitem> offer = [];
      for (var item in items) {
        final title = item.find('strong')?.text ?? '';
        final society = item.find('h4')?.text ?? '';
        final contrat = item.find('h5')?.text ?? '';
        final description = item.find('a', class_: 'description')?.text ?? '';
        final url = item.find('a', selector: 'href')?.text ?? '';
        final status = item.find('div', class_: 'urgent_flag')?.text ?? '';

        Resultitem package = Resultitem(
          image: title,
          description: description,
          situation: status,
          url: url,
          contrat: contrat,
        );

        offer.add(package);
        return offer;
      }
    } catch (e) {
      log('$ScraperService e');
    }
    return [];
  }
}
