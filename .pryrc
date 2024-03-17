if defined?(PryByebug)
  Pry.commands.alias_command 'C', 'continue'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 'S', 'step'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'N', 'next'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'F', 'frame'
  Pry.commands.alias_command 'f', 'frame'
  Pry.commands.alias_command 'U', 'up'
  Pry.commands.alias_command 'u', 'up'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'B', 'break'
  Pry.commands.alias_command 'b', 'break'
  Pry.commands.alias_command 'X', '!!!'
  Pry.commands.alias_command 'x', 'exit'
end

def shard(&block); Tool::DatabaseManager.with_master("shard2", &block); end 

def track(&block); start = Process.clock_gettime(Process::CLOCK_MONOTONIC); yield; Process.clock_gettime(Process::CLOCK_MONOTONIC) - start; end
