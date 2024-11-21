import 'package:intl/intl.dart'; // Đảm bảo bạn đã import thư viện intl

class DateUtilsCustom {
  // Hàm để định dạng DateTime thành chuỗi ngày tháng
  static String formatDate(DateTime? date) {
    if (date != null) {
      try {
        // Định dạng ngày tháng năm
        return DateFormat('dd/MM/yyyy').format(date); // Định dạng ngày
      } catch (e) {
        print("Error formatting date: $e"); // In ra lỗi nếu có
        return date.toString(); // Nếu không thể định dạng, giữ nguyên chuỗi
      }
    } else {
      return 'N/A'; // Hoặc một thông báo mặc định khác
    }
  }

  // Hàm để chuyển đổi chuỗi ngày tháng có định dạng khác thành DateTime và định dạng
  static String formatStringDate(String? date) {
    if (date != null && date.isNotEmpty) {
      try {
        // Nếu chuỗi có định dạng không phải ISO 8601, bạn có thể sử dụng regex để lấy phần ngày
        RegExp regExp = RegExp(r'(\d{1,2}/\d{1,2}/\d{4})'); // Regex để tìm ngày
        Match? match = regExp.firstMatch(date);
        if (match != null) {
          return match.group(0)!; // Trả về phần ngày tìm được
        } else {
          return 'N/A'; // Nếu không tìm thấy ngày
        }
      } catch (e) {
        print("Error parsing date: $e"); // In ra lỗi nếu có
        return date; // Nếu không thể phân tích, giữ nguyên chuỗi
      }
    } else {
      return 'N/A'; // Hoặc một thông báo mặc định khác
    }
  }

  static String formatDateCustom(DateTime? dateTime) {
    if (dateTime == null) {
      return 'N/A'; // Trả về 'N/A' nếu dateTime là null
    }
    try {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } catch (e) {
      print("Error formatting date: $e"); // In ra lỗi nếu có
      return 'N/A'; // Trả về 'N/A' nếu có lỗi
    }
  }

  // Hàm để phân tích chuỗi ngày tháng và định dạng thành chuỗi dd/MM/yyyy
  static String formatDateString(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'N/A'; // Trả về 'N/A' nếu chuỗi rỗng
    }

    List<String> formats = [
      "M/d/yyyy h:mm:ss a",
      "yyyy/MM/dd HH:mm:ss",
      "M/d/yyyy",
      "yyyy-MM-dd",
      "dd/MM/yyyy",
    ];

    DateTime? dateTime;

    // Thử từng định dạng trong danh sách
    for (String format in formats) {
      try {
        DateFormat inputFormat = DateFormat(format);
        dateTime = inputFormat.parse(dateString);
        break; // Nếu phân tích thành công, thoát khỏi vòng lặp
      } catch (e) {
        // Nếu không thành công, tiếp tục với định dạng tiếp theo
      }
    }

    // Nếu không phân tích được, trả về 'N/A'
    if (dateTime == null) {
      return 'N/A';
    }

    // Định dạng lại thành chuỗi theo dd/MM/yyyy
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}
