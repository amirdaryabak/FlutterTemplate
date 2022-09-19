class AddressSearchEntity {
  final int count;
  final List<ItemSearchEntity> items;

  AddressSearchEntity({
    required this.count,
    required this.items,
  });
}

class ItemSearchEntity {
  String title;
  String address;
  String category;
  String type;
  String region;
  String neighbourhood;
  LocationEntity location;

  ItemSearchEntity({
    required this.title,
    required this.address,
    required this.category,
    required this.type,
    required this.region,
    required this.neighbourhood,
    required this.location,
  });
}

class LocationEntity {
  final double longitude;
  final double latitude;

  LocationEntity({
    required this.longitude,
    required this.latitude,
  });
}
