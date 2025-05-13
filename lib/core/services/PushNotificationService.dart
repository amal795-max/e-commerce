import 'package:dio/dio.dart';
import 'package:e_commerce/controller/cubit/api/endPoints.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationsHelper {
  MyServices myServices =Get.find();
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    String? deviceToken = await _firebaseMessaging.getToken();
    print("===================Device FirebaseMessaging Token====================");
    print(deviceToken);
    myServices.saveData(key: ApiKeys.fcmToken, value: deviceToken);
    }

  void handleMessages(RemoteMessage? message) {
    if (message != null) {
      // navigatorKey.currentState?.pushNamed(NotificationsScreen.routeName, arguments: message);
      // showToast(
      //     text: 'on Background Message notification',
      //     state: ToastStates.SUCCESS);
    }
  }

  void handleBackgroundNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then((handleMessages));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "notifications-dd482",
      "private_key_id": "bf825fcb77226996d406164899f93bf12ce15091",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCbpW4P1JU7IV26\n6X9sa/deqZ2Hd0V6BZIVWznXrTdwoQQQO9oUykF/2Fe/KM3MBq9vKqkSwRIzvlKF\n3vA9qdqurZHN79HtumFUHhMPgB8kr476Fi2vh4k9zI9zvb9MX1tOJ8yPhsOSttMo\nT0uVTiN5btcpkuFNup6zijShADMgoTwQWguDW+3w1orMkbY7wEefdT9Cmpy/HPvZ\nHOrbwuCt6QY45/+wz1q+LpXNPrDvzwPSV2U1WXx+goaSQsf8p0ZsLBXJOTusB899\n46q0qeqeR+oISFV9pIHZ2zqk+psR1Dh9hbuqJdGeDOkvn4s7t7+siokK8MdMu7Wz\nLijRjzurAgMBAAECggEAANyP/efnJwx+qEavPmMR169fbiVgZ2jMIYRdJrw+uMHc\nhoz4uhAifd5wVTrbyRVguomJO20q3c28asLIhrEyC9hGKpFtgNqWkKTEtpiZO+dc\naw8SO1DjNKqH9kMfsoatEKyK6Oa6MBCiyOr5+Wq8jS4jd+veYjFvaWITSm2SG93O\nhsG+LNCMJGyoidakwknS5FpD7g9k4x+lKwmeX0sejKvDNKUSp7gPz8f3g5yFlLHF\nFxzfUyL6/Fqe31ZZJ7q+b7UkJ1EDyKtiXH7LyFjpaZlACyCL17xkl70H5GcdXsXN\npmBRllaAHThwFIQJJ7PIwWH42/NxpNhUPaqm51gkSQKBgQDWLAIISCP+1FBxVpZY\n3A3KZ0t9N4xrTyIH/Y28Q9MB3M72ROX8106OwX7w8F77X0LlxBLc+Dy/1AqbH0Yv\nR4tSbaYIGZKe+dqMsSXByMWmTo84JDEzVOYsojNz0+bFZRfHUjcoS8cN7bvY8a0V\nEh1u2aeJcKw0RMC85HxY/eJpUwKBgQC6C01UQXS3jUGrolJFtLnhQwGXNn8s1Sk6\nfw47uKR67aEjYuviwL5zWLyVMi4XulX/gG7g2neUIBwRCshxLbrtGiGORx7Nqgek\ntknMtofmzZcQhVDJOv7AQYYGLD1MUpvCVz+vR1B6h196+MI8dfzwL9pEeGpTZKXu\nvbnApvahSQKBgF+FtUpYUqWfsFk8k0YCr6vsskCg++IIo1cJAaRMY9paz3wLcsB4\njzMgnit8KgDXlhDAiOFBXmb4fdp98mG3+S3Edd76+Ogq7A0AHaT2lSD9vOb/TWpl\nnVue5G/uvOihlB90TeGNGrTdqYCzGc1iDPqZ3R1xwXx2hbg5+DQA2HC9AoGAWYvH\nFJ7Mxuw+h5YBc3uhXEMcKOQaIkIXLgipmSUuRdzKinW6g9Gx2WMEoesdNF6Dtg7j\nT2bX13v9BlbiU1dneWfybsDcmrEULLtwmg/hKb4az+DbGYBDzdW75Iy2lF3OiqPk\nC0GQAunVkyLYmrFPpWvi6sHqq2juVRMMrSWv38ECgYB0HiOPB8vcJ7xaTtNvWZQz\nS1iV8j6W38yj1zx+/dqDIP2OW931SK3GunkLZq3aagTEh+95usjy+mCX3veHCTbV\nHrd1lXOYr/ifU/NFqZP892hQnWMHM2MGweMQHhsP5fT+aJVLfLLSStDbLi4myNw8\ncq2g1MOOFkvlfSVWN9Y2eg==\n-----END PRIVATE KEY-----\n",
      "client_email": "firebase-adminsdk-pfjc8@notifications-dd482.iam.gserviceaccount.com",
      "client_id": "110234049781646630753",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-pfjc8%40notifications-dd482.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };


    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes, client);

      client.close();
      print("Access Token: ${credentials.accessToken.data}");
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  Map<String, dynamic> getBody({
    required String title,
    required String body,
    String? type,
  }) {
    return {
      "message": {
        "token": myServices.getData(key: ApiKeys.fcmToken),
        "notification": {"title": title, "body": body},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default"
          }
        },
      }
    };
  }

  Future<void> sendNotifications({
    required String title,
    required String body,
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();

      const String urlEndPoint = "https://fcm.googleapis.com/v1/projects/notifications-dd482/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(urlEndPoint, data: getBody(title: title, body: body, type: type ?? "message",),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}