require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe "methods" do
    it "#average age" do
      student_1 = Student.create(name: "Harry",
                                age: "14",
                                house: "G")
      student_2 = Student.create(name: "Ron",
                                age: "15",
                                house: "Slytherin")
      students = Student.all

      expect(students.average_age).to eq(14.5)
    end
  end
end
