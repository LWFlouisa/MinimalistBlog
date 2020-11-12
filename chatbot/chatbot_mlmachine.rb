## ML Machine

######################################################################################
# This uses the Finite Machine gem. When I get a time I will provide a link to that  #
# gem. MLMachine uses his state machine to pick between translation, classification, #
# and rule chosen from an independant state machine. Eventually the goal is to       #
# simulate the waking, productive, tired, and sleeping cycles generally found in a   #
# human.                                                                             #
#                                                                                    #
# Feel free to download the MLMachine directly, and give me suggestions on how to    #
# refine it so takes up less memory. Currently trying to learn how to intigrate      #
# garbage collection to free up memory.                                              #
######################################################################################

def ml_translate
  require "MLMachine"
  
  MLMachine::StateMachine.translate
end

def ml_classify
  require "MLMachine"
  
  MLMachine::StateMachine.classify
end

def ml_rulesets
  require "MLMachine"
  
  MLMachine::StateMachine.ruleset
end

## Evolutionary Algorithm

#####################################################################################
# This operates a little bit differently from Evolutionary systems in Data Science. #
# Instead of using machine learning, it compares the user's dataset to the AI's     #
# dataset ( the AI's being assumed to be the ideal state ), and automatically       #
# adjusts itself to match the AI's data state, then only performs the task          #
# specified by the AI.                                                              #
#####################################################################################

## This still needs to be implemented.
def reset_evo
end

def use_form
end

def reshape
end
