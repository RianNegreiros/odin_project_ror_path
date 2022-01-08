# PROJECT: EVENT MANAGER

Please note this tutorial has been adapted from The Turing School’s and Jump Start Lab’s [Event Manager](tutorials.jumpstartlab.com/projects/eventmanager.html) and updated to use GoogleCivic API

## Learning Goals

After completing this tutorial, you will be able to:


 - manipulate [file](https://rubydoc.info/stdlib/core/File) input and output
 - read content from a [CSV](https://rubydoc.info/stdlib/csv/file/README.rdoc) (Comma Separated Value) file
 - transform it into a standardized format
 - utilize the data to contact a remote service
 - populate a template with user data
 - manipulate [strings](rubydoc.info/stdlib/core/String)
 - access [Google’s Civic Information API](https://developers.google.com/civic-information/) through the [Google API Client Gem](https://github.com/googleapis/google-api-ruby-client)
 - use [ERB](rubydoc.info/stdlib/erb/ERB) (Embedded Ruby) for templating


This tutorial is open source. If you notice errors, typos, or have questions/suggestions, please [submit them to the project on GitHub](https://github.com/TheOdinProject/curriculum/blob/main/ruby_programming/files_and_serialization/project_event_manager.md).

## What We’re Doing in This Tutorial

Imagine that a friend of yours runs a non-profit organization around political activism. A number of people have registered for an upcoming event. She has asked for your help in engaging these future attendees. For the first task, she wants you to find the government representatives for each attendee based on their zip code.

## Initial Setup

Create a project directory folder named event_manager wherever you want to store your project. In the project directory, create another folder named lib and inside that folder create a plain text file named event_manager.rb. Using your command-line interface (CLI), you can enter the following commands:

```bash
$ mkdir event_manager
$ cd event_manager
$ mkdir lib
$ touch lib/event_manager.rb
```

Creating and placing your event_manager.rb file in lib directory is entirely optional; however, it adheres to a common convention within most ruby applications. The filepaths we use in this tutorial will assume that we have put our event_manager.rb file within the lib directory.

Ruby source file names should be written all in lower-case characters and instead of camel-casing multiple words together, they are instead separated by an underscore (often called snake_case).

Open lib/event_manager.rb in your text editor and add the line:

```bash
puts 'Event Manager Initialized!'
```

Validate that ruby is installed correctly and you have created the file correctly by running it from the root of your event_manager directory:

```bash
$ ruby lib/event_manager.rb
Event Manager Initialized!

```

If ruby is not installed and available on your environment path then you will be presented with the following message:

```bash
$ ruby lib/event_manager.rb
-bash: ruby: command not found
```

If this happens, [see the instructions for installing Ruby](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/installing-ruby-ruby-programming).

If the file was not created then you will be presented with the following error message:

```bash
$ ruby lib/event_manager.rb
ruby: No such file or directory -- lib/event_manager.rb (LoadError)
```

If this happens, make sure the correct directory exists and try creating the file again.

For this project we are going to use the following sample data:

- [Small Sample](https://github.com/TheOdinProject/curriculum/tree/master/ruby_programming/files_and_serialization/event_attendees.csv)
- [Large Sample](https://github.com/TheOdinProject/curriculum/tree/master/ruby_programming/files_and_serialization/event_attendees_full.csv)

Download the [small sample](https://raw.githubusercontent.com/TheOdinProject/curriculum/master/ruby_programming/files_and_serialization/event_attendees.csv) csv file and save it in the root of the project directory, event_manager. Using your CLI, confirm that you are in the right directory and enter the following command:

```bash
$ curl -o event_attendees.csv https://raw.githubusercontent.com/TheOdinProject/curriculum/master/ruby_programming/files_and_serialization/event_attendees.csv
```

After the file is downloaded, you should see something like:

```bash
 % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  2125  100  2125    0     0   3269      0 --:--:-- --:--:-- --:--:-- 12073
```