require ("spec_helper")

describe (Student) do
  it { should have_and_belong_to_many(:periods)}
end
