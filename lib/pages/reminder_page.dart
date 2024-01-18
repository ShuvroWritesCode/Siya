
import 'package:siya/constants.dart';
import 'package:siya/constants/push_routes.dart';
import 'package:siya/constants/routes.dart';
import 'package:siya/global_bloc.dart';
import 'package:siya/model/medicine.dart';
import 'package:siya/pages/medicine_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});
  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: const Text('Reminder'),
      ),
        body: Center(
          child: Column(
            children: [
              TopContainer(),
              SizedBox(height: 0.02*h),
              Flexible(
                child: BottomContainer(),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 55* MediaQuery.textScaleFactorOf(context),
          width: 55* MediaQuery.textScaleFactorOf(context),
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                pushReplacementRoute(context, addreminderRoute);
              },
              // foregroundColor: kPrimaryColor,
              backgroundColor: kGreenSecondaryColor,
              child: Icon(Icons.add,color: kScaffoldColor,
              size: 30* MediaQuery.textScaleFactorOf(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Column(
      children: [
        // Container(
        //   alignment: Alignment.topLeft,
        //   padding: EdgeInsets.only(bottom: 0.01*h),
        //   child: Text(
        //     'Worry less \nLive Healthier',
        //     textAlign: TextAlign.start,
        //     style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        //       color: Colors.green[700]
        //     ),
        //   ),
        // ),
        // Container(
        //   alignment: Alignment.topLeft,
        //   padding: EdgeInsets.only(bottom: 0.01*h),
        //   child: Text(
        //     'Welcome to Siya',
        //     style: Theme.of(context).textTheme.displayMedium,
        //   ),
        // ),
        SizedBox(
          height: 100,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 60),
          child: Text(
            'Current number of reminders:',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        StreamBuilder<List<Medicine>>(
            stream: globalBloc.medicineList$,
            builder: (context, snapshot) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 0),
                child: Text(
                  !snapshot.hasData ? '0' : snapshot.data!.length.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text(
    //     'No Upcoming Medicine',
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context).textTheme.headlineLarge,
    //   ),
    // );
    double h =MediaQuery.of(context).size.height;
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    return StreamBuilder(
      stream: globalBloc.medicineList$,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //if no data is saved
          return Container();
        } else if (snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No Medicine',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.green.shade200,
              ),
            ),
          );
        } else {
          return GridView.builder(
            padding: EdgeInsets.only(top: 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MedicineCard(medicine: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}


class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;
  //for getting the current details of the saved items

  //first we need to get the medicine type icon
  //lets make a function

  Hero makeIcon(double size) {
    //here is the bug, the capital word of the first letter
    //lets fix
    const double iconSize = 28.0;
    if (medicine.medicineType == 'Bottle') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/bottle.svg',
          color: kGreenSecondaryColor,
          height: iconSize,
        ),
      );
    } else if (medicine.medicineType == 'Pill') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/pill.svg',
          color: kGreenSecondaryColor,
          height: iconSize,
        ),
      );
    } else if (medicine.medicineType == 'Syringe') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/syringe.svg',
          color: kGreenSecondaryColor,
          height: iconSize,
        ),
      );
    } else if (medicine.medicineType == 'Tablet') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/tablet.svg',
          color: kGreenSecondaryColor,
          height: iconSize,
        ),
      );
    }
    //in case of no medicine type icon selection
    return Hero(
      tag: medicine.medicineName! + medicine.medicineType!,
      child: Icon(
        Icons.error,
        color: kGreenSecondaryColor,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w =MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        //go to details activity with animation, later

        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, Widget? child) {
                  return Opacity(
                    opacity: animation.value,
                    child: MedicineDetails(medicine),
                  );
                },
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 0.02*w, right: 0.02*w, top: 0.01*h, bottom: 0.01*h),
        margin: EdgeInsets.all(0.01*h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.02*h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            //call the function here icon type
            //later we will the icon issue
            makeIcon(0.07*h),
            const Spacer(),
            //hero tag animation, later
            Hero(
              tag: medicine.medicineName!,
              child: Text(
                medicine.medicineName!,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SizedBox(
              height: 0.03*h,
            ),
            //time interval data with condition, later
            Text(
              medicine.interval == 1
                  ? "Every ${medicine.interval} hour"
                  : "Every ${medicine.interval} hour",
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}