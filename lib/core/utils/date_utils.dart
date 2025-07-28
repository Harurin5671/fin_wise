String getGreeting() {
  final now = DateTime.now();
  final hour = now.hour;

  if (hour >= 5 && hour < 12) {
    return 'Buenos Días';
  } else if (hour >= 12 && hour < 18) {
    return 'Buenas Tardes';
  } else {
    return 'Buenas Noches';
  }
}

class DateTimeUtils {
  static String formatToMonthYear(DateTime date) {
    const monthNames = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];

    final monthName = monthNames[date.month - 1];
    final year = date.year.toString().substring(2);

    return '$monthName $year';
  }
}
