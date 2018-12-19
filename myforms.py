from flask_wtf import FlaskForm
from wtforms import  StringField,PasswordField
from wtforms.validators import DataRequired,Email, Length, Regexp

class EmailPasswordForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(),Email()])
    password = PasswordField('Password', validators=[DataRequired(message="You must provide a password"),])

class UserRegForm(FlaskForm):
    name = StringField('Name', validators=[DataRequired(),Length(min=8, message="Your name is too short")])
    email = StringField('Email', validators=[DataRequired(),Email(message="Invalid Emaill")])
    password = PasswordField('Password', validators=[DataRequired(message="You must provide a password"), Length(min=6, message="Password Too short")])

class LoginForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(),Email(message="Invalid Emaill")])
    password = PasswordField('Password', validators=[DataRequired(message="You must provide a password"), Length(min=6, message="Password Too short")])


class BorowRegForm(FlaskForm):
    name = StringField('Name', validators=[DataRequired(),Length(min=8, message="Your name is too short")])
    email = StringField('Email', validators=[DataRequired(),Email(message="Invalid Emaill")])
    phone = StringField('Phone', validators=[DataRequired(),Length(min=10,message="short number provided"), Regexp('^[0-9]{10}$', message="You must provide 10 char Phone Number FORMAT [0794..]")])

class BookRegForm(FlaskForm):
    title=StringField('Title',validators=[DataRequired()])
    author=StringField('Author',validators=[DataRequired(),Length(min=3, message="Author Too short")])
    book_no=StringField('Book Number',validators=[DataRequired(), Regexp('^[A-Z](\/)[0-9]{4}$', message="Format should be B/xxxx")])