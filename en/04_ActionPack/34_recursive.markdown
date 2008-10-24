## New :recursive option for javascript\_include\_tag and stylesheet_\link\_tag

The `javascript_include_tag` and `stylesheet_link_tag` helpers have a new `:recursive` option that can be used together with `:all`, which allows them to load an entire file tree in one line of code. For example, let's say I have the following files:

public/javascripts/super_calendar/calendar.js
public/stylesheets/super_calendar/calendar.css

Both get included, even if they are in subdirectories, when I execute the following code:

	javascript_include_tag :all, :recursive => true
	stylesheet_link_tag :all, :recursive => true