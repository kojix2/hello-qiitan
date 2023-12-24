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
      on("-m", "--morning", Gettext.gettext("Morning")) { options.period = "morning" }
      on("-a", "--afternoon", Gettext.gettext("Afternoon")) { options.period = "afternoon" }
      on("-e", "--evening", Gettext.gettext("Evening")) { options.period = "evening" }
      on("-n", "--name NAME", Gettext.gettext("Name")) { |v| options.name = v }
      on("-v", "--version", Gettext.gettext("Show version")) { show_version }
      on("-h", "--help", Gettext.gettext("Show this help")) { show_help }
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
