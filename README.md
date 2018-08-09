# Whitaker Driver Kata Solution
`ruby lib/driving_history.rb`
or
`ruby lib/driving_history.rb your_input_file.txt`

If you run the application itself it will use the included input.txt file. If you want to run your own file, you may put your file in the root directory and reference it as an argument as shown above.
## rspec for testing
Originally I wanted to keep things simple and use the TestUnit library to handle my unit tests. As simple as it was, I still desired a bit more ease of use. I eventually pivoted into rspec because I wanted to have an easier time describing the behavior of the application rather than just cover lines of code. I feel that I can do both easier with rspec. My expectations should also be easier to read with rspec.

## Driving History Class
I started out with a Driving History class to handle the commands from the input file. I outlined an add motorist method (I used the word motorist rather than driver to avoid namespace collisions in Ruby) and an add trip method. I quickly realized that I will have to make a decision on how I would handle this data. I struggled with this decision a bit because I want my solutions to be as simple as possible. It is important to avoid any gold-plating when designing these solutions and I feel that using abstraction for these requirements does walk the line of gold-plating. Now the abstraction would be important for future scalability of the application but it is not a good practice to write code for future use. In my experience, a developer might assume that a product owner will eventually want a feature when in reality that feature is never requested.

Ultimately I decided to abstract out my motorist and trip data into seperate classes. While this is not necessary based on the current requirements, I decided to make an assumption that there are future features in the backlog of this project that will require this object modeling.

## Motorist Class
For the motorist, I originally wanted to initialize this object with a name string and a trips array. I wanted each motorist object to own its own array of trips. This quickly lead me to the creation of a trips class that I will get to shortly. Once I got to the output design of this solution, I realized that I wanted each motorist to keep track of how many miles it had driven, so I created an update miles driven method and made that attribute accessible to the driving history class.

## Trip Class
The trip class ended up being more complex than the motorist class because it needed to handle the average speed of the trip. I started with defining attributes for start time, end time, miles and average speed. The first three were trivially easy, but I ended up spending significant time on the average speed attribue. Ultimately I decided to use the Time library to determine the duration of the trip. I parsed the end time and then subtracted the parsing of the start time. I divided that all by 3600 to gain my trip duration in hours. I then divided the miles driven by that duration and rounded the output. I will admit that I could spend more time understanding when I should be rounding and when I shouldn't. My mph output for the example input was slightly off of the expected output for one of the drivers. This is either due to rounding in the wrong place or perhaps I need to refactor the total average mph for a motorist. 

## Read Input Module
Originally I had written my read and output commands in the same file as the driving history class. I eventually extracted the read input part into a module. I chose a module for this rather than a class because I only need one instance of this object. In contrast, I chose classes for driving history, motorist and trip because I wanted to be able to generate multiple instances of those objects.

## Spec For Driving History
My driving history spec only has 1 expectation. It takes the example input file and expects to see the expected output string. I changed the mph for Dan to 50 because I believe that my solution is calculating that attribute differently. I am taking the avg mph for each trip and getting the average of mph's. I understand that I could handle that differently and get a more accurate mph. I have taken the liberty to assume that my product owner is ok with the way I am doing the calculation. 

## Spec For Motorist
The motorist spec describes a motorist object and how it can be given a name, must start with 0 miles driven, can have its miles driven updated multiple times as well as miles being rounded. I could and should take this further and describe the trips that the motorist owns.

## Spec For Trip
The trip spec describes a trip object as well as describes the calculate speed method. A trip is expected to have all of its attributes as well as calculate average speed correctly.