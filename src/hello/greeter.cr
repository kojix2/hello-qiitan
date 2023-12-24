module Hello
  class Greeter
    def greet(name : String, period : String?)
      case period
      when "morning"
        puts Gettext.gettext("Good morning, #{name}!")
      when "afternoon"
        puts Gettext.gettext("Good afternoon, #{name}!")
      when "evening"
        puts Gettext.gettext("Good evening, #{name}!")
      else
        puts Gettext.gettext("Hi #{name}! How are you?")
      end
    end
  end
end
