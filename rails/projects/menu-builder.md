# Menu Builder

 It's a common practice for small restaurants to create online menus as PDF's then link to the PDF from their website. This approach has downsides, not all browsers/devices display PDFs, the PDF aren't searchable by google and other bots, and they are not so easy to maintain. One thing that is nice about a PDF is that they are easy to create and design for a non-designer. There are online tools to build menus, but then the menu doesn't keep the exact look and feel of the business. In a perfect world a restaurant would have a web designer to create and maintain the look of their online menu, but that is another expense of a high margin industry.

 In this project we are going to create online menu builders for small local restaurants, with a custom design for each, this way the restaurant can have their builder and a nice custom design which matches their current menu and internal aesthetic.

 We will be working in pairs. Each pair will pick a restaurant to design for, here are three that I highly recommend:

 - [Plum](http://plumbistro.com)
 - [Chaco Canyon](http://chacocanyoncafe.com)
 - [Cafe Flora](http://www.cafeflora.com/menus.php)

 If you want to pick your own restaurant it must fit the following criteria and be approved by Bookis:

1. A local business (local to one of your homes is fine (DC, GA))
1. Current online menu is a PDF (or very obviously static HTML)
1. Multiple menus (Locations, breakfast, lunch, dinner)
1. A menu which is updated at least yearly

## Getting Started

In pairs,

1. begin by creating a new rails app on one computer.
1. Work as a team to get started, at least ensure everything is working by running the server and verifying the Rails welcome page is displayed.
1. When you are ready to work separately add and commit the entire application.
1. Create a repo on github
1. Add the github repo as a remote repository
1. Push the application to github.
1. The second person may now clone the application for local development

Since multiple people are now working on the same code base make sure you push code often in small commits. If a push is rejected it is because they remote code base has been updated, you need to pull the code before you push.

## Core Requirements

Build a database driven application where a user can do the following:

- On the Home page (url: `/`)
  - As a user I can view a list of current menu sections such as "Breakfast", "Dinner", "Appetizers", etc...
    - I can see the description of the section if it exists
    - I can see the Menu Items of each section with:
      - name
      - price
      - description if it exists
      - note if it exists
  - As a user I can click a link with the text "New menu section" to navigate to the New Menu Section page `/menu_sections/new`
  - I can click on the name of the section to take me to view that section (Section show `/menu_sections/:id`)
- New Menu Section page `/menu_sections/new`
  - As a user I can fill out a form for a new menu section:
    - I must add a name
    - I can choose to add a description
    - I can click a button which says "Create Menu section" to create a new menu section
    - After submitting the form, I am taken to the Section show page `/menu_sections/:id`
    - If the required field is not filled out I am returned to the same page with the error message "Name can't be blank"
- Section show page (url: `/menu_sections/:id`)
  - As a user I can see the sections name and description
  - As a user I can add a new MenuItem with:
    - I must add a name
    - I must add a price
    - I can choose to add a description
    - I can choose to add a note
    - I can click a button which says "Create Menu item" to add a menu item to this section
    - After submitting the form I am taken back to the same page `/menu_sections/:id`
    - If the required fields are not filled out I am returned to the same page with appropriate error messages
  - As a user I can see a list of Menu Items with:
    - name
    - price
    - description if it exists
    - note if it exists

Along with the above requirements your site should be styled approprately to fit with the clients current design. Feel free to take some creative liberty, but do not stray from their general aesthetic.

### Database Design

MenuItem
- name : string*
- description : text
- price : string*
- note : text
- menu_section_id : integer

MenuSection
- name : string*
- description : text

\* *Denotes a require field*

Wave 2
-------

Allow users the ability to modify and delete existing records.

- As a user I can Edit any menu section, with the same validation rules when creating a new menu section.
- As a user I can Edit any menu item, with the same validation rules when creating a new menu item.
- As a user I can delete any menu section
- As a user I can delete any menu item

Wave 3
-------

Allow the user to create separate menus for different locations or distinct menus.

- As a user I can create a new Menu
- When creating or editing a Menu section I can choose a menu to assign the section to.
- As a user when I view the home page I see all of the menus, each with their list of menu sections and menu items.

Menu
- name : string
- description : text

MenuSection
- menu_id : integer

Wave 4
------

Allow users to schedule menus for specific time periods.

- As a user I can choose a beginning date for a Menu
- As a user I can choose a end date for a Menu
- When I view the home page I only see Menus which have a end date and beginning date before and after now respectively.
