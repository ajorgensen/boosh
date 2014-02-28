require 'spec_helper'

describe Boosh::Item do
  let(:item) { Boosh::Item.new('foo', 'bar') }

  it 'has a name' do
    item.name.should eq 'foo'
  end

  it 'has a value' do
    item.value.should eq 'bar'
  end

end
