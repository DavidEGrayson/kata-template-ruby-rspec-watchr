def run_spec
  system "clear && date && rspec --color spec.rb"
end
watch('.*\.rb') { run_spec }
