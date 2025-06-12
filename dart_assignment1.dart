import 'dart:io';

void main() {
  // 1. Declare and initialize different types of variables
  int year = 2025;
  String course = "Mobile App Development";
  bool isEnrolled = true;

  print("Year: $year");
  print("Course: $course");
  print("Enrolled: $isEnrolled\n");

  // 2. Accept user input for name and age
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter your age: ");
  int? age = int.tryParse(stdin.readLineSync() ?? '');

  if (name == null || age == null) {
    print("Invalid input!");
    return;
  }

  print("\nHello $name! You are $age years old.\n");

  // 3. Store a list of city names and print original and reversed
  List<String> cities = ["Karachi", "Lahore", "Islamabad", "Quetta", "Peshawar"];
  print("Original Cities List: $cities");

  List<String> reversedCities = cities.reversed.toList();
  print("Reversed Cities List: $reversedCities\n");

  // 4. Create a map of students with marks, add a new entry, and print updated map
  Map<String, int> studentMarks = {
    "Ali": 85,
    "Sara": 92,
    "John": 78
  };

  // Add a new entry
  studentMarks["Fatima"] = 88;

  print("Updated Student Marks: $studentMarks\n");

  // 5. Use conditional logic to categorize age
  String category;
  if (age < 13) {
    category = "Child";
  } else if (age >= 13 && age <= 19) {
    category = "Teen";
  } else if (age >= 20 && age <= 59) {
    category = "Adult";
  } else {
    category = "Senior";
  }

  print("Age Category using if-else: $category");

  // Using ternary operator (example)
  String isAdult = (age >= 18) ? "Yes, you're an adult." : "No, you're not an adult.";
  print("Adult check using ternary operator: $isAdult");
}
