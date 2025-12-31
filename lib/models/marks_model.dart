class Mark {
  final String subject;
  final int internal; // out of 40
  final int external; // out of 60
  final int total;
  final String grade;

  Mark({
    required this.subject,
    required this.internal,
    required this.external,
    required this.total,
    required this.grade,
  });

  double get percentage => (total / 100) * 100;
}

class SemesterMarks {
  final double cgpa;
  final double averageScore;
  final String overallGrade;
  final List<Mark> marks;

  SemesterMarks({
    required this.cgpa,
    required this.averageScore,
    required this.overallGrade,
    required this.marks,
  });

  factory SemesterMarks.demo() {
    return SemesterMarks(
      cgpa: 7.8,
      averageScore: 78.0,
      overallGrade: 'A',
      marks: [
        Mark(
          subject: 'Mathematics',
          internal: 38,
          external: 68,
          total: 106,
          grade: 'A',
        ),
        Mark(
          subject: 'Physics',
          internal: 35,
          external: 65,
          total: 100,
          grade: 'A',
        ),
        Mark(
          subject: 'Chemistry',
          internal: 36,
          external: 70,
          total: 106,
          grade: 'A',
        ),
        Mark(
          subject: 'English',
          internal: 32,
          external: 60,
          total: 92,
          grade: 'B+',
        ),
      ],
    );
  }
}