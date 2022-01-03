# Rule30Transloc
Implementation of the Rule 30 algorithm 

## A few notes on implementation 

### Swift UI 
I chose to implement this in Swift UI mostly because I have been using this break between jobs to go through the Hacking With Swift 100 days of SwiftUI course. This was my first chance to break out of the structured tutorials and really try something new. While reading up on the Rule 30 algorithm, I immediately realized that SwiftUI's compositional layout would make iterating over the arrays and setting up individuals views very easy. So the choice really was driven by both "hey, this tool works well for this job" and "oh yay, I get to play with the new toys!" 

### Testing 
I wrote some unit tests around my `Impelementer` functions. That's the main area of logic at work, so that's what I'd want tests around. In general, I don't write a lot of UI tests, mostly because I've found them to be very flakey--failing for unrelated reasons, like Daylight Savings Time messing up our clocks or the turn of a year breaking our age verification screen tests, etc. 

### The general experience 
I really enjoyed this! I did the bulk of the algo work before the holidays, then took about a week off to spend time with family, friends, and the Lego typewriter set I got for Christmas. Coming back to it, I'm pretty happy with the work I've done here. I had planned to set up something more elaborate that would allow the user to select two colors as well as a size for the pattern, but that seems a little extra. Maybe I'll keep tinkering with this and add to it later.  
