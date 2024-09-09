class CalendarModel {
  String? id;
  int? hijreeMonth;
  int? hijreeDay;
  int? meladyMonth;
  int? meladyDay;
  String? hijreeMonthName;
  DateTime? dateTime;
  String? hijreYear;

  CalendarModel(
      {this.hijreeMonth,
      this.hijreeDay,
      this.meladyMonth,
      this.meladyDay,
      this.hijreeMonthName,
      this.dateTime,
      this.hijreYear,
      this.id});

  CalendarModel.fromJson(dynamic json) {
    try {
      try {
        id = json.id;
      } catch (_) {}

      hijreeMonth = json['hijree_month'];

      hijreeDay = json['hijree_day'];

      meladyMonth = json['melady_month'];
      meladyDay = json['melady_day'];
      hijreeMonthName = json['hijree_month_name'];
      hijreYear = json['hijre_year'];

      dateTime = DateTime.tryParse(json['dateTime'].toString());
    } catch (_) {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['hijree_month'] = hijreeMonth;
    data['hijree_day'] = hijreeDay;
    data['melady_month'] = meladyMonth;
    data['melady_day'] = meladyDay;
    data['hijree_month_name'] = hijreeMonthName;
    data['hijre_year'] = hijreYear;

    data['dateTime'] = dateTime.toString();
    data['id'] = id;
    return data;
  }

  CalendarModel copyWith({
    int? hijreeMonth,
    int? hijreeDay,
    int? meladyMonth,
    int? meladyDay,
    String? hijreeMonthName,
    DateTime? dateTime,
    String? hijreYear,
    String? id,
  }) {
    return CalendarModel(
      hijreeMonth: hijreeMonth ?? this.hijreeMonth,
      hijreeDay: hijreeDay ?? this.hijreeDay,
      meladyMonth: meladyMonth ?? this.meladyMonth,
      meladyDay: meladyDay ?? this.meladyDay,
      hijreeMonthName: hijreeMonthName ?? this.hijreeMonthName,
      dateTime: dateTime ?? this.dateTime,
      hijreYear: hijreYear ?? this.hijreYear,
      id: id ?? this.id,
    );
  }
}
