require 'rails_helper'

RSpec.describe "Students Index Page" do
  it "see a list of students info" do
    student_1 = Student.create(name: "Harry",
                              age: "14",
                              house: "G")
    student_2 = Student.create(name: "Ron",
                              age: "15",
                              house: "Slytherin")
    visit "/students"

    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_1.age)
    expect(page).to have_content(student_1.house)
    expect(page).to have_content(student_2.name)
    expect(page).to have_content(student_2.age)
    expect(page).to have_content(student_2.house)
  end

  it "can see the average age of all students" do
    student_1 = Student.create(name: "Harry",
                              age: "14",
                              house: "G")
    student_2 = Student.create(name: "Ron",
                              age: "15",
                              house: "Slytherin")
    visit "/students"

    expect(page).to have_content("Average Age: 14.5")
  end
end
