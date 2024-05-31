
import 'package:flutter/material.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/app_constants.dart';


String formatPrice(double prc) {
  double diff = (prc - prc.toInt()) * 100;
  String price = prc.toInt().toString();
  String priceInText = "";
  int counter = 0;
  for(int i = (price.length - 1);  i >= 0; i--){
    counter++;
    String str = price[i];
    if((counter % 3) != 0 && i !=0){
      priceInText = "$str$priceInText";
    }else if(i == 0 ){
      priceInText = "$str$priceInText";

    }else{
      priceInText = " $str$priceInText";
    }
  }

  if (diff > 0) {
    priceInText = "$priceInText.$diff";
  }

  return priceInText.trim();
}

String getDayMonth({DateTime? dateTime}) {
  DateTime now = dateTime ?? DateTime.now();
  return '${now.day} ${AppConstants.months[now.month - 1]}';
}

String getWeekDay({DateTime? dateTime}) {
  DateTime now = dateTime ?? DateTime.now();
  return ', ${AppConstants.weekDays[now.weekday - 1]}';
}

Future<DateTime?> showCalendar(BuildContext context, {bool dissmissable = true, DateTime? initialDate, DateTime? firstDate}) async {
  return await showDatePicker(
      context: context,
      firstDate: firstDate ?? DateTime.now(),
      lastDate: (firstDate ?? DateTime.now()).add(const Duration(days: 100)),
    barrierDismissible: dissmissable,
    initialDate: initialDate,
    builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: AppColors.white,
              onPrimary: AppColors.grey7,
              secondary: Colors.transparent,
              onSecondary: Colors.transparent,
              error: AppColors.red,
              onError: AppColors.darkGreen,
              surface: AppColors.grey7,
              onSurface: AppColors.white)
        ),
        child: child!)
  );
}

String getTimeFromDateTime(String dateTime) {
  DateTime time = DateTime.parse(dateTime);
  return '${time.hour > 9 ? '' : '0'}${time.hour}:${time.minute > 9 ? '' : '0'}${time.minute}';
}

String diffDateInHours(String date1, String date2) {
  DateTime start = DateTime.parse(date1);
  DateTime end = DateTime.parse(date2);
  return( end.difference(start).inMinutes / 60).toStringAsPrecision(2);
}