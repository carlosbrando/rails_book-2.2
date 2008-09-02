desc 'Merge all files'
task :merge do
  LANGUAGES.each do |language|
    Dir.mkdir("output/#{language}") unless File.directory?("output/#{language}")
    
    File.open("output/#{language}/full_book.markdown", 'w+') do |f|
      Dir["#{language}/**/*.markdown"].sort.each do |path|
        f << File.new(path).read + "\r\n\r\n"
      end
    end
  end
end
