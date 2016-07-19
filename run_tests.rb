require 'find'

def find_valid_files
  files = []
  Find.find('specs') do |path|
    files << path if path.include?(".rb")
  end
  return files
end

def run_tests(files)
  for file in files
    puts "Running #{file}"
    system("ruby #{file}")
  end
end

valid_files = find_valid_files()

run_tests(valid_files)