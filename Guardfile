
clearing :on
notification :terminal_notifier

guard :minitest, all_on_start: false do
  watch(%r{^lib/swapi_client/(.+)\.rb$}) { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch('test/test_helper.rb') { "test" }
end
