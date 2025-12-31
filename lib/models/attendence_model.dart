class AttendanceRecord {
  final String subject;
  final String date;
  final String status; // "Present" or "Absent"

  AttendanceRecord({
    required this.subject,
    required this.date,
    required this.status,
  });
}

class SubjectAttendance {
  final String subject;
  final int percentage;

  SubjectAttendance({
    required this.subject,
    required this.percentage,
  });
}