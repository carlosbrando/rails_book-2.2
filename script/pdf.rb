desc 'Create PDF files'
task :pdf => :html do
  LANGUAGES.each do |language|
    prince = Prince.new()
    html_string = File.new("output/#{language}/index.html").read
    prince.add_style_sheets 'layout/second.css', 'layout/mac_classic.css'

    File.open("output/#{language}/book.pdf", 'w') do |f|
      f.puts prince.pdf_from_string(html_string)
    end

    # `open output/book.pdf`
  end
end
