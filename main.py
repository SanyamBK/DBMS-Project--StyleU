from flask import Flask, render_template, request, redirect, url_for, session, flash, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_login  import LoginManager, UserMixin, login_user, login_required, logout_user, current_user, login_manager, LoginManager
from datetime import datetime, timedelta


local_server = True
app = Flask(__name__)
app.secret_key = 'dbmsprojectstyleu'  # Setting the secret key


login_manager = LoginManager(app)
login_manager.login_view = 'login'

@login_manager.user_loader
def load_user(user_id):
    return UserDetail.query.get(int(user_id))

# Configuring the database connection
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/styleu'
  # Disable modification tracking

db = SQLAlchemy(app)

# Define your model classes here
class UserDetail(UserMixin,  db.Model):
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
    User_Status = db.Column(db.Enum('Active', 'Blocked'), nullable=False, default='Active')
    def get_id(self):
        return str(self.UserID)

class ClothingItem(db.Model):
    __tablename__ = 'Clothing_Item'
    ProductID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Brand = db.Column(db.String(100), nullable=False)
    Price = db.Column(db.Float, nullable=False)
    Sex = db.Column(db.Enum('M', 'F', 'U'), nullable=False)
    Size = db.Column(db.Enum('XS', 'S', 'M', 'L', 'XL', 'XXL'), nullable=True)
    Colour = db.Column(db.String(100), nullable=True)
    Descriptions = db.Column(db.Text, nullable=False)
    Rating = db.Column(db.Integer, nullable=False)
    
    def get_price(self):
        return str(self.Price)

class LoginAttempts(db.Model):
    __tablename__ = 'Login_Attempts'
    AttemptID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    UserID = db.Column(db.Integer, db.ForeignKey('User_Details.UserID'), nullable=False)
    Attempt_Date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

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
    OrderID = db.Column(db.Integer, nullable=True)
    Person_Rating = db.Column(db.Integer, nullable=False)
    Status = db.Column(db.Enum('A', 'NA'), nullable=False)

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
    CartID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    UserID = db.Column(db.Integer, nullable=False)
    ProductID = db.Column(db.Integer, nullable=False)
    Size = db.Column(db.Enum('XS', 'S', 'M', 'L', 'XL', 'XXL'), nullable=False)  # Add this line
    Quantity = db.Column(db.Integer, nullable=False)
    Value_Cart = db.Column(db.Float, nullable=False)  # Corrected to db.Float instead of db.Double

    # Add the rest of your model definition here


class PurchaseHistory(db.Model):
    __tablename__ = 'Purchase_history'
    Purchase_ID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    UserID = db.Column(db.Integer, nullable=False)
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
    Value_Order = db.Column(db.Float, nullable=False)
    UserID = db.Column(db.Integer, nullable=False)
    Placement = db.Column(db.String(100), nullable=False)
    Delivery_Date = db.Column(db.Date, nullable=False)
    Delivery_Personnel = db.Column(db.String(100), nullable=False)
    ProductID = db.Column(db.Integer, nullable=False)
    Product_Name = db.Column(db.String(100), nullable=False)
    Product_Size = db.Column(db.Enum('XS', 'S', 'M', 'L', 'XL', 'XXL'), nullable=False)
    Quantity = db.Column(db.Integer, nullable=False)
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



@app.route('/profile', methods=['POST', 'GET'])
def success():
    if not current_user.is_authenticated:
        return redirect(url_for('login'))
    
    return render_template('success.html', user=current_user)

@app.route('/login', methods=['POST', 'GET'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('success'))
    
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        user = UserDetail.query.filter_by(Email_ID=email).first()
        if user and user.Passwords == password and user.User_Status == 'Active':
            # Clear the login attempts on successful login
            LoginAttempts.query.filter_by(UserID=user.UserID).delete()
            db.session.commit()
            login_user(user)
            return redirect(url_for('success'))
        
        if user and user.Passwords == password and user.User_Status == 'Blocked':
            error_message = 'User is blocked. Please contact support to unblock your account.'
            return render_template('login.html', error_message=error_message)
        
        elif user and user.Passwords != password:
            if user.User_Status == 'Blocked':
                error_message = 'User is blocked. Please contact support to unblock your account.'
                return render_template('login.html', error_message=error_message)
            # Insert a record into the login attempts table on failed login
            attempt = LoginAttempts(UserID=user.UserID)
            db.session.add(attempt)
            db.session.commit()
            # Check the number of failed attempts for the user filter by date and user ID, check for past 24 hours
            failed_attempts = LoginAttempts.query.filter(LoginAttempts.Attempt_Date >= datetime.now() - timedelta(days=1), LoginAttempts.UserID == user.UserID).count()
            remaining_attempts = 5 - failed_attempts      
            error_message = f'Incorrect password. {remaining_attempts} attempts remaining.'
            return render_template('login.html', error_message=error_message)
        
        else:
            error_message = 'User not found. Please sign up to continue.'
            return render_template('login.html', error_message=error_message)

    return render_template('login.html')

@app.route('/admin/inventory')
def inventory():
    inventory_data = Inventory.query.all()
    for item in inventory_data:
        item.clothing_item = ClothingItem.query.get(item.ProductID)
    return render_template('inventory.html', inventory=inventory_data)


@app.route('/signup', methods=['POST', 'GET'])
def signup():
    error_message = None
    if request.method == 'POST':
        # Your signup logic...
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')
        contact_number = request.form.get('contact_number')
        address = request.form.get('address')
        city = request.form.get('city')
        state = request.form.get('state')
        pincode = request.form.get('pincode')
        existing_user = UserDetail.query.filter_by(Email_ID=email).first()
        
        if existing_user:
            error_message = 'User with this email already exists. Please use a different email.'
            return render_template('signup.html', error_message=error_message)
        else:
            # If the email is unique, create a new user
            new_user = UserDetail(
                UserName=username,
                Passwords=password,
                Contact_Number=contact_number,
                Email_ID=email,
                Address=address,
                City=city,
                State=state,
                Pincode=pincode,
                User_Status='Active'
            )
            db.session.add(new_user)
            db.session.commit()
            success_message = 'User created successfully. Please login to continue.'
            return render_template('login.html', success_message=success_message)
            
    return render_template('signup.html')

@app.route('/logout', methods=['GET', 'POST'])
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

@app.route('/shop')
def product():
    return render_template('shop.html')

@app.route('/cart', methods=['GET', 'POST'])
def cart():
    if not current_user.is_authenticated:
        return redirect(url_for('login'))
    
    if request.method == 'POST':
        try:
            # Retrieve form data
            product_id = request.form.get('product_id')
            size = request.form.get('size')
            quantity = int(request.form.get('quantity'))
            clothing_item = ClothingItem.query.filter_by(ProductID=product_id).first()
            price = clothing_item.get_price()
            # Check if the same product is already in the user's cart
            existing_cart_item = Cart.query.filter_by(UserID=current_user.UserID, ProductID=product_id).first()

            if existing_cart_item:
                # If the same product is found in the cart, increment the quantity and update the cart value
                existing_cart_item.Quantity += quantity
                if (existing_cart_item.Quantity < 1):
                    # delete the item from the cart if the quantity is less than 1
                    db.session.delete(existing_cart_item)
                else:
                    existing_cart_item.Value_Cart = existing_cart_item.Quantity * clothing_item.Price
            else:
                total_value = quantity * price
                # Add item to cart
                new_cart = Cart(
                    UserID=current_user.UserID,
                    ProductID=product_id,
                    Size=size,
                    Quantity=quantity,
                    Value_Cart=total_value
                )
                db.session.add(new_cart)
            
            db.session.commit()
            flash('Product added to cart successfully!', 'success')  # Flash message
            cart_items = Cart.query.filter_by(UserID=current_user.UserID).all()
            return redirect(url_for('cart'))
        except Exception as e:
            db.session.rollback()
            flash('Error adding product to cart. Please try again later.', 'error')
            app.logger.error(f'Error adding product to cart: {e}')

    # Fetch cart items associated with the current user
    cart_items = Cart.query.filter_by(UserID=current_user.UserID).all()
    
    total_cart_value = 0
    
    for item in cart_items:
        item.clothing_item = ClothingItem.query.get(item.ProductID)
        total_cart_value += item.Value_Cart
        
    # Render cart page with cart items
    return render_template('cart.html', cart_items=cart_items, total_cart_value=total_cart_value)

@app.route('/order-history', methods=['GET', 'POST'])
def order_history():
    if not current_user.is_authenticated:
        return redirect(url_for('login'))
    
    if request.method == 'POST':
        
        # if cart is empty, show error message
        cart_items = Cart.query.filter_by(UserID=current_user.UserID).all()
        if not cart_items:
            error_message = 'Cannot place an order with an empty cart. Please add some items to the cart and then try again.'
            return render_template('cart.html', error_message=error_message)
        
        total_quantity = sum(item.Quantity for item in cart_items)
        if total_quantity > 10:
            error_message = 'You cannot order more than 10 items at once.'
            cart_items = Cart.query.filter_by(UserID=current_user.UserID).all()
    
            total_cart_value = 0
            
            for item in cart_items:
                item.clothing_item = ClothingItem.query.get(item.ProductID)
                total_cart_value += item.Value_Cart
                
            # Render cart page with cart items
            return render_template('cart.html',error_message=error_message, cart_items=cart_items, total_cart_value=total_cart_value)
        
        # Handle the case when the order is placed successfully
        cart_items = Cart.query.filter_by(UserID=current_user.UserID).all()
        for item in cart_items:
            # Calculate delivery date as 7 days from the current date
            delivery_date = datetime.now() + timedelta(days=7)
            item_size = item.Size
            # Find the first available delivery personnel
            delivery_personnel = DeliveryPerson.query.filter_by(OrderID=None).first()
            clothing_item = ClothingItem.query.get(item.ProductID)
            
            # Create a new order
            new_order = OrderUser(
                Value_Order=item.Value_Cart,
                UserID=current_user.UserID,
                Placement='Online',
                Delivery_Date=delivery_date,
                Delivery_Personnel=delivery_personnel.Agent_Name if delivery_personnel else 'Unknown',
                ProductID=item.ProductID,
                Product_Name=clothing_item.Descriptions,
                Product_Size=item_size,
                Quantity=item.Quantity,
                Status_Order='ND',
                AgentID=delivery_personnel.AgentID if delivery_personnel else None
            )
            db.session.add(new_order)
            
            db.session.commit()
            #add to purchase history
            purchase_history = PurchaseHistory(
                UserID=current_user.UserID,
                OrderID=new_order.OrderID,
                Order_Date=datetime.now(),
                Status_Order='ND',
                Delivery_Date=delivery_date
            )
            
            db.session.add(purchase_history)
 
            # Update the order ID for the assigned delivery personnel
            if delivery_personnel:
                delivery_personnel.OrderID = new_order.OrderID
            
            # Reduce the quantity of the product from the inventory
            inventory_item = Inventory.query.filter_by(ProductID=item.ProductID).first()
            if inventory_item:
                inventory_item.Quantity -= item.Quantity

        # Clear the cart after placing the order
        Cart.query.filter_by(UserID=current_user.UserID).delete()
                
        success_message = 'Order placed successfully!'
        db.session.commit()
        
        order_history = OrderUser.query.filter_by(UserID=current_user.UserID).all()
    
        for order in order_history:
            order.clothing_item = ClothingItem.query.get(order.ProductID)
            
        return render_template('orders.html', order_history=order_history, success_message=success_message)
    
    # Fetch order history associated with the current user using purchase history
    order_history = OrderUser.query.filter_by(UserID=current_user.UserID).all()
    
    for order in order_history:
        order.clothing_item = ClothingItem.query.get(order.ProductID)
    
    return render_template('orders.html', order_history=order_history)


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




app.run(debug=True)
