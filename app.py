from flask import Flask, render_template, request, redirect, flash, url_for, session

import mysql.connector as connector

from datetime import date, timedelta
from myforms import *

db = connector.connect(host="localhost", user="root", passwd="root", database="library")

app = Flask(__name__)

app.secret_key = 'jxbxjxdjdjdjddj'


@app.route('/')
def homes():
    if session.get('names') == None:
        return redirect(url_for('login'))
    return render_template('home.html')


# users uid, names, email, password, role
@app.route('/form', methods=['POST', 'GET'])
def forms():
    if session.get('names') == None:
        return redirect(url_for('login'))
    form=UserRegForm()
    if form.validate_on_submit():
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

    return render_template('usr_form.html', form=form)


@app.route('/show_users')
def show_users():
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor()
    sql = "SELECT * FROM users"
    cursor.execute(sql)
    users = cursor.fetchall()
    return render_template('show_user.html', users=users)


@app.route('/borrow', methods=['POST', 'GET'])
def forms_bor():
    if session.get('names') == None:
        return redirect(url_for('login'))
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
        redirect(url_for('show_borrower'))

    return render_template('brow_form.html')


@app.route('/show_borrower')
def show_borrower():
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor()
    sql = "SELECT * FROM borrowers"
    cursor.execute(sql)
    borrowers = cursor.fetchall()
    return render_template('show_borrower.html', borrowers=borrowers)


@app.route('/books', methods=['POST', 'GET'])
def book():
    if session.get('names') == None:
        return redirect(url_for('login'))
    form=BookRegForm()
    if form.validate_on_submit():
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

    return render_template('books.html', form=form)


@app.route('/show_books')
def show_books():
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor()
    sql = "SELECT * FROM `books`"
    cursor.execute(sql)
    books = cursor.fetchall()
    return render_template('show_books.html', books=books)


@app.route('/issue', methods=['POST', 'GET'])
def issue():
    if session.get('names') == None:
        return redirect(url_for('login'))
    if request.method == "POST":
        book_id = request.form["book_id"]
        borrower_id = request.form["borrower_id"]
        date_borrowed = date.today()
        expected_return = date.today() + timedelta(5)
        print(book_id)

        sql = "INSERT INTO `transactions`( `borrow_id`, `d_borowed`,  `expect_return_d`,`book_id`)" \
              " VALUES (%s,%s,%s,%s)"
        vals = (borrower_id, date_borrowed, expected_return, book_id)
        cursor = db.cursor()
        cursor.execute(sql, vals)
        db.commit()
        flash("Your Successfuly Issued Book!")

    cursor = db.cursor()
    sql = "SELECT `book_no`,`title`,`book_id` FROM `books`"
    cursor.execute(sql)
    books = cursor.fetchall()
    sql2 = "SELECT `bid`,`phone`, `name` FROM `borrowers`"
    cursor.execute(sql2)
    people = cursor.fetchall()
    db.commit()
    return render_template('trans_form.html', books=books, people=people)


# This section is for Button

@app.route('/delete')
def remove():
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor()
    sql = "SELECT * FROM borrowers"
    cursor.execute(sql)
    borrowers = cursor.fetchall()
    return render_template('show_borrower.html', borrowers=borrowers)


@app.route('/returns')
def returns():
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor(buffered=True)
    sql = "SELECT borrowers.bid, borrowers.name,transactions.trans_id,transactions.d_borowed,transactions.d_returned,transactions.expect_return_d,books.book_id,books.title,books.book_no FROM borrowers JOIN transactions ON borrowers.bid = transactions.borrow_id JOIN books ON books.book_id = transactions.book_id WHERE transactions.status= 'not Returned'"
    cursor.execute(sql)
    transactions = cursor.fetchall()
    db.commit()
    # print(transactions[0])
    redirect(url_for('show_returned'))
    return render_template('show_borrowed_books.html', transactions=transactions)


@app.route('/del/<id>')
def del_ref(id):
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor()
    sql = "DELETE FROM borrowers WHERE bid=%s"
    cursor.execute(sql, (id,))
    db.commit()
    flash('Borrower Successfully Removed ')
    return redirect(url_for('remove'))


@app.route('/show_returned')
def show_returned():
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor(buffered=True)
    sql = "SELECT borrowers.bid, borrowers.name,transactions.trans_id,transactions.d_borowed,transactions.d_returned,transactions.expect_return_d,books.book_id,books.title,books.book_no FROM borrowers JOIN transactions ON borrowers.bid = transactions.borrow_id JOIN books ON books.book_id = transactions.book_id WHERE transactions.status= 'Returned'"
    # sql2 = "UPDATE transactions SET d_returned = CURDATE();"
    cursor.execute(sql)
    transactions = cursor.fetchall()
    return render_template('show_returned_books.html', transactions=transactions)
@app.route('/completed')
def completed():
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor(buffered=True)
    sql = "SELECT borrowers.bid,borrowers.name,borrowers.phone,charges.days,charges.date_charged,charges.amount, charges.cid FROM borrowers JOIN charges ON borrowers.bid = charges.b_id WHERE charges.status = 'Paid'"
    # sql2 = "UPDATE transactions SET d_returned = CURDATE();"
    cursor.execute(sql)
    charges = cursor.fetchall()
    return render_template('show_completed.html', charges=charges)

@app.route('/charges')
def charges():
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor(buffered=True)
    sql = "SELECT borrowers.bid,borrowers.name,borrowers.phone,charges.days,charges.date_charged,charges.amount, charges.cid FROM borrowers JOIN charges ON borrowers.bid = charges.b_id WHERE charges.status = 'Not paid'"
    # sql2 = "UPDATE transactions SET d_returned = CURDATE();"
    cursor.execute(sql)
    charges = cursor.fetchall()
    return render_template('show_charges.html', charges=charges)

@app.route('/paid/<id>')
def paid(id):
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor()
    sql = "UPDATE charges SET status='Paid' WHERE cid=%s"
    cursor.execute(sql, (id,))
    db.commit()
    flash('charges paid Successfully ')
    return redirect(url_for('charges'))

@app.route('/returned/<id>')
def returned(id):
    if session.get('names') == None:
        return redirect(url_for('login'))
    cursor = db.cursor()
    sql2 = "SELECT * FROM transactions WHERE trans_id =%s"
    cursor.execute(sql2,(id,))
    result=cursor.fetchone()
    expected = result[4]
    return_date = date.today()
    if return_date>expected:
        # print('Overstayed')
        # print(abs(return_date-expected).days)
        days = abs(return_date-expected).days
        sql3 = "INSERT INTO `charges`( `b_id`, `t_id`, `days`, `date_charged`, `amount`)" \
               " VALUES (%s,%s,%s,%s,%s)"
        vals = (result[1],result[0],days,return_date,days*100)
        cursor.execute(sql3,vals)
        db.commit()

    sql = "UPDATE transactions SET status='returned', d_returned=%s WHERE trans_id=%s"



    # sql = "SELECT TIMEDIFF()"
    # section to calculate charges
    # expected_return = date.today() + timedelta(5)
    # sql2 = "SELECT if expect_return_d  > now(), expected_date, UPDATE charges SET amount=%s"
    # amount = 100
    # SELECT DATE_SUB("2018-12-18", INTERVAL 5 DAY)
    # SELECT DATE_SUB(now(), INTERVAL 5 DAY)

    cursor.execute(sql, (return_date, id))
    db.commit()
    flash('Returned Book Successfully ')
    return redirect(url_for('returns'))


# Login Section

@app.route('/login', methods=['GET', 'POST'])
def login():
    loginForm=EmailPasswordForm()
    if request.method == 'GET':
        return render_template('login.html', form=loginForm)
    if loginForm.validate_on_submit():
        email = request.form['email']
        password = request.form['password']
        cursor = db.cursor()
        sql = "SELECT * FROM users WHERE email=%s AND password=%s"
        vals = (email, password)
        cursor.execute(sql, vals)
        user = cursor.fetchone()
        if user:
            session['names'] = user[1]
            session['role'] = user[4]
            return redirect(url_for('homes'))
        else:
            flash('message', 'wrong username or password!')
    return render_template('login.html', form=loginForm)


@app.route('/logout')
def logout():
    if session.get('names') == None:
        return redirect(url_for('login'))
    session.pop('names')
    session.pop('role')
    return redirect(url_for('login'))


@app.errorhandler(404)
def error_page(e):
    return render_template('error.html')


if __name__ == '__main__':
    app.run(debug=True, port=8888)
