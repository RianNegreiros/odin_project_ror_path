### Assignment

```markdown
It’s time to put your newfound knowledge to good use. Let’s break our ***Calculator*** test.

1. Let’s implement a new test case for your ***#add*** method, written out for you below. Run the test to see the failure. Write the minimum code necessary to get **both** tests to pass, then refactor if necessary.

```ruby
    #spec/calculator_spec.rb
       
    describe Calculator do
      describe "#add" do
        it "returns the sum of two numbers" do
          # removed for brevity
        end
       
        # add this
        it "returns the sum of more than two numbers" do
          calculator = Calculator.new
          expect(calculator.add(2, 5, 7)).to eql(14)
        end
      end
    end
```

2. Write a test for a new ***Calculator*** method (***#multiply***, ***#subtract***, or ***#divide***) using a new ***describe*** block. Include at least one ***it*** block with an appropriate expectation clause. Get it to pass, and refactor if necessary.

3. In the terminal, try running your failing or passing tests with ***rspec --format documentation***. What’s different?

4. RSpec reads command line configurations from ***.rspec***, one of the two files generated when RSpec is initialized in a project. If you liked the output you got with ***--format documentation***, you can use the ***.rspec*** file to hold that flag. In doing so, you won’t have to type it in every time you run your test suite. Open the file in your text editor and, on a new line, add ***--format documentation***. For more information on configuring RSpec, see the docs [here](https://relishapp.com/rspec/rspec-core/v/3-7/docs/configuration).
```