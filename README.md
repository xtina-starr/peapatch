# Ada Pea Patch

Ada Pea Patch is an application written for weeks 14 and 15 of Ada Developers Academy.
This application was made by Christina and Ellen.

## To Log In with Twitter
+ You must have the twitter credentials. Email us to get those credentials, or create your own app and add the credentials to `config/application.yml`

## To Create Administrators
+ Have the user you want to be an administrator log in with Twitter. 
+ Open up the terminal and type `rails console`
+ Type `a = User.find_by(username: TWITTER_HANDLE)`, where TWITTER_HANDLE is the handle of the user you want to make an administrator
+ Type `User.update(a, admin: true)`

## To Send Emails on Creation of Blog Posts
+ You must have the email credentials. Email us to get those credentials, or put your own email address and password in `config/application.yml`
+ Open a terminal window and type `redis-server`
+ Open another terminal window and type `rake resque:work QUEUE='*'`
+ Create a new blog post!

## To Get Scheduled Updates, Including Alerts of Upcoming Events
+ Open a terminal window and type `redis-server`
+ Open another terminal window and type `rake resque:scheduler