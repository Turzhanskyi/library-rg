# Library for RubyGarage v.1.0

#### The task is to create an application that'll help us manage the basic needs of our Library. The library contains the next entities: Authors, Books, Readers, and Orders.

- Library app must have an ability to add each of the entity to itself;
- Library app must be persisted, that’s why we must have the ability to store/load data from the library;
- Library must have the ability to show some custom statistics about the library processes.

### Technical specification:

- #### When we instantiate Library Class, all the entities must be loaded from the file.

- #### The library must have the ability for the next statistics:

  ### 1. Top Reader.

  ##### A top reader is the one that takes the most number of books. The quantity of returned top readers must be configurable. Default quantity is 1 reader.

  ### 2. Most Popular Books.

  ##### The most popular book is the book that was taken by READERS the most times. The quantity of returned most popular books must be configurable. Default quantity is 1 book.

  ### 3. Number of Readers of the Most Popular Books.

  ##### The number of readers that take one of the SOME_QUANTITY most popular books. By default, SOME_QUANTITY is 3

        * If a user takes, for example, both first most popular book and second most popular book, then we count him one time.

- #### The library must contain “seed” (root) file where you show how you use your library. The root file must contain:
  #### 1. Library instantiation.
  #### 2. Creating of all basic Entities in several examples.
  #### 3. Adding at least one example of each entity to Library instance.
  #### 4. Call of the “store/save” method.
  #### 5. Call of all 3 statistics methods.
