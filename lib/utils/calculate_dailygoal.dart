class CalculateDailyGoal {
  int calculate(int age, int weight) {
    if(age <= 17) {
      return weight * 40;
    } else if(age >= 18 && age < 55) {
      return weight * 35;
    } else if(age >= 55 && age <= 65) {
      return weight * 30;
    } else {
      return weight * 25;
    }
  }
}