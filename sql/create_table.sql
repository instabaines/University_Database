-- Create Schools table
CREATE TABLE Schools (
  SchoolID NUMBER PRIMARY KEY,
  SchoolName VARCHAR2(255) NOT NULL
);

-- Create Courses table
CREATE TABLE Courses (
  CourseID NUMBER PRIMARY KEY,
  CourseName VARCHAR2(255) NOT NULL,
  SchoolID NUMBER NOT NULL,
  CONSTRAINT fk_school FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

-- Create Semesters table
CREATE TABLE Semesters (
  SemesterID NUMBER PRIMARY KEY,
  SemesterName VARCHAR2(255) NOT NULL,
  CourseID NUMBER NOT NULL,
  CONSTRAINT fk_course FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create Students table
CREATE TABLE Students (
  StudentID NUMBER PRIMARY KEY,
  StudentName VARCHAR2(255) NOT NULL,
  CourseID NUMBER NOT NULL,
  CONSTRAINT fk_student_course FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create Modules table
CREATE TABLE Modules (
  ModuleID NUMBER PRIMARY KEY,
  ModuleCode VARCHAR2(10) NOT NULL,
  ModuleName VARCHAR2(255) NOT NULL,
  SemesterID NUMBER NOT NULL,
  CONSTRAINT fk_module_semester FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID)
);

-- Create Sessions table
CREATE TABLE Sessions (
  SessionID NUMBER PRIMARY KEY,
  SessionType VARCHAR2(50) NOT NULL,
  SessionDate DATE NOT NULL,
  SessionTime DATE NOT NULL,
  Room VARCHAR2(50) NOT NULL,
  ModuleID NUMBER NOT NULL,
  CONSTRAINT fk_session_module FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID)
);

-- Create Attendance table
CREATE TABLE Attendance (
  AttendanceID NUMBER PRIMARY KEY,
  StudentID NUMBER NOT NULL,
  SessionID NUMBER NOT NULL,
  CONSTRAINT fk_attendance_student FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  CONSTRAINT fk_attendance_session FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID)
);
