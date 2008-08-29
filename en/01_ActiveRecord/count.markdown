## New :from option for calculation methods in ActiveRecord

A new option has been included in the calculation methods of **ActiveRecord** (**count**, **sum**, **average**, **minimum** and **maximum**).

When you use the **:from** option, you can override the name of the table in the query that **ActiveRecord** generates, which doesn't seem very useful at first glance, but one interesting thing that this allows you to do is force MySQL to use a specific index for the calculation.

Check out some examples:

	# Forcing MySQL to use an index for a calculation
	Edge.count :all, :from => 'edges USE INDEX(unique_edge_index)',
	           :conditions => 'sink_id < 5')

	# Doing the calculation in a different table from the associated class
	Company.count :all, :from => 'accounts'