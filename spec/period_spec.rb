require ("spec_helper")

describe (Period) do
  it { should have_and_belong_to_many(:students)}
end
