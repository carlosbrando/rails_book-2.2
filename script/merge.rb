desc 'Portuguese'
task :merge_pt do
  File.open('output/full_book.markdown', 'w+') do |f|
    Dir["pt/**/*.markdown"].sort.each do |path|
      f << File.new(path).read + "\r\n"
    end
  end
end

desc 'English'
task :merge_en do
  File.open('output/full_book.markdown', 'w+') do |f|
    Dir["en/**/*.markdown"].sort.each do |path|
      f << File.new(path).read + "\r\n"
    end
  end
end
