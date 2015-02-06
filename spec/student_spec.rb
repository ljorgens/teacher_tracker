require ("spec_helper")

describe (Student) do
  it { should have_and_belong_to_many(:periods)}

  describe(".between") do
    it("shows which birthdays are within the range") do
    begin_date = Date.new(2015,01,25)
    end_date = Date.new(2015,1,30)
    birthday1 = Student.create(:name => "alex", :birthday => "2015-01-20")
    birthday2 = Student.create(:name => "tim", :birthday => "2015-01-27")
    expect(Student.between(begin_date, end_date)).to(eq([birthday2]))
    end
  end
end
