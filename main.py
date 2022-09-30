from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from werkzeug.security import generate_password_hash,check_password_hash
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user
from flask_mail import Mail
import json

local_server = True
app = Flask(__name__)
app.secret_key = ''          # add any secret_key


#This is for unique user access
login_manager=LoginManager(app)
login_manager.login_view='login'




@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


#app.config['SQLALCHEMY_DATABASE_URL'] = 'mysql://username:password@localhost/database_table_name'              
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/bms'                                            
db=SQLAlchemy(app)          #passing app config to database



#Create required database

@app.route('/')                 
def index():
    
    return render_template('index.html')


@app.route('/bus')
def bus():
    return render_template('bus.html')


@app.route('/ticket',methods=['POST','GET'])
@login_required
def ticket():

    if request.method=="POST":
        em=current_user.email
        fname=request.form.get('fname')
        lname=request.form.get('lname')
        age=request.form.get('age')
        gender=request.form.get('gender')
        date=request.form.get('date')
        id=request.form.get('id')
        number=request.form.get('number')
        user1=Ticket.query.filter_by(email=em).first()       
        user2=Ticket.query.filter_by(id=id).first()
        if user1 and user2:
            flash("Passenger Already Exist","warning")
            return render_template('/ticket.html')
        query=db.engine.execute(f"INSERT INTO `ticket` (`id`,`email`,`fname`,`lname`,`age`,`gender`,`date`,`number`) VALUES ('{id}','{em}','{fname}','{lname}','{age}','{gender}','{date}','{number}')")
        query=db.engine.execute(f"INSERT INTO `passenger` (`id`,`tid`,`pemail`,`pfname`,`plname`,`age`,`gender`,`doj`,`pnumber`) SELECT DISTINCT(`id`),`tid`,`email`,`fname`,`lname`,`age`,`gender`,`date`,`number` FROM `ticket` WHERE `ticket`.`id`='{id}'")
        return redirect('/bookings')

    return render_template('ticket.html',bus=bus)




@app.route('/bookings')
@login_required
def bookings():
    em=current_user.email
    query=db.engine.execute(f"SELECT * FROM `ticket` WHERE `ticket`.`email`='{em}'")
    return render_template('booking.html',username=current_user.username,query=query)         



@app.route('/busdetails')
@login_required
def busdetails():
    query=db.engine.execute(f"SELECT * FROM `buses`")
    return render_template('busdetails.html',query=query)               



@app.route('/pas')
@login_required
def pas():
    em=current_user.email
    query=db.engine.execute(f"SELECT DISTINCT(`id`),`tid`,`pemail`,`pfname`,`plname`,`age`,`gender`,`doj`,`pnumber` FROM `passenger` WHERE `passenger`.`pemail`='{em}'")
    return render_template('pas.html',query=query)



@app.route("/finalbooking/<string:busno>",methods=['POST','GET'])
@login_required
def book(busno):
    
    posts=Buses.query.filter_by(busno=busno).first()                            
    if request.method=="POST":
        em=current_user.email
        bbusno=request.form.get('busno')
        bbusname=request.form.get('busname')
        bbuscomp=request.form.get('buscomp')
        bbustype=request.form.get('bustype')
        bsource=request.form.get('source')
        bdest=request.form.get('dest')
        bdept=request.form.get('dept')
        barrival=request.form.get('arrival')
        bprice=request.form.get('price')
        query=db.engine.execute(f"INSERT INTO `book`(`email`,`bbusno`, `bbusname`, `bbuscomp`, `bbustype`, `bsource`, `bdest`, `bdept`, `barrival`, `bprice`) VALUES ('{em}','{bbusno}','{bbusname}','{bbuscomp}','{bbustype}','{bsource}','{bdest}','{bdept}','{barrival}','{bprice}')")
        return redirect('/final')

    return render_template('finalbooking.html',posts=posts)



@app.route('/final')
@login_required
def final():
    em=current_user.email
    query=db.engine.execute(f"SELECT * FROM book WHERE `book`.`email`='{em}'")
    flash("Booking Confirmed","success")
    return render_template('finaldetail.html',query=query) 



@app.route('/busbook')
@login_required
def busbook():
    em=current_user.email
    query=db.engine.execute(f"SELECT * FROM book WHERE `book`.`email`='{em}'")
    return render_template('finaldetail.html',query=query) 






#For signup
@app.route('/signup',methods=['POST','GET'])
def signup():
    if request.method == "POST":
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')
        user=User.query.filter_by(email=email).first()
        if user:
            flash("Email Already Exist","warning")
            return render_template('/signup.html')
        encpassword=generate_password_hash(password)
        new_user=db.engine.execute(f"INSERT INTO `user` (`username`,`email`,`password`) VALUES ('{username}','{email}','{encpassword}')")
        flash("Signup Successfully. Please Login","success")
        return render_template('login.html')    

    return render_template('signup.html')



#For login
@app.route('/login',methods=['POST','GET'])
def login():
    if request.method == "POST":
        email = request.form.get('email')
        password = request.form.get('password')
        user=User.query.filter_by(email=email).first()

        if user and check_password_hash(user.password,password):
            login_user(user)
            flash("Login Successful","primary")
            return redirect(url_for('index'))
        else:
            flash("Invalid Credentials","danger")
            return render_template('login.html')

    return render_template('login.html')



#For logout
@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("Logout Successful","warning")
    return redirect(url_for('login'))


#For deleting account
@app.route('/deleteacc')
@login_required
def deleteacc():
    cid=current_user.id
    em=current_user.email
    db.engine.execute(f"DELETE FROM `user` WHERE `user`.`id`={cid}")
    db.engine.execute(f"DELETE FROM `ticket` WHERE `ticket`.`email`='{em}'")
    db.engine.execute(f"DELETE FROM `passenger` WHERE `passenger`.`pemail`='{em}'")
    db.engine.execute(f"DELETE FROM `book` WHERE `book`.`email`='{em}'")
    db.engine.execute(f"DELETE FROM `trigr` WHERE `trigr`.`email`='{em}'")
    flash("Your Account is Deleted Successfully","warning")
    return redirect(url_for('login'))



#For searching
@app.route('/search',methods=['POST','GET'])
@login_required
def search():
    if request.method=="POST":
        query=request.form.get('search')
        buscomp=Buses.query.filter_by(buscomp=query).first()       
        if buscomp:
            flash("Bus is Available","info")
        else:
            flash("Bus is not Available","danger")
    return render_template('index.html')



app.run(debug=True)     #For running this flask code