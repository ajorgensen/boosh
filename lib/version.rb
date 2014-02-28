module Boosh
  MAJOR = 5
  MINOR = 7
  PATCH = 1

  class Version
    class << self
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end
  end
end
