Lighthouse Labs week 4 assignments

**First Sinatra App (Tutorial) - Requirements**

    1. Create DB
    2. The /messages URL
       First, let's add a /messages path to our app where people will see a list of all messages.
       However, we'd like to render an HTML page so that we can separate our View logic from our other logic. 
       Create an empty folder in app/views called messages and within it create an empty file index.erb. It's convention to 
       call the list page an index page. It's an index of all the messages. Makes sense.
       In the actions.rb file, instead of having the /messages action return just a hardcoded string, let's change that to 
       tell Sinatra to render the correct HTML file:
    3. The Model & Table
       We need to store messages in our database. For this we need two things:
        -The DB table - Generate and run the migration to create messages table
        -The AR model - Create a Message class that inherits ActiveRecord::Base
    4. Make /messages display all Messages
       Every time a user sends an HTTP request to /messages, our server needs to load the messages from the database, 
       render them as HTML, and send that HTML back as a response to their browser. Let's do that now.
    5. Submitting a message (Part A: The Form page)
       Let's allow users to submit a new message. For this we need an HTML <form> with some <input> fields for the user to 
       fill out prior to submitting the form to our server.
       Let's create this page now.
       Create an erb file in app/views/messages/new.erb and render it via a /messages/new URL path.
       Let's also modify the index page to contain a link to our new action that contains the form
    6. Submitting a message (Part B: The POST action)
       We usually want forms to submit some new data to the server, like in this situation, and hence the submission 
       should perform an HTTP POST request to the server, so we have to tell Sinatra to accept this action.
    7. Message details page
       Let's make it so that we can click on the message title to go the message details page, where we would ideally 
       see additional information about the message.
       Let's add a get action that can respond to a URL like /messages/5. Instead of defining an action for each 
       potential message ID, which would be insane, we will just define one action that will accept any ID in the URL.
       The :id in the action path is special. It tells sinatra to match anything and give it back to us as a param. 
       Since the :id is the record ID of the message, we can use AR's find method to grab it from the DB. Sick!
       Now we implement the show.erb view template with some simple HTML+ERB that displays the details of @message
    8. Validation (Part A)
       Right now we can create a message with all fields blank, which is not ideal. Let's fix that. ActiveRecord 
       validations to the rescue!
       We'll also have to modify our action so that it can handle a failure to save a record due to validation checks 
       failing
       Convention is to redirect upon success, and render erb upon failure. So it shows you the form again if it can't 
       save it
    9. Validation (Part B)
       Okay so let's modify the form so that it shows the errors.
    10. Validation (Part C)
       The reason for the form clearing even when it is rerendered is that for a form input field to have a default 
       value, it needs a value attribute set on it. So in the event that the form is being rendered for an existing 
       message creation attempt, we need to default the values for each of the fields.
       Let's modify our 3 form inputs to have a value from the @message object
    10. Validation
       We've technically fixed both the issues with handling validation, but our code can be slightly cleaner. Take a 
       look at the commit to see what was changed.
    11. Rejoice
    12. Enhance!
      Take it from here, making the following changes to the app.
        1. Remove title field
        We've decided to pivot our product and compete directly with Twitter. Tweets don't have a title. Let's remove 
        that field completely.
        2. Add url field
        Add a URL field . It should be optional (not required) when posting a message. If it's provided, a link will be 
        displayed alongside our message allowing people to click it to visit that URL.

**Music Wall (CR) - Requirements**

    _The Model_
    The track model can include the following fields/attributes:
    - Song Title (required)
    - Author (required)
    - URL (optional)
    - Timestamps (created_at and updated_at, as you should have with all tables)
    
    _The Actions_
    Any visitor will be able to create and view the list of music (songs). Similar to the previous app, don't worry 
    about implementing the ability to update or delete songs. Once they're up, they're up. Crazy, I know!
