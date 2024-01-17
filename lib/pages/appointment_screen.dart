import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/push_routes.dart';
import '../constants/routes.dart';
import '../constants/user_data.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/appointment_card.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/show_error_dialog.dart';

enum FilterStatus { upcoming, completed, canceled }

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final String _name = FirebaseAuth.instance.currentUser!.email.toString();
  List? _appointments = [];
  List<String> filters = ['upcoming', 'completed', 'canceled'];
  int index = 0;
  FilterStatus status = FilterStatus.upcoming;
  String statusString = 'upcoming';
  List filteredAppointments = [];

  void setFilteredAppointments() {
    try {
      filteredAppointments = filterAppointments(_appointments!, statusString)!;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<List<Map<String, dynamic>>?> getAppointmentsData(String name) async {
    List<DocumentSnapshot> appointmentSnapshots = await getAppointments(name);

    List<Map<String, dynamic>> appointmentsData =
        appointmentSnapshots.map((snapshot) {
      return snapshot.data() as Map<String, dynamic>;
    }).toList();
    return appointmentsData;
  }

  List? filterAppointments(List appointments, String status) {
    if (appointments.isNotEmpty) {
      List filteredAppointments = appointments.where((appointments) {
        return appointments['status'] == status;
      }).toList();
      return filteredAppointments;
    }
    return null;
  }

  Future<void> setUserAppointments() async {
    List? appointments = await getAppointmentsData(_name);
    setState(() {
      _appointments = appointments;
    });
  }

  @override
  void initState() {
    setUserAppointments();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setFilteredAppointments();
    return _appointments!.isNotEmpty
        ? Scaffold(
            appBar: appbarWidget('Appointments'),
            drawer: drawerWidget(context),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Appointment Schedule',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SegmentedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)){
                              return Colors.green;
                            }
                            return Colors.transparent;
                          },
                        ),
                      ),
                      segments: const [
                        ButtonSegment(
                            value: FilterStatus.upcoming,
                            label: Text('Upcoming')),
                        ButtonSegment(
                            value: FilterStatus.completed,
                            label: Text('Completed')),
                        ButtonSegment(
                            value: FilterStatus.canceled,
                            label: Text('Canceled')),
                      ],
                      selected: <FilterStatus>{status},
                      onSelectionChanged: (Set<FilterStatus> newSelection) {
                        setState(() {
                          status = newSelection.first;
                          if (status == FilterStatus.upcoming) {
                            statusString = 'upcoming';
                          } else if (status == FilterStatus.completed) {
                            statusString = 'completed';
                          } else if (status == FilterStatus.canceled) {
                            statusString = 'canceled';
                          }
                          try {
                            filteredAppointments = filterAppointments(
                                _appointments!, statusString)!;
                          } catch (e) {
                            showErrorDialog(
                                context, "You don't have any appointments");
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    filteredAppointments.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: _appointments!.length,
                              itemBuilder: (context, index) {
                                try {
                                  var schedule = filteredAppointments[index];
                                  bool isLastElement =
                                      filteredAppointments.length + 1 == index;
                                  return Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      side:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: !isLastElement
                                        ? const EdgeInsets.only(bottom: 20)
                                        : EdgeInsets.zero,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                backgroundImage: AssetImage(
                                                  'assets/user.jpg',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Dr. ${schedule['pharmacist']}',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    schedule['pharmacy'],
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          ScheduleCard(
                                            date: schedule['date'],
                                            time: schedule['time'],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: OutlinedButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .lightBlueAccent,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.lightBlueAccent,
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'Reschedule',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } on RangeError {
                                  return const SizedBox();
                                } catch (e) {
                                  return const Center(
                                    child: SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                              },
                            ),
                          )
                        : const SizedBox(
                            height: 5,
                            width: 5,
                          ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: appbarWidget('Appointments'),
            body: Center(
              child: SizedBox(
                width: 500,
                height: 200,
                child: Column(
                  children: [
                    const Text(
                      "You don't have any appointments yet",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pushRoute(context, searchRoute);
                      },
                      style: ElevatedButton.styleFrom(elevation: 0),
                      child: const Text('Find Pharmacists'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
