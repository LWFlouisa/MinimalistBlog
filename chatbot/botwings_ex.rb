## Implementing the gem [ beginners and intermediates ]
def safety_reset
  require "botwings"

  Botwings::BotWings.reset_evo
end

def evaluate_fitness
  require "botwings"

  Botwings::BotWings.reshape
end

print "[a] Reset Evolution\n    [b] Evaluate Fitness\n  >> "; branch = gets.chomp

if    branch == "a"; safety_reset
elsif branch == "b"; evaluate_fitness
else
  abort
end

## Under The Hood [ advanced users ]
require "botwings/version"

module Botwings
  class Error < StandardError; end

  class BotWings
    def self.reset_evo
      number     = File.read("data/number/input.txt").strip.to_i

      if number > 3
        number = 0
      end
    end

    def self.use_form
      system("tts 'Form status: Suitable...', 'en'")

      sleep(3)

      ## Detect bot form
      ## bot_choice = File.read("data/bot_input/input.txt").strip.to_i
      ## bot_wings = File.readlines("data/bot_shape/wings.txt")

      ## Form conditional
      ## if bot form is decision tree
      ## elsif bot form is naive bayes
      ## elsif bot form is biometrics
      ## elsif bot form is "infinite learning algorithm"

      abort
    end

    def self.reshape
      system("clear")

      bot_choice = File.read("data/bot_input/input.txt").strip.to_i
      number     = File.read("data/number/input.txt").strip.to_i

      usr_wings = File.readlines("data/usr_shape/wings.txt")
      bot_wings = File.readlines("data/bot_shape/wings.txt")

      current_wingset  = usr_wings[number]
      current_botwings = bot_wings[bot_choice]

      system("tts 'The current wing model is: #{current_wingset}', 'en'")
      system("tts 'The current bot wing model is: #{current_botwings}', 'en'")

      if current_wingset == current_botwings
        use_form
      else
        system("tts 'Form status: Changing form...', 'en'")

        sleep(3)

        new_value = number + 1

        open("data/number/input.txt", "w") { |f|
          f.puts new_value
        }
      end

      FitnessFunction::BotWings.reshape
    end
  end
end
