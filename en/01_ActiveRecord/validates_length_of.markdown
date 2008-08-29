## Defining how validates\_length\_of should function

The **validates\_length\_of** is one of many validation methods in **ActiveRecord**. This particular method is for making sure that the value stored in a given database column has a certain length. It lets you specify a maximum length, a minimum length, an exact length, or even a range of lengths.

"Length," however, is relative. When we say "length" these days we are talking about the number of characters in the text. But imagine a case where you have a form field in which the limit is not defined by the number of characters, but by the number of words, such as, "Write a paragraph with at least 100 words." (I think a better example would be "Submit a comment with no more than 100 words.") Imagine a page where the user must submit an essay, for example.

Before Rails 2.2, our only option would be to create a custom validation method, but now you can personalize **validates\_length\_of** using the **:tokenizer** option. The following example resolves the aforementioned problem:

	validates_length_of :essay,
	                    :minimum => 100,
	                    :too_short => "Sua redação deve ter no mínimo %d palavras."),
	                    :tokenizer => lambda {|str| str.scan(/\w+/) }

This is just one example of what you can do with this new option. In addition to this, you can use it to count only the number of digits, the times a certain word was used, etc.