# MYFEED

The project was created in summer practice. When creating, we used such gems as: devise for working with users (login, registration, etc.); shrine for working with images; factory_bot_rails, rspec-rails, shoulda-matchers, database_cleaner-active_record, ffaker for testing,

Information about the project:

* Ruby version 2.7.3
* PostgresSQL database


Dependencies in the database:


    users     <---------------+-+---+ +
    posts     <---------------|-|-+-|-|-+
            > user_id     --- + | | | | |
    likes                       | | | | |
            > user_id     ----- + | | | |
            > post_id     ------- + | | |
    follows                         | | |
            > follower_id       --- + | |
            > being_followed_id --- + | |
    comments                          | |
            > user_id     ------------+ |
            > post_id     --------------+