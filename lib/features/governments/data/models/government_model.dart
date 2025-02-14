import '../../domain/entities/government.dart';

class GovernmentModel extends Government {
  const GovernmentModel({
    required super.enName,
    required super.arName,
    required super.image,
  });

  static List<GovernmentModel> fromStaticData() {
    return [
      const GovernmentModel(
        enName: 'Cairo',
        arName: 'القاهرة',
        image:
            'https://i0.wp.com/www.re-thinkingthefuture.com/wp-content/uploads/2024/01/6.-Cairo-Egypt-cover_900_584.jpg?w=999',
      ),
      const GovernmentModel(
        enName: 'Alexandria',
        arName: 'الإسكندرية',
        image:
            'https://www.cleopatraegypttours.com/wp-content/uploads/2018/08/Alexandria-Egypt.jpg',
      ),
      const GovernmentModel(
        enName: 'Luxor',
        arName: 'الأقصر',
        image:
            'https://cdn.britannica.com/08/178108-050-F19D0A38/statues-entrance-Ramses-II-Luxor-temple-complex.jpg',
      ),
    ];
  }
}
