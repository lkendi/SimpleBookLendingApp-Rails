# **Simple Book Lending App - Rails**

[](https://github.com/lkendi/BookLendingLibrary-Rails#booklendinglibrary---rails-library-management-system)

[![Rails Version](https://camo.githubusercontent.com/f0a5b2432529e1f98d42fdd50ba331d9987620ffa18fd25154938597af10688e/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f5261696c732d382e302e302d726564)](https://camo.githubusercontent.com/f0a5b2432529e1f98d42fdd50ba331d9987620ffa18fd25154938597af10688e/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f5261696c732d382e302e302d726564)  
[![Ruby Version](https://camo.githubusercontent.com/d96c29311a3fe2f13164883317c45d1f115acaa2029ebafffe1a1682455bb816/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f527562792d332e322e302d677265656e)](https://camo.githubusercontent.com/d96c29311a3fe2f13164883317c45d1f115acaa2029ebafffe1a1682455bb816/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f527562792d332e322e302d677265656e)

A simple book lending application built using Ruby on Rails. It enables users to view, add, update and delete books as well as borrow, return and view lending histories.

## Features
- **Book Management:** Create, read, update, and delete books.
- **Lending History:** Record when books are lent and returned.
- **Return Functionality:** Mark a lending as returned by setting the return timestamp.
- **Filtering:** Search lendings by borrower name and filter for active lendings (books not yet returned).
- **Responsive UI:** Built with Tailwind CSS for a modern, responsive design.

## Technologies
- Ruby on Rails 8
- SQLite3 (development)
- Tailwind CSS

### Installation
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/SimpleBookLendingApp-Rails.git
   cd SimpleBookLendingApp-Rails
   ```
2. **Install Dependencies**
    ```bash
    bundle install
    ```
3. **Run Database Migrations**
    ```bash
    rails db:migrate
    ```
- Optionally, you can load a few database records using
    ```bash
    rails db:fixtures:load
    ```

### Running the Application
Start the Rails server:
```bash
rails server
```

Then open your browser and navigate to `http://localhost:3000` to view the application.

### Running Tests
To run the tests, use:
```bash
rails test
```
