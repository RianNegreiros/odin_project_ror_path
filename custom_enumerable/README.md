# Custom Enumerable Project

This repository complements the [Custom Enumerables Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/custom-enumerables) in the Ruby Course for The Odin Project. The goal of this project is to reimplement common methods used frequently through the enumerables module with objects like arrays and hashes. This project will also familiarize you with how to work with blocks and procs. Some starter code and specs are provided to validate the correctness of your solutions.

## Installation

First, clone this repository with

```bash
git clone git@github.com:TheOdinProject/custom_enumerable_project.git
```

Then, navigate into the folder through your command line with

```bash
cd custom_enumerable_project
```

and install the dependencies using the command

```bash
bundle install
```

## Getting Started

You will add new methods to the `Enumerable` module in `lib/my_enumerables.rb`. Before you implement a method, go to the corresponding spec file and watch the test fail by running

```bash
bundle exec rspec <spec_file>
```

You can find the associated spec file in the [methods section](#methods). Then, add the method to the enumerable module. Run the tests again using the same command until they pass.

### Example

As an example, before you start implementing the `my_each` method, run

```bash
bundle exec rspec spec/my_each_spec.rb
```

to see that the test fails as expected.

Once you implement it, like so:

```rb
# lib/my_enumerables.rb

class Array
  def my_each
    # Complete code
  end
end
```

run the command

```bash
bundle exec rspec spec/my_each_spec.rb
```

again to see if your code is correct or not.

### Methods

The following table has the methods you will need to implement along with their associated specs, as outlined in the project instructions.

| Method                          | Spec File                       | Notes                                                                 |
|---------------------------------|---------------------------------|-----------------------------------------------------------------------|
| `Array#my_each`                 | spec/my_each_spec.rb            | You will define my_each on the Array class in `lib/my_enumerables.rb` |
| `Enumerable#my_each_with_index` | spec/my_each_with_index_spec.rb |                                                                       |
| `Enumerable#my_select`          | spec/my_select_spec.rb          |                                                                       |
| `Enumerable#my_all?`            | spec/my_all_spec.rb             |                                                                       |
| `Enumerable#my_any?`            | spec/my_any_spec.rb             |                                                                       |
| `Enumerable#my_none?`           | spec/my_none_spec.rb            |                                                                       |
| `Enumerable#my_count`           | spec/my_count_spec.rb           |                                                                       |
| `Enumerable#my_map`             | spec/my_map_spec.rb             |                                                                       |
| `Enumerable#my_inject`          | spec/my_inject_spec.rb          |                                                                       |

### (Beta) New Assignment

We have created a new repo where you can rebuild the enumerable methods and check they work as expected by running predefined tests against them.

1. Fork and clone our [custom enumerables repo](https://github.com/TheOdinProject/custom_enumerable_project)
2. Follow the [instructions in the README](https://github.com/TheOdinProject/custom_enumerable_project#installation) to get the repo setup locally
3. Rebuild each of [the methods in this table](https://github.com/TheOdinProject/custom_enumerable_project#methods) and make sure they all pass the tests associated with them.
4. (Optional) Let us know what you think of the new approach to this project in our [Ruby on Rails channel on Discord](https://discord.com/channels/505093832157691914/690591236922409012). We’d love to have your feedback!

### Old Assignment

This project is a great opportunity to get comfortable using [yield](https://www.rubyguides.com/2019/12/yield-keyword/) and the [#call](https://ruby-doc.org/core-2.5.3/Method.html#method-i-call) methods.

For this assignment, you will add your new methods onto the existing Enumerable module. Ruby makes this easy for you because any class or module can be modified by doing something like this:

```ruby
  module Enumerable
    def my_each
      # your code here
    end
  end
```

For each method, create a script to compare your method to Ruby’s enumerable method, such as:

```ruby
puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
numbers.each  { |item| puts item }
```

1. Create #my_each, a method that is identical to #each but (obviously) does not use [#each](https://ruby-doc.org/core-2.4.1/Array.html#method-i-each). You’ll need to use a yield statement. Make sure it returns the same thing as #each as well.
2. Create #my_each_with_index in the same way.
3. Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
4. Create #my_all? (continue as above)
5. Create #my_any?
6. Create #my_none?
7. Create #my_count
8. Create #my_map
9. Create #my_inject
10. Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
11. Modify your #my_map method to take a proc instead.
12. Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.
