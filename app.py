from flask import Flask, render_template, request, redirect, flash, url_for

import mysql.connector as connector

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

    return render_template('usr_form.html')


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

    return render_template('brow_form.html')


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

    return render_template('books.html')

@app.errorhandler(404)
def error_page(e):
    return render_template('error.html')


if __name__ == '__main__':
    app.run(debug=True)
