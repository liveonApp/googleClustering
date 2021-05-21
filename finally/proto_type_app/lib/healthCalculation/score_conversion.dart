import '../healthCalculation/health_scroe_model.dart';

class ScoreConversion {
  HealthScoreModel model = HealthScoreModel();

  double bodyScore = 0;
  double recognitionScore = 0;
  double behaviorChangeScore = 0;
  double nursingScore = 0;
  double rehabilitationScore = 0;

  //아직 용도 모름
  double illnessScore = 0;

  int totalScoreFromMap(Map<String, int> model) {
    int modelResult = model.values.reduce((sum, element) => sum + element);
    return modelResult;
  }

  double bodyScoreFunction(Map<String, int> model) {
    int min = 12;
    Map<String, double> bodyScoreByPercent = {
      min.toString(): 0.00,
      '13': 13.19,
      '14': 22.24,
      '15': 28.04,
      '16': 32.38,
      '17': 35.92,
      '18': 38.96,
      '19': 41.68,
      '20': 44.18,
      '21': 46.52,
      '22': 48.76,
      '23': 50.93,
      '24': 53.06,
      '25': 55.17,
      '26': 57.3,
      '27': 59.46,
      '28': 61.71,
      '29': 64.06,
      '30': 66.59,
      '31': 69.36,
      '32': 72.5,
      '33': 76.22,
      '34': 81.02,
      '35': 88.4,
      '36': 100.00
    };

    double result = 0;
    int totalScore = totalScoreFromMap(model);
    if (totalScore <= min) {
      result = bodyScoreByPercent[min.toString()]!.toDouble();
    } else {
      result = bodyScoreByPercent[totalScore.toString()]!.toDouble();
    }

    return result;
  }

  double recognitionScoreFunction(Map<String, int> model) {
    double result = 0;
    Map<String, double> recognitionScoreByPercent = {
      '0': 0.00,
      '1': 19.71,
      '2': 33.81,
      '3': 44.61,
      '4': 54.78,
      '5': 65.71,
      '6': 80.06,
      '7': 100.00
    };
    int totalScore = totalScoreFromMap(model);
    result = recognitionScoreByPercent[totalScore.toString()]!.toDouble();
    return result;
  }

  double behaviorChangeScoreFunction(Map<String, int> model) {
    double result = 0;
    Map<String, dynamic> behaviorChangeScoreBypercent = {
      '0': 0.00,
      '1': 15.58,
      '2': 25.55,
      '3': 32.1,
      '4': 37.29,
      '5': 41.8,
      '6': 45.95,
      '7': 49.94,
      '8': 53.93,
      '9': 58.08,
      '10': 62.59,
      '11': 67.8,
      '12': 74.37,
      '13': 84.37,
      '14': 100.00
    };
    int totalScore = totalScoreFromMap(model);
    result = behaviorChangeScoreBypercent[totalScore.toString()]!.toDouble();
    return result;
  }

  double nursingScoreFunction(Map<String, int> model) {
    double result = 0;
    Map<String, double> nursingScoreByPercent = {
      '0': 0,
      '1': 19.84,
      '2': 36.9,
      '3': 47.84,
      '4': 55.81,
      '5': 62.53,
      '6': 68.98,
      '7': 76.11,
      '8': 85.86,
      '9': 100
    };
    int totalScore = totalScoreFromMap(model);
    result = nursingScoreByPercent[totalScore.toString()]!.toDouble();
    return result;
  }

  double rehabilitationScoreFunction(Map<String, int> model) {
    double result = 0;
    int min = 10;
    Map<String, double> rehabilitationScoreByPercent = {
      min.toString(): 0.00,
      '11': 11.51,
      '12': 19.43,
      '13': 24.72,
      '14': 28.93,
      '15': 32.62,
      '16': 36.06,
      '17': 39.46,
      '18': 42.96,
      '19': 46.69,
      '20': 50.72,
      '21': 54.97,
      '22': 59.2,
      '23': 63.19,
      '24': 66.93,
      '25': 70.53,
      '26': 74.16,
      '27': 78.07,
      '28': 82.75,
      '29': 89.57,
      '30': 100.00
    };

    int totalScore = totalScoreFromMap(model);
    if (totalScore <= min) {
      result = rehabilitationScoreByPercent[min.toString()]!.toDouble();
    } else {
      result = rehabilitationScoreByPercent[totalScore.toString()]!.toDouble();
    }
    return result;
  }
}
