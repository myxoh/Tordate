Tordate
=======

Tordate is a News-based social Network where everyone can write / vote / read news. It's main goals are to:

###MAIN GOALS

* Keep it easy to read: 
    Users should always feel like their using a regular news site. We provide an editor tool that lets you add images and control the way your article looks.
* Don't JUST judge content:
    We want to make our voting system dependant on many aspects of the news: we added an add/vote counterevidence system, report lack of evidence system, and we have a rebuttle system planned. As of TODAY Only the general score is taking into account, we are far from our goal.
* Make it social:
    We need to generate an user-base and to do so, having share possibilities everywhere is a MUST.
* Now what you're going to read:
    Articles voted as lacking evidence, or having strong rebuttles may mean the article is false. Warnings BEFORE the article help the user better understand what they're reading and so they'll be able to skip bad articles.
* Never to delete an Article:
    Articles can be reported or downvoted, but never deleted. NO moderator should have the liberty to eliminate the free-speech of others.
* Every article should get a fair chance of being upvoted.
* The article flow shouldn't be dependant of people moving from the default view.
    We are working the default new as to include New Articles, we hope that we're doing it in such a manner that the article flow will move regardless of people going to the New section.


###Where we're standing  - where we're going
As of today the website is live, and almost doesn't have any users. As of today content is being grabbed of 4 sources and being updated to have some content available.

The content grabbing will STOP as soon as we have our own user-generated content.

AS for the users:

* We're planning to invest an initial 1000 U$D in advertising (mostly pay-for-action. We're going to pay for sign ups)

* Also we are planning to invest up to another 700 in a contest where the most voted article will win (The prize will be dependant on the amount of votes AND after a check for bots)

Why are telling you all this? We now the site NEEDS users, but it also needs developing. We want you to LIKE the idea, we want you to be an integral part of it.


###How to install

* Firstly make sure you have at LEAST Ruby 1.9 and that you have Rails 4.0

This are the following required gems. Please make sure you have the prerrequisite for those.
* gem 'omniauth-facebook'
* gem "paperclip", "~> 3.5"
* gem 'devise'
* gem 'therubyracer' 
* gem 'passenger'
* gem 'nokogiri'
* gem 'mysql2'

Modify your file at config/database.yml to reflect an existing database on MYSQL

run rake db:schema:load 

or all the migrations.



Open: configs file on root folder

Copy it's content

Lastly run on your console:


rails c

insert content here

end

rails s

AND you're done. Now you can access the site at localhost:3000



###About me, the project and Contact info


My name is Nicolas KLein. I'm an Argentina-based developers and had never worked on an open-source project. I might have done things wrongly and if so PLEASE contact me with your concerns!

My email es: myxoh10@gmail.com

I NEED someone to take interest and email me, to help me run things, at least until I get used to it.

The project's code is not really clean. Any suggestions to improve it are more than welcome, any questions email me. I'll answers As soon as Possible.


THanks for reading.
