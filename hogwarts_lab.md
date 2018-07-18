## Hogwarts lab

We've given you a starting point with all your models / sql / seeds pre-written (you lucky things!)

Don't forget to create your db, create the tables, seed your db!

#### Now:

- Add the RESTful routes for the students resource into the students controller
- Add the corresponding views

#### Notes:

- In this start code we have two models (with corresponding db tables) Student and House (One House can have MANY students). We've included a hard-coded `select` in `new.erb` so you can specify the house when you create a student. But you'll want to make this dynamic at some point...how can we get hold of `all` the houses...

- In our edit view we'll want to make our `select` reflect the current house of the student we are editing. 
