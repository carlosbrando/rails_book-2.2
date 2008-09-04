## :index option now works in fields\_for

Often the `:index` option of the `select` method is helpful, such as when you need to create many different dynamic select controls on a single page.

Until now, the `fields_for` method didn't repass this option to methods like `select`, `collection_select`, `country_select` and `time_zone_select`, which limited its usefulness in certain circumstances.

This has been corrected in this version of Rails. For example, just as a test, check out this code and what it returns:

	fields_for :post, @post, :index => 108 do |f|
	  concat f.select(:category, %w( abe <mus> hest))
	end

	<select id=\"post_108_category\" name=\"post[108][category]\">
	  <option value=\"abe\">abe</option>
	  <option value=\"&lt;mus&gt;\" selected=\"selected\">&lt;mus&gt;</option>
	  <option value=\"hest\">hest</option>
	</select>