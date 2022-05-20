# {{PROBLEM}} Web Design Recipe (Level Two)

## 1. Describe the Problem

_Put or write the user stories here. Add any clarifying notes you might have._
As a user
So that I can find my cat that I lost
I want to post an advert for a lost cat with some description of the cat, and my telephone number so people can contact me 
# C - POST description of the cat with a phone number

As a user
So that I can help others find their lost cats
I want to see all of the lost cat adverts
# R - GET a list of all posted cats

As a user
So that I can focus on the yet not-found cats
I want to delete adverts for cats that have been found
# D - DELETE adverts by index

As a user
So that I can update lost cat adverts with potential sightings
I want to update adverts
# U - PATCH description by index

## 2. Design the Interface

_This is the fun part! Use excalidraw.com or a similar tool to design some
wireframes (rough sketches of the user interface). Include interactions and
transitions between pages — those are the most critical part._

![Design example](./LostCatDesign.png)

## 3. Design the Data Model Classes

_These classes should store and manage the data the server will hold._
_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class LostCat
  def initialize
  end

  def adverts
    # Returns a list of instances of LostCatAdvert
  end

  def add(advert) # advert is a LostCatAdvert
    # No return value
  end

  def get(index) # index is a number
    # Returns an advert, the advert at the given index
  def

  def update(index, new_advert) # index is a number, new_advert is a LostCatAdvert
    # Updates the advert at index to be the new_advert
    # No return value
  end

  def remove(index) # index is a number
    # Deletes the advert at index
  end
end

class LostCatAdvert
  def initialize(description, phone_number)
    # description is a string
    # phone_number is a string
  end

  def description
    # Returns the description
  end

  def phone_number
    # Returns the phone number
  end
end
```

_Check them against these rules:_

> 1. Does they represent a collection or collections of data?
> 2. Does each collection have relevant methods to:
>    1. List out all items in the resource
>    2. Create an item (C)
>    3. Get a single item (R)
>    4. Update an item (U)
>    5. Delete an item (D)
> 3. Is it possible to construct a realistic data model just by using simple
>    data types? (strings, integers, booleans)
> 
> This is OK:
> ```ruby
> diary = Diary.new
> entry = DiaryEntry.new("Title", "Contents")
> diary.add(entry)
> # Ultimately only two strings enter the data model.
> ```
> 
> This is not:
> ```ruby
> diary = Diary.new
> entry = DiaryEntry.new("Title", ["Comment One", "Comment Two"])
> diary.add(entry)
> # In this case, a string and a list of strings enter the data model.
> # A list isn't a simple enough data type.
> ```
> 
> The reason for this is that we will be moving onto databases. Databases
> typically can only store simple data types, so we're keeping that discipline
> for now!
> 
> Some of these rules will be relaxed later but will keep you safe for now.

## 4. Design the Web API (Requests)

_Design requests that perform each of the key operations on your data model._
_Map them to the methods or code snippets in your data model._

```ruby
# EXAMPLE

# INDEX
# Request: GET /lost_cat
lost_cat.adverts

# CREATE
# POST /lost_cat
# With data: { description: "Black and white", phone_number: "07862835385" }
advert = LostCatAdvert.new(description, phone_number)
lost_cat.add(advert)

# READ
# GET /lost_cat/:index
lost_cat.get(index)

# UPDATE
# PATCH /lost_cat/:index
# With data: { description: "Brown and white", phone_number: "07860005385" }
advert = LostCatAdvert.new(description, phone_number)
lost_cat.update(index, advert)

# DELETE
# DELETE /diary/:index
lost_cat.remove(index)
```

> Remember:
> GET: Getting a single item or a list of items
> POST: Adding an item
> PATCH: Updating an item
> DELETE: Deleting an item

## 5. Create Examples of User Interactions

_Create examples of user interactions and expectations._

```ruby
# As you learn the testing tools you might start writing with realistic test
# code here, but at the start it's OK if it's just English or made up code.

# View no adverts
visit "/lost_cat"
# User sees: There are no adverts.

# Add an advert
visit "/lost_cat"
click link "Add Advert"
enter "Black and White" into "Description" field
enter "07862835385" into "Phone Number" field
click button "Post"
# User sees in the lost_cat list:
# Black and White
# 07862835385

# Multiple adverts
visit "/lost_cat"
click link "Add Advert"
enter "Black and White" into "Description" field
enter "07862835385" into "Phone Number" field
click button "Post"
click link "Add Advert"
enter "Orange and angry" into "Description" field
enter "07529102736" into "Phone Number" field
click button "Post"
# User sees in the lost_cat list:
# Orange and angry
# 07529102736
# Black and white
# 07862835385

# Updating an advert
visit "/lost_cat"
click link "Add Advert"
enter "Black and White" into "Description" field
enter "07862835385" into "Phone Number" field
click button "Post"
visit "/lost_cat"
click button "Edit Advert"
enter "Orange and angry" into "Description" field
enter "07529102736" into "Phone Number" field
click button "Post"
# User sees in the lost_cat list:
# Orange and angry
# 07529102736

# Deleting an advert
visit "/lost_cat"
click link "Add Advert"
enter "Black and White" into "Description" field
enter "07862835385" into "Phone Number" field
click button "Post"
visit "/lost_cat"
click button "Delete Advert"
# User sees: There are no adverts.

```

## 6. Test-Drive the Behaviour

_Follow this cycle:_

1. Add a feature test in `/spec/feature/` (RED)
2. Implement the behaviour in `app.rb`
3. Does it pass without data model changes? (GREEN) Then skip to step 6.
4. Otherwise, add a unit test for the data model to `/spec/unit` (RED)
5. Implement the behaviour in your data model class. (GREEN)
6. Apply any refactors to improve the structure of the code. (REFACTOR)  
   Run `rubocop` as part of this.
7. Go back to step 1.


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
