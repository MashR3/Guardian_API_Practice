require 'spec_helper'

describe 'investigate current Guardian editions' do

  before(:all) do
    edition_test = Guardian.new
    @api_tests = edition_test.editions.check_editions
  end

  it 'returns a hash' do
    expect(@api_tests).to be_kind_of(Hash)
    # puts @api_tests.class
  end


end
