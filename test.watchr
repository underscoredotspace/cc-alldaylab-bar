watch('^spec/.*\.rb$') { |m| ruby m[0] }
watch('^(?!spec/)(.*)(?!_spec)\.rb$') { |m| ruby "spec/#{m[1]}_spec.rb" }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
Signal.trap('QUIT') { ruby tests  } # Ctrl-\
Signal.trap('INT' ) { abort("\n") } # Ctrl-C

# --------------------------------------------------
# Helpers
# --------------------------------------------------
def ruby(*paths)
  run "ruby #{gem_opt} -I.:lib:test -e'%w( #{paths.flatten.join(' ')} ).each { |p| require p }'"
end

def tests
  Dir['test/**/test_*.rb'] - ['test/test_helper.rb']
end

def run( cmd )
  system 'clear'
  # puts   cmd
  system cmd
end

def gem_opt
  defined?(Gem) ? "-rubygems" : ""
end
