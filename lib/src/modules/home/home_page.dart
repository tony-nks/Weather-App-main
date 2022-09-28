import 'package:flutter/material.dart';
import 'package:weather_app/api/data_service.dart';
import 'package:weather_app/api/models.dart';
import 'package:weather_app/src/constants/colors.dart';
import 'package:weather_app/src/constants/fonts.dart';
import 'package:weather_app/src/modules/home/widgets/background.dart';
import 'package:weather_app/src/modules/home/widgets/bottom_bar.dart';
import 'package:weather_app/src/theme/text_style.dart';
import 'widgets/weather_capsuli.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dataServiceWeekDetails = DataServiceWeekDetails();
  final _dataService = DataService();

  WeatherResponse? _response;
  WeatherWeekDetails? _responseWeekDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    final response = await DataService().getWeather();
    final responseWeekDetails = await DataServiceWeekDetails().getWeatherWeek();
    setState(() {
      _responseWeekDetails = responseWeekDetails;
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              const BackgroundView(),
              Positioned.fill(
                  top: 100,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FutureBuilder<Object>(
                      future: _dataService.getWeather(),
                      builder: (BuildContext context, snapshot){
                        switch (snapshot.connectionState){
                          case ConnectionState.none : return const Center(child: Text("Подключение отсутсвует"),);
                          case ConnectionState.waiting : return const CircularProgressIndicator();
                          case ConnectionState.done : return Column(
                            children: [
                              Text(
                                '${_response?.cityName}',
                                style: XRegularStyle.largeTitle,
                              ),
                              Text(
                                "${_response?.tempInfo.temperature.toInt()}°",
                                style: const TextStyle(
                                    fontFamily: XFont.display,
                                    fontSize: 96,
                                    fontWeight: FontWeight.w200,
                                    color: XColorLight.white),
                              ),
                              Text(
                                '${_response?.weatherInfo.description}',
                                style: XBoldStyle.title2.copyWith(
                                    color: XColorLight.brightGray.withOpacity(.6)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "H:24°",
                                    style: XBoldStyle.title2,
                                  ),
                                  Text(
                                    "L:18°",
                                    style: XBoldStyle.title2,
                                  )
                                ],
                              ),
                            ],
                          );
                          default : return const Center();
                        }
                      },
                    )
                  )),
              // bottom

              XBottomBar(
                child: Row(
                  children: [
                    FutureBuilder<Object>(
                        future: _dataServiceWeekDetails.getWeatherWeek(),
                        builder: (BuildContext context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const Center(
                                child: Text('Подключение отсутствует'),
                              );
                            case ConnectionState.waiting:
                              return const CircularProgressIndicator();
                            case ConnectionState.done:
                              return SizedBox(
                                height: 150,
                                width: 380,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: _responseWeekDetails?.listW?.length,
                                  itemBuilder: (BuildContext context, index) =>
                                      XWeatherCapsuli(time: '${_responseWeekDetails?.listW?[index].dtTxt?.substring(11, 16)}', weatherIcon: '${_responseWeekDetails?.listW?[index].weather?[0].icon}', temperature: '${_responseWeekDetails?.listW?[index].main?.temp?.round()}'),
                                ),
                              );
                            default:
                              return const Center();
                          }
                        }),
                  ],
                )
              ),
            ],
          )),
    );
  }
}
