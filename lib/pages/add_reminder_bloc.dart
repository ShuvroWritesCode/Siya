import 'package:rxdart/rxdart.dart';
import 'package:siya/model/errors.dart';
import 'package:siya/model/medicine_type.dart';

class AddReminderBloc{
  BehaviorSubject<MedicineType>? _selectedMedicineType$;
  ValueStream<MedicineType>? get selectedMedicineType =>
      _selectedMedicineType$!.stream;

  BehaviorSubject<int>? _selectedInterval$;
  BehaviorSubject<int>? get selectIntervals => _selectedInterval$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay$ => _selectedTimeOfDay$;

  BehaviorSubject<EntryError>? _errorState$;
  BehaviorSubject<EntryError>? get errorState$ => _errorState$;

  AddReminderBloc(){
    _selectedMedicineType$ =
        BehaviorSubject<MedicineType>.seeded(MedicineType.None);

    _selectedTimeOfDay$ = BehaviorSubject<String>.seeded('none');

    _selectedInterval$ = BehaviorSubject<int>.seeded(0);
  }

  void dispose(){
    _selectedMedicineType$!.close();
    _selectedTimeOfDay$!.close();
    _selectedInterval$!.close();
    _errorState$!.close();
  }

  void updateInterval(int interval){
    _selectedInterval$!.add(interval);
  }

  void updateTime(String time){
    _selectedTimeOfDay$!.add(time);
  }

  void updateSelectedMedicine(MedicineType medicine){
    MedicineType _tempType = _selectedMedicineType$!.value;
    if(medicine == _tempType){
      _selectedMedicineType$!.add(MedicineType.None);
    }else{
      _selectedMedicineType$!.add(medicine);
    }
  }

  void submitError(EntryError error) {
    _errorState$!.add(error);
  }
}