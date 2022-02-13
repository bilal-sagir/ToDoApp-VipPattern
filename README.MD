# Todo App
A simple offline todo app where you can manage your tasks and set a reminder on to receive a notification built using `VIP` architecture. The data is persisted via `CoreData`.

# Screens and Application Lifecycle
The application consists of two screens. Both screens follow the same pattern in which there is a unidirectonal control between ViewController, Interactor, and Presenter.
1. [Todo List](VipToDoApp/Items)

   The screen consists of a list of todo titles displayed in `UITableView` and can be searched through using `UISearchBar` with an additional sort button to enable sorting alphabetically in ascending or descending order.
2. [Todo Detail](VipToDoApp/Detail)

   This is the screen that is navigated to when the user wants to add a new todo by pressing on `Add ToDo` button or on an existing todo itself.
   This screen is used for creating, as well as editing a todo.
   
   It basically consists of a form made up of two `UITextField`s for entering the title and detail about the todo, and a `UIDatePicker` to set a notification time only for future dates.
   

# Todo Schema
Each and every todo is assigned a UUID, and must have a non-empty title. Additionally you can add detail, as well as set a date as to be reminded by receiving notification.

Here's the todo schema:

|      | `id`     | `title`  | `detail`            | `date`            |
| ---- | -------- | -------- | ------------------- | ----------------- |
| type | `String` | `String` | `String` (Optional) | `Date` (Optional) |


# Features
- Create (add) a new task by entering a short descriptive title.
  
  You can also enter additional details and set a reminder.
- Edit the task. You can edit all of the fields
- See all your tasks.
  
  Tasks are sorted by the time created as default, but can be further sorted alphabetically in ascending or descending order.
- Search among your tasks:
  
  If there is a match, then the app shows only the matches, and else, i.e., if there is no item matching your search, then all of the items are shown.
- Remove the task by swiping left.

# Screenshots
<p align="center">
<img width="30%" alt="Demo" src="https://user-images.githubusercontent.com/93740120/153737983-1fbdf3aa-bd43-41dd-bbbf-b19039465d78.gif"> 
<img width="30%" alt="NotificationDemo" src="https://user-images.githubusercontent.com/93740120/153738057-050b8d2b-0cd9-4aa5-aa2d-cc0b9e2d487e.gif">
</p>
