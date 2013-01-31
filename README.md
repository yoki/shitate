Shitate
=============

This gem allows to set preferences/configurations specific to ActiveRecord Objects. 

Preferences are stored in the separate table so main table will not be bloated.  Also, developers can add new preferences without altering database schema. 

Shitate(仕立) means order-made clothing in Japanese. 

Installation
============

1. Add the following to your applications Gemfile

```
    gem 'shitate'
```

2. Run bundler

```
    bundle install
```

3. Copy migrations.

```
    rails g shitate:install
```

4. Run migrations

```
    rake db:migrate
```




Usage
=====
In user.rb (or other model file)

```ruby
  has_shitate { :default => { 
      name: "undefined",
      age: '50',
      favorite_songs: nil,
      popular: false,
      super_cool_configuration: 'badass'
    }
  }
```

You now have setters and getters for name, age, super_cool_configuration etc.

```ruby
user = User.create
user.name                  #=> "undefined"
user.name = 'Yoki'         #=> true
User.find(user.id).name    #=> "Yoki"

user.address               #=> "NoMethodError"
```


Todo
====
- Validation for preferences
- update_attribute integration


Copyright (c) 2013 Yoki Okawa, released under the MIT License
