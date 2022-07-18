class datas {
  String? text;
  String? title;
  String? contrat;
  String? description;

  datas({
    this.text,
    this.title,
    this.contrat,
    this.description,
  });

  static datas fromJson(Map<String, dynamic> json) => datas(
      text: json['text'],
      title: json['title'],
      contrat: json['Contrat'],
      description: json['description']);
}
