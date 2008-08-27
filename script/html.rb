require 'rubygems'
require 'discount'
require "uv"

desc 'Transforma o arquivo em HTML'
task :html do
  if File.exists?('output/full_book.markdown')
    output = File.new('output/full_book.markdown').read
    output = Discount.new(output).to_html

    File.open('output/index.html', 'w') do |f|
      html_template = File.new("layout/pdf_template.html").read
      html_template.gsub!("#body", output)
      html_template.gsub! /<pre><code>.*?<\/code><\/pre>/m do |code|
        code = code.gsub('<pre><code>', '').gsub('</code></pre>', '').gsub('&lt;', '<').gsub('&gt;', '>').gsub('&amp;', '&')
        Uv.parse(code, "xhtml", "ruby", false, "mac_classic")
      end
      f.puts html_template
    end
  else
    puts "You haven't made the merge of book's files. Before generate the html or pdf run rake merge_[pt/en]"
  end
end