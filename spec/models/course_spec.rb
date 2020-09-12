require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe "methods" do
    it "#students_count" do
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

      expect(course_1.students_count).to eq(1)
      expect(course_2.students_count).to eq(2)
    end
  end

end
