import 'package:siya/constants.dart';
import 'package:siya/global_bloc.dart';
import 'package:siya/model/medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:siya/pages/reminder_page.dart';
// import 'package:sizer/sizer.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails(this.medicine, {Key? key}) : super(key: key);
  final Medicine medicine;


  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}



class _MedicineDetailsState extends State<MedicineDetails> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.02*h),
        child: Column(
          children: [
            MainSection(medicine: widget.medicine),
            ExtendedSection(medicine: widget.medicine),
            Spacer(),
            SizedBox(
              width: w,
              height: 0.07*h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  //open alert dialog box,+global bloc, later
                  //cool its working
                  openAlertBox(context, _globalBloc);
                },
                child: Text(
                  'Delete',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: kScaffoldColor),
                ),
              ),
            ),
            SizedBox(
              height: 0.02*h,
            ),
          ],
        ),
      ),
    );
  }
  //lets delete a medicine from memory

  openAlertBox(BuildContext context, GlobalBloc _globalBloc) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kScaffoldColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 0.01*h),
          title: Text(
            'Delete This Reminder?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.red
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () {
                //global block to delete medicine,later
                _globalBloc.removeMedicine(widget.medicine);
                Navigator.of(context).pop();
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ReminderPage()),
                // );
                // Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text(
                'OK',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: kSecondaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({Key? key, this.medicine}) : super(key: key);
  final Medicine? medicine;

  Hero makeIcon(double size) {
    const double iconSize = 28.0;
    if (medicine!.medicineType == 'Bottle') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/bottle.svg',
          color: kOtherColor,
          height: iconSize,
        ),
      );
    } else if (medicine!.medicineType == 'Pill') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/pill.svg',
          color: kOtherColor,
          height: iconSize,
        ),
      );
    } else if (medicine!.medicineType == 'Syringe') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/syringe.svg',
          color: kOtherColor,
          height: iconSize,
        ),
      );
    } else if (medicine!.medicineType == 'Tablet') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/tablet.svg',
          color: kOtherColor,
          height: iconSize,
        ),
      );
    }
    //in case of no medicine type icon selection
    return Hero(
      tag: medicine!.medicineName! + medicine!.medicineType!,
      child: Icon(
        Icons.error,
        color: kOtherColor,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //lets try another one
        //okz same here, the same problem, later i will solve that
        makeIcon(0.07*h),
        SizedBox(
          width: 0.02*w,
        ),
        Column(
          children: [
            Hero(
              tag: medicine!.medicineName!,
              child: Material(
                color: Colors.transparent,
                child: MainInfoTab(
                    fieldTitle: 'Medicine Name',
                    fieldInfo: medicine!.medicineName!),
              ),
            ),
            MainInfoTab(
                fieldTitle: 'Dosage',
                fieldInfo: medicine!.dosage == 0
                    ? 'Not Specified'
                    : "${medicine!.dosage} mg"),
          ],
        )
      ],
    );
  }
}

class MainInfoTab extends StatelessWidget {
  const MainInfoTab(
      {Key? key, required this.fieldTitle, required this.fieldInfo})
      : super(key: key);
  final String fieldTitle;
  final String fieldInfo;
  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    return SizedBox(
      width: 0.40*w,
      height: 0.1*h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 0.03*h,
            ),
            Text(
              fieldInfo,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({Key? key, this.medicine}) : super(key: key);
  final Medicine? medicine;
  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: [
        ExtendedInfoTab(
          fieldTitle: 'Medicine Type ',
          fieldInfo: medicine!.medicineType! == 'None'
              ? 'Not Specified'
              : medicine!.medicineType!,
        ),
        ExtendedInfoTab(
          fieldTitle: 'Dose Interval',
          fieldInfo:
          'Every ${medicine!.interval} hours   | ${medicine!.interval == 24 ? "One time a day" : "${(24 / medicine!.interval!).floor()} times a day"}',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Start Time',
          fieldInfo:
          '${medicine!.startTime![0]}${medicine!.startTime![1]}:${medicine!.startTime![2]}${medicine!.startTime![3]}',
        ),
      ],
    );
  }
}

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab(
      {Key? key, required this.fieldTitle, required this.fieldInfo})
      : super(key: key);
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.02*h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.01*h),
            child: Text(
              fieldTitle,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: kTextColor,
              ),
            ),
          ),
          Text(
            fieldInfo,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}