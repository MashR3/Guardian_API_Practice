require 'spec_helper'

describe "guardian content service" do

# before all, instantiate the class in variable 'weather' and the run the tests on the instance variable of running the method on it.
  before(:all) do
    content_test = Guardian.new
    @api_tests = content_test.content
  end

  it 'has the code 200 for a successful https response' do
    expect(@api_tests.content_by_keyword("green")['status']).to be == "ok"
  end

  it 'returns a hash' do
    expect(@api_tests.content_by_keyword("green")).to be_kind_of(Hash)
  end

end
