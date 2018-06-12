Student = load '/pig/student.txt' as (name: chararray, roll:int);
Results = load '/pig/results.txt' as (roll:int, grade:chararray);

PassStudents = filter Results by grade =='pass';
PassStudentNames = join Student by roll, PassStudents by roll;
Passed = foreach PassStudentNames generate name;
dump Passed;
-- STORE Passed INTO 'myoutput' using PigStorage(',')
