## Support for the :limit option in update\_all

The `update_all` method now has a new `:limit` option. This is very helpful, because it makes sure that things will still work when you use `update_all` in `has_many` associations that use the `:limit` option.