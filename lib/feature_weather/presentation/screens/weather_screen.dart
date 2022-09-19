import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/widgets/dot_loading_widget.dart';
import 'package:flutter_template/core/widgets/main_root_page_widget.dart';
import 'package:flutter_template/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_template/feature_weather/presentation/bloc/cw_status.dart';
import 'package:flutter_template/feature_weather/presentation/bloc/home_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = "Tehran";

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MainAppRootWidget(
      backgroundColor: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.cwStatus is CwLoading) {
                return const Expanded(child: DotLoadingWidget());
              }

              if (state.cwStatus is CwCompleted) {
                /// cast
                final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
                final CurrentCityEntity currentCityEntity = cwCompleted.currentCityEntity;

                return Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: SizedBox(
                          width: width,
                          height: 400,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  currentCityEntity.name,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  currentCityEntity.weather[0].description,
                                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "${currentCityEntity.main.temp.round()}\u00B0",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /// max temp
                                  Column(
                                    children: [
                                      const Text(
                                        "max",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${currentCityEntity.main.tempMax.round()}\u00B0",
                                      )
                                    ],
                                  ),

                                  /// divider
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10,
                                    ),
                                    child: Container(
                                      color: Colors.grey,
                                      width: 2,
                                      height: 40,
                                    ),
                                  ),

                                  /// min temp
                                  Column(
                                    children: [
                                      const Text(
                                        "min",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${currentCityEntity.main.tempMin.round()}\u00B0",
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state.cwStatus is CwError) {
                return const Center(
                  child: Text('error'),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
