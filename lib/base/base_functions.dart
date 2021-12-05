import 'package:e_space_mobile/data/data_source/local_source.dart';
import 'package:e_space_mobile/data/models/auth/refresh_token_response.dart';
import 'package:e_space_mobile/data/repository/auth_repository.dart';
import 'package:intl/intl.dart';

class BaseFunctions {
  static String numberWithZero(String number) {
    if (number.substring(0, 1) == '0')
      return number;
    else if (number.length == 1) return "0$number";
    return number;
  }

  static String moneyFormat(num number) {
    String splitter = " ";
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = NumberFormat().format(number).split(",").join(splitter);
    return isNegative ? "-" + result : result;
  }

  static Future<void> refreshToken() async {
    String rToken = LocalSource.getInstance().getRefreshToken();
    print('RRRRRRRRRRRRRRRRR :$rToken');
    final auth = AuthRepository();
    final result = await auth.refreshToken(rToken);
    if (result is RefreshTokenResponse) {
      LocalSource.getInstance()
          .setTokens(result.accessToken ?? '', result.refreshToken ?? '');
    }
  }
// static String getStringByLanguage(Title value) {
//   var lang = GetStorage().read<String>('locale') ?? 'ru';
//   if (lang == 'ru') {
//     return value?.ru ?? '';
//   } else if (lang == 'en') {
//     return value?.en ?? '';
//   } else {
//     return value?.uz ?? '';
//   }
// }
}
