from flask import Flask, render_template, request, redirect, flash, url_for

import mysql.connector as connector

from datetime import date, timedelta

db = connector.connect(host="localhost", user="root", passwd="root", database="library")

app = Flask(__name__)

app.secret_key = 'jxbxjxdjdjdjddj'


@app.route('/')
def homes():
    return render_template('home.html')


# users uid, names, email, password, role
@app.route('/form', methods=['POST', 'GET'])
def forms():
    if request.method == "POST":
        name = request.form["name"]
        email = request.form["email"]
        role = request.form["role"]
        password = request.form["password"]

        print(name, email, password, role)
        cursor = db.cursor()
        sql = "INSERT INTO `users` (`name`, `email`, `password`, `role`) VALUES (%s,%s,%s,%s)"
        val = (name, email, password, role)
        cursor.execute(sql, val)
        db.commit()
        flash("Credentials Successfuly saved!")
        redirect(url_for('show_users'))

    return render_template('usr_form.html')


@app.route('/show_users')
def show_users():
    cursor = db.cursor()
    sql = "SELECT * FROM users"
    cursor.execute(sql)
    users = cursor.fetchall()
    return render_template('show_user.html', users=users)


@app.route('/borrow', methods=['POST', 'GET'])
def forms_bor():
    if request.method == "POST":
        name = request.form["name"]
        email = request.form["email"]
        phone = request.form["phone"]

        print(name, email, phone)
        cursor = db.cursor()
        sql = "INSERT INTO `borrowers` (`name`, `email`, `phone`) VALUES (%s,%s,%s)"
        val = (name, email, phone)
        cursor.execute(sql, val)
        db.commit()
        flash("Your Successfuly saved!")
        redirect(url_for('show_borrowers'))

    return render_template('brow_form.html')


@app.route('/show_borrowers')
def show_b():
    cursor = db.cursor()
    sql = "SELECT * FROM borrowers"
    cursor.execute(sql)
    borrowers = cursor.fetchall()
    return render_template('show_borrower.html', borrowers=borrowers)


@app.route('/books', methods=['POST', 'GET'])
def book():
    if request.method == "POST":
        title = request.form["title"]
        author = request.form["author"]
        category = request.form["category"]
        book_no = request.form["book_no"]

        print(title, author, category, book_no)
        cursor = db.cursor()
        sql = "INSERT INTO `books`(`title`, `author`, `category`, `book_no`) VALUES (%s,%s,%s,%s)"
        val = (title, author, category, book_no)
        cursor.execute(sql, val)
        db.commit()
        flash("Your Successfuly saved!")
        redirect(url_for('show_books'))

    return render_template('books.html')


@app.route('/show_books')
def show_books():
    cursor = db.cursor()
    sql = "SELECT * FROM `books`"
    cursor.execute(sql)
    books = cursor.fetchall()
    return render_template('show_books.html', books=books)


@app.route('/issue', methods=['POST', 'GET'])
def issue():
    if request.method == "POST":
        book_id = request.form["book_id"]
        borrower_id = request.form["borrower_id"]
        date_borrowed = date.today()
        expected_return = date.today() + timedelta(5)

        sql = "INSERT INTO `transactions`( `borrow_id`, `d_borowed`,  `expect_return_d`,`book_id`)" \
              " VALUES (%s,%s,%s,%s)"
        vals = (borrower_id, date_borrowed, expected_return, book_id)
        cursor = db.cursor()
        cursor.execute(sql, vals)
        db.commit()
        flash("Your Successfuly Issued Book!")

    cursor = db.cursor()
    sql = "SELECT `book_id`,`book_no` , `title` FROM `books`"
    cursor.execute(sql)
    books = cursor.fetchall()
    sql2 = "SELECT `bid`,`phone`, `name` FROM `borrowers`"
    cursor.execute(sql2)
    people = cursor.fetchall()
    return render_template('trans_form.html', books=books, people=people)


# This section is for Button

@app.route('/delete')
def remove():
    cursor = db.cursor()
    sql = "SELECT * FROM borrowers"
    cursor.execute(sql)
    borrowers = cursor.fetchall()
    return render_template('show_borrower.html', borrowers=borrowers)


@app.route('/del/<id>')
def del_ref(id):
    cursor = db.cursor()
    sql = "DELETE FROM borrowers WHERE bid=%s"
    cursor.execute(sql, (id,))
    db.commit()
    flash('Borrower Successfully Removed ')
    return redirect(url_for('remove'))


@app.errorhandler(404)
def error_page(e):
    return render_template('error.html')


if __name__ == '__main__':
    app.run(debug=True)
