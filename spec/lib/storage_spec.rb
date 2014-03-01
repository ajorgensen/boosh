require 'spec_helper'

module Boosh
  class Storage
    STORAGE_LOCATION = "#{ENV['HOME']}/.boosh"

    def initialize
      bootstrap
      populate
    end

    def items
      @items
    end

    private

    def populate
      @items = Dir.glob("#{STORAGE_LOCATION}/*").collect do |path|
        name = path.split('/').last
        commands = File.open(path).readlines.map(&:chomp)
        Item.new(name, commands)
      end
    end

    def bootstrap
      return if File.exists?(STORAGE_LOCATION)

      FileUtils.mkdir(STORAGE_LOCATION)
    end
  end
end

module Boosh
  describe Storage do
    it 'stores the data in the home directory' do
      Storage::STORAGE_LOCATION.should eq "#{ENV['HOME']}/.boosh"
    end

    it 'creates the storage location given that it doesnt exist' do
      File.should_receive(:exists?).once.and_return(false)
      FileUtils.should_receive(:mkdir).with(Storage::STORAGE_LOCATION).once
      storage = Storage.new
    end

    it 'does not create the folder if it already exists' do
      File.should_receive(:exists?).once.and_return(true)
      FileUtils.should_not_receive(:mkdir)
      storage = Storage.new
    end

    it 'should get a list of all the items currently stored in the folder' do
      Dir.should_receive(:glob).with("#{Storage::STORAGE_LOCATION}/*").and_return(%w(~/.boosh/foo ~/.boosh/bar ~/.boosh/baz))
      File.stub_chain(:open, :readlines).and_return(['foo', 'bar', 'baz'])
      storage = Storage.new

      storage.items.collect(&:name).should == %w(foo bar baz)
      storage.items.each { |item| item.value.should == %w(foo bar baz) }
    end
  end
end
