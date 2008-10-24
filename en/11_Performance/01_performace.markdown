## Improving Rails performance

Jeremy Kemper has been working on a number of performance improvements in Rails. For one thing, he has improved the efficiency of **ERb**, as well as some methods like `concat` and `capture`, which are used by many **helpers** in Rails.

Jeremy has also attacked the **partial** initialization process and optimized various helpers that generated **javascript** code.

The `RecordIdentifier` class has also been improved by using caching. `RecordIdentifier` employs a series of conventions to deal with `ActiveRecord` and **ActiveResource** records, or pretty much any other kind of model that has an **id**.

It's interesting to see this kind of work. Rails is getting pretty hefty, so optimization efforts will need to become an ongoing part of future Rails enhancements.