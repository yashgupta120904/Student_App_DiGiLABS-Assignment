class Student {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String dateOfBirth;
  final String department;
  final String semester;
  final String enrollmentDate;
  final String address;
  final double cgpa;
  final double attendanceRate;
  final int totalSubjects;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.department,
    required this.semester,
    required this.enrollmentDate,
    required this.address,
    required this.cgpa,
    required this.attendanceRate,
    required this.totalSubjects,
  });

  factory Student.demo() {
    return Student(
      id: 'STU-2024-001',
      name: 'John Doe',
      email: 'john.doe@university.edu',
      phone: '+91 98765 43210',
      dateOfBirth: '15 March 2005',
      department: 'Computer Science',
      semester: '4th Semester',
      enrollmentDate: '01 August 2023',
      address: '123 Student Street, Jaipur, Rajasthan 302001, India',
      cgpa: 7.8,
      attendanceRate: 92.0,
      totalSubjects: 6,
    );
  }
}
