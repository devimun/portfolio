class ZoneData {
  final List<int> data;

  ZoneData({
    required this.data,
  });

  factory ZoneData.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as List<int>;
    return ZoneData(
      data: data,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }

  @override
  String toString() {
    return 'ZoneData(data: $data)';
  }
}
