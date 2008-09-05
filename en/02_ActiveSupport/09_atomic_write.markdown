## File.atomic\_write copies the original file's permissions

Some of you may be familiar with the `File.atomic_write` method. Unsurprisingly, it is used to ensure that file writes are atomic. It can be very useful in situations where you don't want other processes or threads to see a half-written file.

	File.atomic_write("important.file") do |file|
	  file.write("hello")
	end

This method creates a temporary file while you are writing to it, and when you are finished, it replaces the old file with the new one.

A new feature of Rails 2.2 is that this method now ensures that the new file has the same permissions as the old one.