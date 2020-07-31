import 'package:intl/intl.dart';

class StarterTimer {
  static var date = DateTime.now(); 
  static String todayDate = DateFormat('EEEE').format(date); 
  static String month = DateFormat('MMM').format(date);  
  static String day = DateFormat('d').format(date);
}

class GreetUser {
  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    }
    if (hour < 17) {
      return 'Good Afternoon!';
    }
    return 'Good Evening!';
  }
}

String formatDateTime(DateTime dateTime){
  return DateFormat('hh:mm:ss a').format(dateTime);
}