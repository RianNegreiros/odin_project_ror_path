# Event Manager

### What We're Doing in This Tutorial

Imagine that a friend of yours runs a non-profit organization around political activism.
A number of people have registered for an upcoming event. She has asked for your help in
engaging these future attendees. For the first task, she wants you to find the government
representatives for each attendee based on their zip code.

### Initial Setup

Create a project directory folder named `event_manager` wherever you want to store
your project. In the project directory, create another folder named `lib` and inside
that folder create a plain text file named `event_manager.rb`. Using your command-line
interface (CLI), you can enter the following commands:

```bash
$ mkdir event_manager
$ cd event_manager
$ mkdir lib
$ touch lib/event_manager.rb
```

Creating and placing your `event_manager.rb` file in `lib` directory is entirely
optional; however, it adheres to a common convention within most ruby applications.
The filepaths we use in this tutorial will assume that we have put our `event_manager.rb`
file within the `lib` directory.

Ruby source file names should be written all in lower-case characters and
instead of camel-casing multiple words together, they are instead separated by an
underscore (often called *snake_case*).

Open `lib/event_manager.rb` in your text editor and add the line:

```ruby
puts 'Event Manager Initialized!'
```

Validate that ruby is installed correctly and you have created the file correctly by running it from the root of your `event_manager` directory:


```bash
$ ruby lib/event_manager.rb
Event Manager Initialized!
```

If ruby is not installed and available on your environment path then you will be presented with the following message:


```bash
$ ruby lib/event_manager.rb
-bash: ruby: command not found
```

If this happens, see [the instructions for installing Ruby](https://www.theodinproject.com/courses/ruby-programming/lessons/installing-ruby-ruby-programming).

If the file was not created then you will be presented with the following error
message:


```bash
$ ruby lib/event_manager.rb
ruby: No such file or directory -- lib/event_manager.rb (LoadError)
```

If this happens, make sure the correct directory exists and try creating the file again.

For this project we are going to use the following sample data:

* [Small Sample](https://github.com/TheOdinProject/curriculum/tree/master/ruby_programming/files_and_serialization/event_attendees.csv)
* [Large Sample](https://github.com/TheOdinProject/curriculum/tree/master/ruby_programming/files_and_serialization/event_attendees_full.csv)

Download the *[small sample](https://raw.githubusercontent.com/TheOdinProject/curriculum/master/ruby_programming/files_and_serialization/event_attendees.csv)* csv file and save it in the root of the project directory, `event_manager`. Using your CLI, confirm that you are in the right directory and enter the following command:

```bash
$ curl -o event_attendees.csv https://raw.githubusercontent.com/TheOdinProject/curriculum/master/ruby_programming/files_and_serialization/event_attendees.csv
```

## Assignment: Clean Phone Numbers

Similar to the zip codes, the phone numbers suffer from multiple formats and
inconsistencies. If we wanted to allow individuals to sign up for mobile alerts
with the phone numbers, we would need to make sure all of the numbers are valid
and well-formed.

* If the phone number is less than 10 digits, assume that it is a bad number
* If the phone number is 10 digits, assume that it is good
* If the phone number is 11 digits and the first number is 1, trim the 1 and use the remaining 10 digits
* If the phone number is 11 digits and the first number is not 1, then it is a bad number
* If the phone number is more than 11 digits, assume that it is a bad number

## Assignment: Time Targeting

The boss is already thinking about the next conference: "Next year I want to
make better use of our Google and Facebook advertising. Find out which hours of
the day the most people registered, so we can run more ads during those hours."
Interesting!

Using the registration date and time we want to find out what the peak registration hours are.

* Ruby has [Date](https://rubyapi.org/2.7/o/date) and [Time](https://rubyapi.org/2.7/o/time) classes that will be very useful for this task.

* For a quick overview, check out this [Ruby Guides](https://www.rubyguides.com/2015/12/ruby-time/) article.

* Explore the documentation to become familiar with the available methods, especially `#strptime`, `#strftime`, and `#hour`.

## Assignment: Day of the Week Targeting

The big boss gets excited about the results from your hourly tabulations. It
looks like there are some hours that are clearly more important than others.
But now, tantalized, she wants to know "What days of the week did most people
register?"

* Use [Date#wday](https://rubyapi.org/2.7/o/date#method-i-wday) to find out the day of the week.
