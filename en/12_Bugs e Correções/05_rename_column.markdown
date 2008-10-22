## Bug fix in rename\_column

This modification is a bug fix in the `rename_column` method. To understand what the problem is, let's look at an example scenario. First, let's create a **migration**:

	create_table "users", :force => true do |t|
	  t.column :name, :string, :default => ''
	end

Then we create a second **migration** that renames the **name** column:

	rename_column :users, :name, :first_name

If you run this test on your machine, you will notice that when the `rename_column` method executes, the "new" column `first_name` no longer has the default value defined in the first **migration**, like it should.

This bug has been fixed in this version of Rails.