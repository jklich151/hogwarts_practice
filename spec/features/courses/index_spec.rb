require 'rails_helper'

RSpec.describe "Courses Index Page" do
  it "can see a list of courses and number of students in each course" do
    student_1 = Student.create(name: "Harry",
                              age: "14",
                              house: "G")
    student_2 = Student.create(name: "Ron",
                              age: "15",
                              house: "Slytherin")
    course_1 = Course.create(name: "Potions")
    course_2 = Course.create(name: "Herbology")

    StudentCourse.create(student: student_1, course: course_1)
    StudentCourse.create(student: student_1, course: course_2)
    StudentCourse.create(student: student_2, course: course_2)

    visit "/courses"

    expect(page).to have_content("Potions: 1")
    expect(page).to have_content("Herbology: 2")
  end
end
