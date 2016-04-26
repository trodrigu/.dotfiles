# == Pry-Nav - Using pry as a debugger ==
if defined?(PryByeBug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 'c', 'stop'
  Pry.commands.alias_command 'c', 'next'
  Pry.commands.alias_command 'c', 'finish'
end

Pry::Commands.command /^$/, 'repeat last command' do
  _pry_.run_command Pry.history.to_a.last
end

Pry.config.color = true
Pry.config.theme = 'solarized'

# === Listing config ===
# Better colors - by default the headings for methods are too
# similar to method name colors leading to a "soup"
# These colors are optimized foruse with Solarized scheme
# for your terminal
Pry.config.ls.separator = "\n" # new line between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

# == PLUGINS ===
# awesome_print gem: great syntax colorized printing

begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue
  puts "=> Unable to load awesome_print, please type 'gem install awesome_print' or 'sudo gem install awesome_print'."
end

require 'interactive_editor'

# === CUSTOM COMMANDS ===
default_command_set = Pry::CommandSet.new do
  command 'copy', 'Copy argument to the clip-board' do |str|
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end

  command 'clear' do
    system 'clear'
    output.puts 'Rails Environment: ' + ENV['RAILS_ENV'] if ENV['RAILS_ENV']
  end

  command 'sql', 'Send sql over AR.' do |query|
    if ENV['RAILS_ENV'] || defined?(Rails)
      pp ActiveRecord::Base.connection.select_all(query)
    else
      pp 'No rails env defined'
    end
  end

  command 'caller_method' do |depth|
    depth = depth.to_i || 1
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth + 1).first
      file = Regexp.last_match[1]
      line = Regexp.last_match[2].to_i
      method = Regexp.last_match[3]
      output.puts [file, line, method]
    end
  end
end

Pry.config.commands.import default_command_set
