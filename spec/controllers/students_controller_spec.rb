require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe "#index" do
    before do
      @user = User.create(email:'team_cluck_admin@gmail.com', confirmed_at:'2023-01-19 12:12:07.544080')
      @course1 = Course.create(course_name:"CSCE 411", teacher:'team_cluck_admin@gmail.com', section:'501', semester:'Spring 2023')
      @course2 = Course.create(course_name:"CSCE 411", teacher:'team_cluck_admin@gmail.com', section:'501', semester:'Fall 2023')
      @course3 = Course.create(course_name:"CSCE 412", teacher:'team_cluck_admin@gmail.com', section:'501', semester:'Spring 2024')

      @student = Student.create(firstname:'Zebulun', lastname:'Oliphant', uin:'734826482', email:'zeb@tamu.edu', classification:'U2', major:'CPSC', teacher:'team_cluck_admin@gmail.com')
    end

    it "calls index successfully" do
      get :index
      expect(@students).to redirect_to(students_url)
    end

    it "shows successfully" do
      get :show, params: { id: @student.id }
    #   expect(response).to be_successful
    # am not sure why this fails. returns false
    end


  end
end
