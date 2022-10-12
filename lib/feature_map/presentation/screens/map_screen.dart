import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/constants.dart';
import 'package:flutter_template/core/utils/dart_utils.dart';
import 'package:flutter_template/core/utils/dialog_utils.dart';
import 'package:flutter_template/core/utils/search_delay_on_change.dart';
import 'package:flutter_template/core/widgets/main_button_widget.dart';
import 'package:flutter_template/core/widgets/main_text_field_widget.dart';
import 'package:flutter_template/feature_map/presentation/bloc/map_bloc.dart';
import 'package:flutter_template/feature_map/utils/tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

const originIndex = 0;
const destinationIndex = 1;

class MapScreen extends StatefulWidget {
  final String pinPurpleIconSvg;
  final Color primaryColor;
  final VoidCallback onGetOffAll;
  final Function() funNavigation;

  const MapScreen({
    Key? key,
    required this.primaryColor,
    required this.pinPurpleIconSvg,
    required this.onGetOffAll,
    required this.funNavigation,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late final MapController _mapController;

  final _mapSearchSearchDelayOnChange = SearchDelayOnChange();

  final _searchDelayOnChange = SearchDelayOnChange();

  late final StreamSubscription<MapEvent> subscription;

  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController addressFilterSearchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final int interactiveFlags =
      InteractiveFlag.drag | InteractiveFlag.flingAnimation | InteractiveFlag.pinchMove | InteractiveFlag.pinchZoom | InteractiveFlag.doubleTapZoom;

  @override
  void initState() {
    _mapController = MapController();
    _moveToCurrentLocation();

    subscription = _mapController.mapEventStream.listen(onMapEvent);
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void onMapEvent(MapEvent mapEvent) {
    if (mapEvent is MapEventMoveStart) {
      BlocProvider.of<MapBloc>(context).add(
        LoadingEvent(),
      );
    }
    if (mapEvent is MapEventMoveEnd) {
      _mapSearchSearchDelayOnChange.run(() {
        getFastReverse(
          lat: mapEvent.center.latitude,
          lon: mapEvent.center.longitude,
        );
        final MapBloc mapBloc = BlocProvider.of<MapBloc>(context);
        mapBloc.userLocation?.let((it) {
          mapBloc.add(
            GetDirectionsEvent(
              origin: LatLng(
                it.latitude,
                it.longitude,
              ),
              destination: LatLng(
                mapEvent.center.latitude,
                mapEvent.center.longitude,
              ),
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              child: Stack(
                children: [
                  BlocBuilder<MapBloc, MapState>(
                    buildWhen: (previousState, currentState) {
                      if (currentState is MapInitial || currentState is GetDirectionsState) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      return FlutterMap(
                        mapController: _mapController,
                        options: MapOptions(
                          bounds: LatLngBounds(LatLng(35.715090, 51.667227), LatLng(35.718269, 51.171029)),
                          boundsOptions: const FitBoundsOptions(padding: EdgeInsets.all(16.0)),
                          // center: LatLng(35.6892, 51.3890),
                          // zoom: 15,
                          interactiveFlags: interactiveFlags,
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                'https://api.mapbox.com/styles/v1/sepidehtadayon/ckytn288a000814llavgwz2ys/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2VwaWRlaHRhZGF5b24iLCJhIjoiY2t5dG16Yzh1MGdhdTJ4bzhqa2N5aXhuZCJ9.RF8Hc0pbIBQygcPtSkXVOA',
                            subdomains: ['a', 'b', 'c'],
                            tileProvider: CachedTileProvider(),
                          ),
                          if (state is GetDirectionsState)
                            PolylineLayerOptions(
                              polylines: [
                                Polyline(
                                  points: state.routingPoints,
                                  strokeWidth: 8,
                                  color: Theme.of(context).primaryColor,
                                )
                              ],
                            ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    top: 24,
                    right: 24,
                    left: 24,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 44,
                                height: 44,
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                DialogUtils.closeFlowDialog(
                                  message: 'آیا از لغو فرآیند اطمینان دارید؟\n در این صورت لازم است کلیه مراحل را مجدداً طی نمایید.',
                                  primaryColorButton: widget.primaryColor,
                                  onGetOffAll: widget.onGetOffAll,
                                );
                              },
                              child: Container(
                                width: 44,
                                height: 44,
                                color: Colors.transparent,
                                child: Icon(
                                  Icons.close,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<MapBloc, MapState>(
                          buildWhen: (previousState, currentState) {
                            if (currentState is MapInitial || currentState is SetAddressState || currentState is SearchLoadingState) {
                              return true;
                            }
                            return false;
                          },
                          builder: (context, state) {
                            if (state is SetAddressState) {
                              searchTextController.text = state.address;
                              return InkWell(
                                onTap: () {
                                  showVehiclesWopBottomSheet(context);
                                },
                                child: TextField(
                                  enabled: false,
                                  controller: searchTextController,
                                  decoration: InputDecoration(
                                    labelText: 'موقعیت مکانی را انتخاب کنید',
                                    contentPadding: const EdgeInsets.all(20),
                                    prefixIcon: const Icon(Icons.search),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                                    ),
                                    disabledBorder: searchTextController.value.text.isEmpty
                                        ? null
                                        : OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Theme.of(context).backgroundColor),
                                          ),
                                  ),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    right: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: _moveToCurrentLocation,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).backgroundColor,
                                  blurRadius: 6,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            child: BlocBuilder<MapBloc, MapState>(
                              buildWhen: (previousState, currentState) {
                                if (currentState is MapInitial || currentState is GotUserLocationState) {
                                  return true;
                                }
                                return false;
                              },
                              builder: (context, state) {
                                if (state is GotUserLocationState) {
                                  if (state.isGettingUserLocation == false) {
                                    return Icon(
                                      Icons.my_location,
                                      color: Theme.of(context).primaryColor,
                                    );
                                  } else {
                                    return const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<MapBloc, MapState>(
                          buildWhen: (previousState, currentState) {
                            if (currentState is MapInitial || currentState is SetAddressState || currentState is SearchLoadingState) {
                              return true;
                            }
                            return false;
                          },
                          builder: (context, state) {
                            if (state is SetAddressState) {
                              return MainButtonWidget(
                                isEnabled: true,
                                primaryColor: widget.primaryColor,
                                onTap: () {
                                  widget.funNavigation();
                                },
                              );
                            }
                            if (state is SearchLoadingState) {
                              return Container();
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 45),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        widget.pinPurpleIconSvg,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showVehiclesWopBottomSheet(BuildContext context) {
    DialogUtils.showMainSearchBottomSheet(
      context,
      title: 'جست و جو',
      child: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: MainTextField(
            labelText: null,
            textController: addressFilterSearchController,
            focusNode: null,
            isEmpty: addressFilterSearchController.value.text.isEmpty,
            onChanged: (text) {
              _searchDelayOnChange.run(() {
                BlocProvider.of<MapBloc>(context).add(
                  GetAddressFilterEvent(
                    lat: _mapController.center.latitude,
                    lon: _mapController.center.longitude,
                    text: text,
                  ),
                );
              });
            },
            onIconTap: () {},
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<MapBloc, MapState>(
          buildWhen: (previousState, currentState) {
            if (currentState is MapInitial || currentState is GetAddressFilterListState || currentState is SearchLoadingState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is SearchLoadingState) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is GetAddressFilterListState) {
              return Expanded(
                child: ListView.builder(
                  physics: Constants.mainScrollPhysics,
                  itemCount: state.itemSearchEntityList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        searchTextController.text = state.itemSearchEntityList[index].address;
                        state.itemSearchEntityList.let((it) {
                          setUserLocation(
                            userLocation: LatLng(
                              it[index].location.latitude,
                              it[index].location.longitude,
                            ),
                          );
                          getFastReverse(
                            lat: it[index].location.latitude,
                            lon: it[index].location.longitude,
                          );
                          _animatedMapMove(
                            destLocation: LatLng(
                              it[index].location.latitude,
                              it[index].location.longitude,
                            ),
                          );
                        });
                        Navigator.pop(context);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                            child: Text(
                              state.itemSearchEntityList[index].address,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }

  void _animatedMapMove({required LatLng destLocation, double destZoom = 15}) {
    final latTween = Tween<double>(begin: _mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(begin: _mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: _mapController.zoom, end: destZoom);
    final controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      _mapController.move(
        LatLng(
          latTween.evaluate(animation),
          lngTween.evaluate(animation),
        ),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  Future<void> _moveToCurrentLocation() async {
    final Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    final MapBloc mapBloc = BlocProvider.of<MapBloc>(context);
    mapBloc.add(
      LoadingEvent(),
    );
    mapBloc.add(
      GettingUserLocationEvent(
        isGettingUserLocation: true,
      ),
    );
    try {
      final currentLocation = await location.getLocation();
      mapBloc.add(
        GettingUserLocationEvent(
          isGettingUserLocation: false,
        ),
      );
      setUserLocation(
        userLocation: LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        ),
      );
      _animatedMapMove(
        destLocation: LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        ),
      );
      getFastReverse(
        lat: currentLocation.latitude!,
        lon: currentLocation.longitude!,
      );
    } catch (e) {
      // setIcon(Icons.gps_off);
    }
  }

  void setUserLocation({
    required LatLng userLocation,
  }) {
    BlocProvider.of<MapBloc>(context).add(
      SetUserLocationEvent(
        userLocation: userLocation,
      ),
    );
  }

  void getFastReverse({
    required double lat,
    required double lon,
  }) {
    BlocProvider.of<MapBloc>(context).add(
      GetFastReverseEvent(
        lat: lat,
        lon: lon,
      ),
    );
  }
}
