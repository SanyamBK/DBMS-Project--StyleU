from flask import Flask, render_template, request, redirect, url_for, session
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.secret_key = 'dbmsprojectstyleu'  # Setting the secret key

# Configuring the database connection
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/styleu'
  # Disable modification tracking

db = SQLAlchemy(app)

# Define your model classes here
class UserDetail(db.Model):
    __tablename__ = 'User_Details'
    UserID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    UserName = db.Column(db.String(100), nullable=False)
    Passwords = db.Column(db.String(100), nullable=False)
    Contact_Number = db.Column(db.String(100), nullable=False)
    Email_ID = db.Column(db.String(100), nullable=False)
    Address = db.Column(db.String(100), nullable=False)
    City = db.Column(db.String(100), nullable=False)
    State = db.Column(db.String(100), nullable=False)
    Pincode = db.Column(db.String(100), nullable=False)

class ClothingItem(db.Model):
    __tablename__ = 'Clothing_Item'
    ProductID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Brand = db.Column(db.String(100), nullable=False)
    Price = db.Column(db.Float, nullable=False)
    Sex = db.Column(db.Enum('M', 'F', 'U'), nullable=False)
    Size = db.Column(db.Integer, nullable=False)
    Colour = db.Column(db.String(100), nullable=False)
    Descriptions = db.Column(db.Text, nullable=False)
    Rating = db.Column(db.Integer, nullable=False)

class ProductFeedback(db.Model):
    __tablename__ = 'Product_Feedback'
    Product_FeedbackID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ProductID = db.Column(db.Integer, nullable=False)
    UserID = db.Column(db.Integer, nullable=False)
    Brand = db.Column(db.String(100), nullable=False)
    Customer_Name = db.Column(db.String(100), nullable=False)
    Feedback_date = db.Column(db.Date, nullable=False)
    Product_Descriptions = db.Column(db.Text, nullable=False)
    Product_Rating = db.Column(db.Integer, nullable=False)

class DeliveryPerson(db.Model):
    __tablename__ = 'Delivery_Person'
    AgentID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Agent_Name = db.Column(db.String(100), nullable=False)
    Contact_Number = db.Column(db.String(100), nullable=False)
    OrderID = db.Column(db.Integer, nullable=False)
    Person_Rating = db.Column(db.Integer, nullable=False)

class DeliveryFeedback(db.Model):
    __tablename__ = 'Delivery_Feedback'
    Delivery_FeedbackID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    AgentID = db.Column(db.Integer, nullable=False)
    Agent_Name = db.Column(db.String(100), nullable=False)
    UserID = db.Column(db.Integer, nullable=False)
    UserName = db.Column(db.String(100), nullable=False)
    Delivery_Feedback_Date = db.Column(db.Date, nullable=False)
    Delivery_Description = db.Column(db.Text, nullable=False)
    Delivery_Rating = db.Column(db.Integer, nullable=False)

class BrandTable(db.Model):
    __tablename__ = 'Brand_Table'
    BrandID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Brand = db.Column(db.String(100), nullable=False)
    Contact_number = db.Column(db.String(100), nullable=False)
    Email = db.Column(db.String(100), nullable=False)
    Brand_Rating = db.Column(db.Integer, nullable=False)
    Registered_Date = db.Column(db.Date, nullable=False)

class Cart(db.Model):
    __tablename__ = 'Cart'
    UserID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ProductID = db.Column(db.Integer, nullable=False)
    Quantity = db.Column(db.Integer, nullable=False)
    Value_Cart = db.Column(db.Integer, nullable=False)

class PurchaseHistory(db.Model):
    __tablename__ = 'Purchase_history'
    UserID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    OrderID = db.Column(db.Integer, nullable=False)
    Order_Date = db.Column(db.Date, nullable=False)
    Status_Order = db.Column(db.Enum('D', 'ND'), nullable=False)
    Delivery_Date = db.Column(db.Date, nullable=False)

class Inventory(db.Model):
    __tablename__ = 'Inventory'
    ProductID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Quantity = db.Column(db.Integer, nullable=False)

class OrderUser(db.Model):
    __tablename__ = 'Order_User'
    OrderID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Value_Order = db.Column(db.Integer, nullable=False)
    UserID = db.Column(db.Integer, nullable=False)
    Placement = db.Column(db.String(100), nullable=False)
    Delivery_Date = db.Column(db.Date, nullable=False)
    Delivery_Personnel = db.Column(db.String(100), nullable=False)
    ProductID = db.Column(db.Integer, nullable=False)
    Product_Name = db.Column(db.String(100), nullable=False)
    Status_Order = db.Column(db.Enum('D', 'ND'), nullable=False)
    AgentID = db.Column(db.Integer, nullable=False)

@app.route('/')
def home():
    # try:
    #     a = UserDetail.query.all()
    #     print(a)
    # except Exception as e:
    #     print(e)
    return render_template('home.html')

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/shop')
def product():
    return render_template('shop.html')

@app.route('/cart')
def cart():
    return render_template('cart.html')

#suits.html, gowns.html, dresses... shirts
@app.route('/shop/suits')
def suits():
    return render_template('suits.html')

@app.route('/shop/gowns')
def gowns():
    return render_template('gowns.html')

@app.route('/shop/dresses')
def dresses():
    return render_template('dresses.html')

@app.route('/shop/shirts')
def shirts():
    return render_template('shirts.html')

#about

@app.route('/about')
def about():
    return render_template('about.html')

#contact
@app.route('/contact')
def contact():
    return render_template('contact.html')


@app.route('/signup')
def signup():
    return render_template('signup.html')

@app.route('/success', methods=['GET', 'POST'])
def success():
    if request.method == 'POST':
        fullname = request.form.get('fullname')
        email = request.form.get('email')
        password = request.form.get('password')
        print(fullname, email, password)
    return render_template('success.html')


app.run(debug=True)
