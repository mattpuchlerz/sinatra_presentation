Attend the ChicagoRuby.org Meetup on May 16, 2009?
==================================================

Here you will find all the code and slides that were presented. Just a few things to note:

- The code in the [**master branch**][master] is what we started the presentation with. It establishes the general directory structure of the app, all the Cucumber features and their associated step definitions, and RSpec specifications for a `Game` model. The main `app.rb` is present, but only contains a couple `require` statements and your standard "Hello World".
- The code in the [**solution branch**][solution] is the finished `app.rb`. That's right, we've gone from "Hello World" to completed application in just one file!

An [HD video of the presentation][vimeo] is available in several chunks on Vimeo. *Note that the video chunks will be uploaded incrementally over the next week.*

Working with the Code
=====================

Installing the Dependencies
---------------------------

    $ sudo gem install rspec cucumber webrat sinatra datamapper do_sqlite3

Cloning the Repo
----------------

    $ cd /where/you/keep/your/code/
    $ git clone git://github.com/mattpuchlerz/sinatra_presentation.git
    $ cd sinatra_presentation/
    $ git branch --track solution origin/solution

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



[master]:   http://github.com/mattpuchlerz/sinatra_presentation/tree/master
[solution]: http://github.com/mattpuchlerz/sinatra_presentation/tree/solution
[vimeo]:    http://vimeo.com/album/93521