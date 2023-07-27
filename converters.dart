import 'dart:io';

import 'UnitsClass/UnitEnum.dart';
import 'UnitsClass/UnitsClass.dart';

void main() {
  start();
}

void start() {
  final units = Units();
  var value = 0.0;
  var mode = '';
  UnitEnum fromUnit;
  UnitEnum toUnit;
  String? modeOption = '';
  String? fromOption = '';
  String? toOption = '';
  while (modeOption != 'exit') {
    printModeOptions();
    stdout.write("Enter Mode:");
    modeOption = takeInput();
    mode = setMode(modeOption);
    if (modeOption == 'exit') return;
    try {
      int.parse(modeOption ?? "");
    } catch (e) {
      print("!!!Enter Valid Option!!!");
      continue;
    }
    while (mode != 'back') {
      printUnitOptions(mode);
      stdout.write("Enter From Unit:");
      fromOption = takeInput();
      if (fromOption == 'back') {
        mode = 'back';
        break;
      } else if (fromOption == 'exit') {
        return;
      }
      try {
        int.parse(fromOption ?? "");
      } catch (e) {
        print("Enter Valid Option:");
        continue;
      }
      while (fromOption != 'back') {
        stdout.write("Enter To Unit:");
        toOption = takeInput();
        if (toOption == 'back') {
          fromOption = 'back';
          break;
        } else if (toOption == 'exit') {
          return;
        }
        try {
          int.parse(toOption ?? "");
        } catch (e) {
          print("Enter Valid Option:");
          continue;
        }
        fromOption = getUnit(fromOption, mode);
        toOption = getUnit(toOption, mode);
        fromUnit = units.getUnitEnumFromName(fromOption);
        toUnit = units.getUnitEnumFromName(toOption);
        while (value != 'back') {
          stdout.write("Enter Value:");
          var v = takeInput();
          if (v == 'back') {
            toOption = 'back';
            break;
          } else if (v == 'exit') {
            return;
          } else {
            try {
              value = double.parse(v ?? '0');
            } catch (e) {
              print(e.toString());
              continue;
            }
            print("Answer:");
            convert(value, fromUnit, toUnit);
            print("5 Seconds Till Next Conversion");
            for (int i = 5; i > 0; i--) {
              print("Wait $i Second${i == 1 ? "" : "s"}");
              sleep(Duration(seconds: 1));
            }
            break;
          }
        }
        if (toOption != 'back') break;
      }
      if (fromOption != 'back') break;
    }
  }
}

String getUnit(String? option, String mode) {
  switch (mode) {
    case "length":
      return getLengthUnit(option);
    case "weight":
      return getWeightUnit(option);
    case "temperature":
      return getTempratureUnit(option);
    case "volume":
      return getVolumeUnit(option);
    case "area":
      return getAreaUnit(option);
    case "speed":
      return getSpeedUnit(option);
    case "time":
      return getTimeUnit(option);
    case "energy":
      return getEnergyUnit(option);
  }
  return Units.area.acre.name;
}

String getLengthUnit(String? option) {
  switch (option) {
    case "1":
      return Units.length.meter.name;
    case "2":
      return Units.length.kilometer.name;
    case "3":
      return Units.length.centimeter.name;
    case "4":
      return Units.length.milimeter.name;
    case "5":
      return Units.length.inch.name;
    case "6":
      return Units.length.foot.name;
    case "7":
      return Units.length.yard.name;
    case "8":
      return Units.length.mile.name;
  }
  return Units.length.centimeter.name;
}

String getWeightUnit(String? option) {
  switch (option) {
    case "1":
      return Units.weight.killogram.name;
    case "2":
      return Units.weight.gram.name;
    case "3":
      return Units.weight.miligram.name;
    case "4":
      return Units.weight.pound.name;
    case "5":
      return Units.weight.ounce.name;
  }
  return Units.weight.gram.name;
}

String getTempratureUnit(String? option) {
  switch (option) {
    case "1":
      return Units.temperature.celsius.name;
    case "2":
      return Units.temperature.fahrenheit.name;
    case "3":
      return Units.temperature.kelvin.name;
  }
  return Units.temperature.celsius.name;
}

String getVolumeUnit(String? option) {
  switch (option) {
    case "1":
      return Units.volume.fluidOunce.name;
    case "2":
      return Units.volume.gallon.name;
    case "3":
      return Units.volume.quart.name;
    case "4":
      return Units.volume.pint.name;
    case "5":
      return Units.volume.cubicCentimeter.name;
    case "6":
      return Units.volume.cubicCentimeter.name;
    case "7":
      return Units.volume.milliliter.name;
    case "8":
      return Units.volume.liter.name;
  }
  return Units.volume.liter.name;
}

String getAreaUnit(String? option) {
  switch (option) {
    case "1":
      return Units.area.squareMeter.name;
    case "2":
      return Units.area.squareKilometer.name;
    case "3":
      return Units.area.squareCentimeter.name;
    case "4":
      return Units.area.squareInch.name;
    case "5":
      return Units.area.squareFoot.name;
    case "6":
      return Units.area.acre.name;
    case "7":
      return Units.area.hectare.name;
  }
  return Units.area.acre.name;
}

String getSpeedUnit(String? option) {
  switch (option) {
    case "1":
      return Units.speed.meterPerSecond.name;
    case "2":
      return Units.speed.kilometerPerHour.name;
    case "3":
      return Units.speed.milePerHour.name;
  }
  return Units.speed.kilometerPerHour.name;
}

String getTimeUnit(String? option) {
  switch (option) {
    case "1":
      return Units.time.second.name;
    case "2":
      return Units.time.minute.name;
    case "3":
      return Units.time.hour.name;
    case "4":
      return Units.time.day.name;
  }
  return Units.time.day.name;
}

String getEnergyUnit(String? option) {
  switch (option) {
    case "1":
      return Units.energy.joule.name;
    case "2":
      return Units.energy.kilocalorie.name;
    case "3":
      return Units.energy.calorie.name;
  }
  return Units.energy.calorie.name;
}

String? takeInput() => stdin.readLineSync();

String setMode(String? modeOption) {
  switch (modeOption) {
    case "1":
      return "length";
    case "2":
      return "weight";
    case "3":
      return "temperature";
    case "4":
      return "volume";
    case "5":
      return "area";
    case "6":
      return "speed";
    case "7":
      return "time";
    case "8":
      return "energy";
  }
  return "back";
}

void printModeOptions() {
  print("-------------------------");
  print(
      "1:length\n2:weight\n3:temperature\n4:volume\n5:area\n6:speed\n7:time\n8:energy\nexit:exit");
}

void printUnitOptions(String mode) {
  print("-------------------------");
  switch (mode) {
    case 'length':
      print(
          "1:meter\n2:kilometer\n3:centimeter\n4:millimeter\n5:inch\n6:foot\n7:yard\n8:mile");
    case 'weight':
      print("1:killogram\n2:gram\n3:miligram\n4:pound\n5:ounce");
    case 'temperature':
      print("1:celsius\n2:fahrenheit\n3:kelvin");
    case 'volume':
      print(
          "1:fluidOunce\n2:gallon\n3:quart\n4:pint\n5:cubicMeter\n6:cubicCentimeter\n7:milliliter\n8:liter");
    case 'area':
      print(
          "1:squareMeter\n2:squareKilometer\n3:squareCentimeter\n4:squareInch\n5:squareFoot\n6:acre\n7:hectare");
    case 'speed':
      print("1:meterPerSecond\n2:kilometerPerHour\n3:milePerHour");
    case 'time':
      print("1:second\n2:minute\n3:hour\n4:day");
    case 'energy':
      print("1:joule\n2:kilocalorie\n3:calorie");
    default:
  }
  print("back:back");
  print("exit:exit");
}

void convert(double value, UnitEnum fromUnit, UnitEnum toUnit) {
  final units = Units();
  print(
      '$value${units.getUnitSymbol(fromUnit)} = ${units.convert(value, fromUnit, toUnit).toString()}${units.getUnitSymbol(toUnit)}');
}
