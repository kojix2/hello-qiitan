require "option_parser"
require "./options"
require "./version"

module Hello
  class Parser < OptionParser
    getter options : Options

    def initialize
      super
      @options = Options.new
      self.banner = "Usage: hello [periodion]"
      on("-m", "--morning", "Morning") { options.period = "morning" }
      on("-a", "--afternoon", "Afternoon") { options.period = "afternoon" }
      on("-e", "--evening", "Evening") { options.period = "evening" }
      on("-n", "--name NAME", "Name") { |v| options.name = v }
      on("-v", "--version", "Show version") { show_version }
      on("-h", "--help", "Show this help") { show_help }
      invalid_option { STDERR.puts(self); exit(1) }
    end

    def parse(args = ARGV) : Options
      super
      options
    end

    def show_version
      puts VERSION; exit
    end

    def show_help
      puts self; exit
    end
  end
end
