class PlaceModel {
  String imagePath;
  String enName;
  String arName;
  PlaceModel({
    required this.enName,
    required this.imagePath,
    required this.arName,
  });

  static List<PlaceModel> places = [
    PlaceModel(
      imagePath:
          'https://media.istockphoto.com/id/1222196925/photo/view-over-main-ancient-egyptian-temple-at-abu-simbel.jpg?b=1&s=612x612&w=0&k=20&c=iltSnB0cou-8l5Oh1GjYyq_iO3lwxBrWss6uwJKyvp0=',
      enName: 'Abu-Simbel Temple',
      arName: 'معبد أبو سمبل',
    ),
    PlaceModel(
      imagePath:
          'https://media.istockphoto.com/id/96318973/photo/pyramids-egypt.jpg?b=1&s=612x612&w=0&k=20&c=iUppfLGi7_E21NkIbh791JHrbZedszAqOrSsxPlQjyI=',
      enName: 'Pyramids',
      arName: 'الأهرامات',
    ),
    PlaceModel(
      imagePath:
          'https://media.istockphoto.com/id/465985662/photo/view-of-the-karnak-temple-in-the-evening-egypt.jpg?s=612x612&w=0&k=20&c=3VCo1js0eJoUwxJDGywyhphXh93ifOhfvJ0dR0wvzik=',
      enName: 'Karnak Temple',
      arName: 'معبد الكرنك',
    ),
    PlaceModel(
      imagePath:
          'https://media.istockphoto.com/id/1327507461/photo/traditional-nile-sailboats-near-the-banks-of-aswan-egypt.jpg?s=612x612&w=0&k=20&c=V_rKmNg0bq1hoU2joWZ_Ov_taWpCYzQ7MbL1f4wIEwA=',
      enName: 'Nile river Cruise',
      arName: 'رحلة نيلية',
    ),
    PlaceModel(
      imagePath:
          'https://momaa.org/wp-content/uploads/2019/10/Bibliotheca-Alexandrina-1-1024x568.png',
      enName: 'Library of Alexandria',
      arName: 'مكتبة الإسكندرية',
    ),
  ];
}
