import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_injaz_task/home/controller/request_provider.dart';
import 'package:flutter_injaz_task/home/home_customer_screen.dart';
import 'package:flutter_injaz_task/home/widget/date_time_picker.dart';
import 'package:flutter_injaz_task/home/widget/first_screen.dart';
import 'package:flutter_injaz_task/widgets/custom_text.dart';
import 'package:flutter_injaz_task/widgets/custom_text_form_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddingRequest extends StatefulWidget {
  static const String routeName = "adding_request";
  @override
  _AddingRequestState createState() => _AddingRequestState();
}

class _AddingRequestState extends State<AddingRequest> {
  double latitudeData;
  double longitudeData;
  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String name, companyName, zip, address, status;
  File _image;
  final picker = ImagePicker();
  DateTime _date;
  TimeOfDay _time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final start = DateTime.now();
    _date = DateTime(start.year, start.month, start.day);
    _time = TimeOfDay.fromDateTime(start);
    getCurrentLocation();
  }

  getCurrentLocation() async {
    Position geoPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitudeData = geoPosition.latitude;
      longitudeData = geoPosition.longitude;
    });
  }

  Future<File> getImages() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(latitudeData);
    print(longitudeData);
    return Scaffold(
      key: _keyScaffold,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 40, right: 20, left: 20),
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              CustomText(
                title: 'Adding Request',
                fontSize: 25,
                color: Colors.green,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFrom(
                hintText: 'name',
                text: 'name',
                validator: (value) {
                  if (value.isEmpty || value.length < 3) {
                    return "Please Enter your Name or Name greater then 3 ";
                  }
                },
                save: (value) {
                  name = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextFrom(
                hintText: 'companyName',
                text: 'companyName',
                validator: (value) {
                  if (value.isEmpty || value.length < 3) {
                    return "Please Enter your Name or Name greater then 3 ";
                  }
                },
                save: (value) {
                  companyName = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextFrom(
                hintText: 'zip',
                text: 'zip',
                validator: (value) {
                  if (value.isEmpty || value.length < 3) {
                    return "Please Enter zip or zip greater then 3";
                  }
                },
                save: (value) {
                  zip = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextFrom(
                hintText: 'address',
                text: 'address',
                validator: (value) {
                  if (value.isEmpty || value.length < 6) {
                    return "Please enter address or address greater then 6";
                  }
                },
                save: (value) {
                  address = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _image == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1569913486515-b74bf7751574?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80",
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              FlatButton(
                onPressed: () {
                  getImages();
                },
                child: Text('Add Images'),
              ),
              SizedBox(
                height: 20,
              ),
              DateTimePicker(
                labelText: 'dateAndTime',
                selectedDate: _date,
                selectedTime: _time,
                onSelectedDate: (date) => setState(() => _date = date),
                onSelectedTime: (time) => setState(() => _time = time),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FlatButton(
                  onPressed: () {
                    if (_keyForm.currentState.validate()) {
                      _keyForm.currentState.save();
                      if (_date == null ||
                          latitudeData == null ||
                          longitudeData == null) {
                        _keyScaffold.currentState.showSnackBar(SnackBar(
                            content: Text('please complete all data')));
                      }
                      Provider.of<RequestProvider>(context, listen: false).addingRequest(
                        name,
                        address,
                        zip,
                        companyName,
                        _date,
                        latitudeData,
                        longitudeData,
                        _image,
                      );
                      Navigator.of(context).pushReplacementNamed(HomeCustomerScreen.routeName);
                    }
                  },
                  child: Text('Save'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
