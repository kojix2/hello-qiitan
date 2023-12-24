module Hello
  class Greeter
    def greet(name : String, period : String?)
      case period
      when "morning"
        puts "Good morning, #{name}!"
      when "afternoon"
        puts "Good afternoon, #{name}!"
      when "evening"
        puts "Good evening, #{name}!"
      else
        puts "Hi #{name}! How are you?"
      end
    end
  end
end
