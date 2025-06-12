import 'dart:io';

class Person {
  String _name = '';
  int age;

  // Constructor
  Person(this._name, this.age);

  // Getter for name
  String get name => _name;

  // Setter for name with validation
  set name(String value) {
    if (value.isEmpty) {
      print("Name cannot be empty.");
    } else {
      _name = value;
    }
  }

  // Display method
  void display() {
    print("Name: $_name, Age: $age");
  }
}

// Student class inherits from Person
class Student extends Person {
  int rollNumber;
  String course;

  // Default constructor
  Student(String name, int age, this.rollNumber, this.course) : super(name, age);

  // Named constructor
  Student.named({required String name, required int age, required this.rollNumber, required this.course})
      : super(name, age);

  // Override display
  @override
  void display() {
    print("Name: $name, Age: $age, Roll No: $rollNumber, Course: $course");
  }
}

void main() {
  // Create multiple student objects
  List<Student> students = [
    Student("Ali", 20, 101, "Flutter"),
    Student.named(name: "Sara", age: 22, rollNumber: 102, course: "Web"),
    Student("John", 21, 103, "Flutter"),
    Student.named(name: "Fatima", age: 23, rollNumber: 104, course: "AI"),
  ];

  // Print all student details
  print("All Student Details:\n");
  for (var student in students) {
    student.display();
  }

  // Filter and display students in a specific course
  stdout.write("\nEnter course to filter (e.g., Flutter): ");
  String? filterCourse = stdin.readLineSync();

  print("\nStudents enrolled in $filterCourse:");
  for (var student in students) {
    if (student.course.toLowerCase() == filterCourse?.toLowerCase()) {
      student.display();
    }
  }
}
