abstract final class HydrationCalculator {
  static int calculateGoal(int age, int weightKg) {
    int mlPerKg = 40;

    if(age >= 18 && age < 55) {
      mlPerKg = 35;
    } else if(age >= 55 && age <= 65) {
      mlPerKg = 30;
    } else if(age >= 66) {
      mlPerKg = 25;
    }

    return mlPerKg * weightKg;
  }
}