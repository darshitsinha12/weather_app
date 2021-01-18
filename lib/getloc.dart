import 'location.dart';
import 'getdata.dart';
import 'constants.dart';

class GetLoc {
  var lattitude;
  var longitude;
  Future getLoc() async {
    Location location = Location();
    await location.getCurrentLoc();

    lattitude = location.lattitude;
    longitude = location.longitude;

    print(longitude);
    print(lattitude);
    NetworkHelper helper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lattitude&lon=$longitude&appid=$apikey&units=metric");
        var ret = await helper.getData();
    return ret;
  }
}
