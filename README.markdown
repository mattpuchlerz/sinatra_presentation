Attend the ChicagoRuby.org Meetup on May 16, 2009?
==================================================

Here you will find all the code and slides that were presented. Just a few things to note:

- The code in the [**master branch**][master] is what we started the presentation with. It contains the general directory structure of the app, established all the Cucumber features and their associated step definitions, and RSpec specifications for the `Game` model. The main `app.rb` is present, but only contains Sinatra's version of "Hello World".
- The code in the [**solution branch**][solution] is the finished app. The only differences between this branch and master is the completed `Game` model and `app.rb`.
- The code in the [**rest branch**][rest] is also a finished app, although much of the manual routing has been replaced with a single call to `#rest`, a method provided by the magical [sinatra-rest][sinatra-rest] extension.

Working with the Code
=====================

Cloning the Repo
----------------

    $ cd /where/you/keep/your/code/
    $ git clone git://github.com/mattpuchlerz/sinatra_presentation.git
    $ cd sinatra_presentation/
    $ git branch --track solution origin/solution
    $ git branch --track rest origin/rest

Running the Finished App
------------------------

As this is a *classic* Sinatra application, starting it up in development mode couldn't be easier:

    $ cd /path/to/sinatra_presentation/
    $ git checkout solution
    $ ruby app.rb

Assuming everything works the way it's supposed to, you should see something like this:

    == Sinatra/0.9.1.1 has taken the stage on 4567 for development with backup from Mongrel

Just open your browser and visit [http://localhost:4567](http://localhost:4567).

DIY: Developing It Yourself
---------------------------

Want to try and recreate the app yourself? **Start off with the code from the master branch.** When using Cucumber and RSpec for behavior-driven-development, you'd typically begin by writing the Cucumber features. In this exercise, however, that step has been completed for you in advance. Therefore, go ahead and run the features:

    $ cd /path/to/sinatra_presentation/
    $ cucumber features/

There will be a whole mess of failing tests--that's good! The first failure will mention something along the lines of **`uninitialized constant Game (NameError)`**. Not so surprisingly, if you run the RSpec specifications:

    $ spec spec/

You get the same error--awesome! Now go define a `Game` model class and run the tests again. That time you should receive a different error. Proceed on that way until all the features and specs pass. Good luck!



[master]:       http://github.com/mattpuchlerz/sinatra_presentation/tree/master
[solution]:     http://github.com/mattpuchlerz/sinatra_presentation/tree/solution
[rest]:         http://github.com/mattpuchlerz/sinatra_presentation/tree/rest
[sinatra-rest]: http://github.com/blindgaenger/sinatra-rest/