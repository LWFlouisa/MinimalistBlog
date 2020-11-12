require "dynamicAI"

# Follows behavioural procedure.
def behaviours
  DynamicAI::Generate.behaviours
end

# Operates the generated temp file.
def operation_write
  DynamicAI::Operate.written_script
end

# Purges the temporary ruby script.
def operation_purge
  DynamicAI::Operate.purge_script
end

behaviours
operation_write
operation_purge
