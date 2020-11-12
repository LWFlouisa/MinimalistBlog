require "dynamicTree"

number = File.read("data/number/input.txt").strip.to_i

DynamicTree::Sprout.initialize_tree

print "Move forward? (Y/N) >> "; yn = gets.chomp

if    yn ==   "Y"; open("data/number/input.txt", "w") { |f| f.puts number = number + 1 }
elsif yn ==   "y"; open("data/number/input.txt", "w") { |f| f.puts number = number + 1 }
elsif yn ==   "N"; puts "Leaving input as is."
elsif yn ==   "n"; puts "Leaving input as is."
elsif yn == "Yes"; open("data/number/input.txt", "w") { |f| f.puts number = number + 1 }
elsif yn == "yes"; open("data/number/input.txt", "w") { |f| f.puts number = number + 1 }
elsif yn ==  "No"; puts "Leaving input as is."
elsif yn ==  "no"; puts "Leaving input as is."
end
