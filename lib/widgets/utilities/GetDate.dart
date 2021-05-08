import 'package:intl/intl.dart';

class GetDate {

  String getDateNow (){
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

}