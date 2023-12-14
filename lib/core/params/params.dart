class NoParams {}

class SearchParams {
  final int compoundId;
  final int areaId;
  final int minPrice;
  final int maxPrice;
  final int minBedroom;
  final int maxBedroom;
  SearchParams(
      {required this.compoundId,
      required this.areaId,
      required this.minPrice,
      required this.maxPrice,
      required this.minBedroom,
      required this.maxBedroom});
}
