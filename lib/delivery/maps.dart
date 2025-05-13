import 'dart:convert';
import 'package:e_commerce/Core/constants/approutes.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/controller/cubit/showuser_cubit.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../Core/constants/appcolor.dart';
import '../controller/cubit/Allorder.dart';
import '../controller/cubit/UserState.dart';
import '../core/services/PushNotificationService.dart';
import '../view/widget/CustomButton.dart';

class DeliverOrderScreen extends StatefulWidget {
  const DeliverOrderScreen({Key? key}) : super(key: key);

  @override
  State<DeliverOrderScreen> createState() => _DeliverOrderScreenState();
}

class _DeliverOrderScreenState extends State<DeliverOrderScreen> {
  MyServices myServices =Get.find();
  LatLng? currentLocation;
  final MapController _mapController = MapController();

  LatLng? startPoint;
  LatLng endPoint = LatLng(0, 0);
  List<LatLng> polylinePoints = [];

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    endPoint = LatLng(myServices.getData(key: ApiKeys.latitude), myServices.getData(key:ApiKeys.longitude));
  }

  Future<void> _fetchRoute() async {
    if (startPoint == null) return;
    final apiUrl = 'https://router.project-osrm.org/route/v1/driving/'
        '${startPoint!.longitude},${startPoint!.latitude};''${endPoint.longitude},${endPoint.latitude}?geometries=geojson';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // استخراج النقاط
      final coordinates = data['routes'][0]['geometry']['coordinates'];
      final points = coordinates.map<LatLng>((point) => LatLng(point[1], point[0])).toList();

      setState(() {
        polylinePoints = points;
      });
    } else {
      print('Error fetching route: ${response.statusCode}');
    }
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
   Get.rawSnackbar(message: 'يرجى تفعيل خدمات الموقع');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
       Get.rawSnackbar(message: 'تم رفض إذن الوصول للموقع');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.rawSnackbar(message:'إعدادات الموقع مرفوضة دائمًا.');

      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      startPoint = currentLocation;
      _fetchRoute();
    });
  }

  @override
  Widget build(BuildContext context) {
    final id=Get.arguments;
    var size = MediaQuery.of(context).size;
    NotificationsHelper notificationsHelper = NotificationsHelper();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: size.height / 1.4,
                child: currentLocation == null
                    ?  Center(child: CircularProgressIndicator(color:AppColor.orange ,))
                    : FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: currentLocation ?? const LatLng(33.5019, 36.2765), // Default to a location if _currentLocation is null
                    initialZoom: 18,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: startPoint ?? const LatLng(33.5019, 36.2765),
                          child:  const Icon(Icons.location_on, color: Colors.green, size: 40,),
                        ),
                        Marker(
                          point: endPoint,
                         child:  const Icon(Icons.location_on, color: Colors.red, size: 40,),
                        ),
                      ],
                    ),
                    if (polylinePoints.isNotEmpty)
                      PolylineLayer(
                        polylines: [
                          Polyline(points: polylinePoints, strokeWidth: 4.0, color: Colors.blue,),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<ShowUserCubit,UserState>(
          builder: (context,state) {
            return state is ShowUserByIdSuccess? SizedBox(
            child: Column(
              children: [
                const SizedBox(height: 15),
                ListTile(
                  title:  Text( state.first_name+" "+state.last_name),
                  leading: CircleAvatar(
                    backgroundColor: AppColor.lightGrey,
                    backgroundImage: NetworkImage(state.image),
                  ),
                  subtitle: Text("0${state.phone_number}"),
                  trailing: InkWell(
                    onTap: (){
                      FlutterPhoneDirectCaller.callNumber("0${state.phone_number}");
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                      child: Icon(Icons.phone, color: AppColor.white,),
                    ),
                  ),
                ),
                 ListTile(
                  title: const Text("Deliver Address"),
                  subtitle: Text(state.location),
                   leading: Icon(Icons.location_on_outlined),
                ),
                const SizedBox(height: 5),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     CustomButton(text: "Start Route",onPressed: (){
            Get.rawSnackbar(message:"The Order is being delivered now");
            notificationsHelper.sendNotifications(
                title: "عزيزي ${state.first_name + " " + state.last_name}",
                body: "طلبك رقم ${id} قيد التوصيل الآن",);


            },)
                      ,CustomButton(text: "End Route",onPressed: (){
                        Get.rawSnackbar(message:"The Order has been delivered");
                        context.read<AllOrderCubit>().orderState(id,"delivered");
                       notificationsHelper.sendNotifications(
                         title: "عزيزي ${state.first_name+" "+state.last_name}",
                         body: "تم توصيل طلبك بنجاح. شكراً لك على ثقتك بنا",
                       );
                          Get.offAllNamed(AppRoutes.dashboard);

                     },)
                  ],
                ),
              ],
            ),
    ):const SizedBox();})],
      ),
      floatingActionButton: Padding(padding:  EdgeInsets.only(bottom: size.height/3.5),
        child: FloatingActionButton(
          onPressed: () {
            if (currentLocation != null) {
              _mapController.move(currentLocation!, 15);
            }
          },
          backgroundColor: Colors.orange,
          child: const Icon(Icons.my_location, color: Colors.white),
        ),
      ),
    );
  }
}
