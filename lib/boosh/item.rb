module Boosh
  class Item
    attr_accessor :name
    attr_accessor :value

    def initialize(name, value)
      self.name = name
      self.value = value
    end
  end
end
