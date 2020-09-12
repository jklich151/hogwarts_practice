require 'rails_helper'

RSpec.describe "Students Show Page" do
  it "can see a list of a students courses" do
    student_1 = Student.create(name: "Harry",
                              age: "14",
                              house: "G")
    course_1 = Course.create(name: "Potions")
    course_2 = Course.create(name: "Herbology")

    StudentCourse.create(student: student_1, course: course_1)
    StudentCourse.create(student: student_1, course: course_2)

    visit "/students/#{student_1.id}"

    expect(page).to have_content(student_1.name)
    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_2.name)
  end
end
