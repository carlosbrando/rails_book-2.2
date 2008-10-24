## Introduction

Ruby on Rails 2.2 is chock full of new features, improvements and bug fixes. In this book, you will find a brief description, along with an example (in most cases) of each significant change in this new version of Rails.

This book was a significant undertaking, and we hope that it helps you to make the most of each new feature in Rails.

With this new version, Rails has become a polyglot. With the new internationalization (i18n) system, you can make applications for users throughout the world with ease.

A lot of work went into making Rails thread-safe and as ready as possible for the upcoming Ruby 1.9. There was also a great deal of effort spend on making it more compatible with JRuby. Although the thread-safe mode is not yet available to everyone, since it only works on virtual machines with support for native threads (such as JRuby), it is a great addition to the framework.

If there were complaints in the past about lack of documentation in Rails, now nobody can complain anymore. A lot of hard work was done documenting the code and explaining Rails functionality. For an example, run this in your terminal:

**rake doc:guides**

This rake task will create a doc/guides folder in the root of your project with various guides to help you learn Rails.