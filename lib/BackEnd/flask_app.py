
from flask import Flask, jsonify
from flask_restful import Api, Resource
import json
import jwt
from OpenSSL import SSL
import mysql.connector
from amazon import Amazon

app = Flask(__name__)
app.config["SECRET_KEY"] = "JSDJFJKLLSLAJJANEWONEWJNJ"
api = Api(app)


class fetch(Resource):
    def get(self, Uid, Name, Email):
        def CreateTable(Uid, Name, Email):
            Uid = Uid.lower()
            Name = Name.lower()
            Email = Email.lower()
            mydb = mysql.connector.connect(
                host="localhost", user="root", passwd="logon@123", database="EASY_SHOP")
            mycursor = mydb.cursor()
            mycursor.execute("select USER_ID from USERS")
            response = []
            for i in mycursor.fetchall():
                for j in i:
                    response.append(j)

            if Uid in response:
                pass
            else:
                query = "insert into USERS values('{}','{}','{}')".format(
                    Uid, Name, Email)
                mycursor.execute(query)
                query = """CREATE TABLE {} (asin varchar(500) COLLATE utf8_unicode_ci NOT NULL,initial_price float NOT NULL,update_price float,current_price float NOT NULL)""".format(
                    Uid)
                mycursor.execute(query)
                mydb.commit()

            mydb.close()
        CreateTable(Uid, Name, Email)
        Uid = Uid.lower()
        Name = Name.lower()
        Email = Email.lower()
        mydb = mysql.connector.connect(
            host="localhost", user="root", passwd="logon@123", database="EASY_SHOP")

        mycursor = mydb.cursor()

        query = "select asin from {}".format(Uid)
        mycursor.execute(query)
        res = mycursor.fetchall()
        asins = []
        for i in res:
            for j in i:
                asins.append(j)
        res = []
        temp = []
        data = []
        for i in asins:

            Uid = Uid.lower()
            query = """select PRODUCTS.name,{}.initial_price,{}.current_price,PRODUCTS.img_URL,PRODUCTS.URL,PRODUCTS.STORE from PRODUCTS,{} where {}.asin='{}' and {}.asin=PRODUCTS.asin""".format(
                Uid, Uid, Uid, Uid, i, Uid)

            mycursor.execute(query)

            res = mycursor.fetchall()

            for i in res:
                for j in i:
                    temp.append(j)
                data.append(temp)
                temp = []
        mydb.close()
        return data


class Add(Resource):
    def get(self, Uid, url):
        Uid = Uid.lower()
        try:
            a = Amazon.scrape(url)
            a[1] = a[1].replace('"', "'")
            if a == None or len(a) < 5:
                result = "INVALID"
            else:
                result = "Valid"
        except Exception:
            result = "Invalid"

        if result == "Valid":
            result = a
            mydb = mysql.connector.connect(
                host="localhost", user="root", passwd="logon@123", database="EASY_SHOP")
            mycursor = mydb.cursor()
            query = "select asin from PRODUCTS"
            mycursor.execute(query)
            res = mycursor.fetchall()
            ProductAsins = []
            asin = result[0]
            price = result[2]
            try:
                for i in res:
                    for j in i:
                        ProductAsins.append(j)

                if asin in ProductAsins:
                    pass
                else:
                    query = """insert into PRODUCTS values ("{}","{}","{}","{}","{}","{}")""".format(
                        result[0], result[1], result[2], result[3], result[4], result[5])
                    mycursor.execute(query)
                    mydb.commit()
            except Exception:
                query = """insert into PRODUCTS values ("{}","{}","{}","{}","{}","{}")""".format(
                        result[0], result[1], result[2], result[3], result[4], result[5])
                mycursor.execute(query)
                mydb.commit()
            print(query)
            try:
                query = "select asin from {}".format(Uid)
                mycursor.execute(query)
                res = mycursor.fetchall()

                UserAsins = []
                for i in res:
                    for j in i:
                        UserAsins.append(j)

                if asin in UserAsins:
                    mydb.close()
                    return "PRODUCT ALDREADY EXISTS"
                else:
                    query = """insert into {} values ("{}","{}","{}","{}")""".format(
                        Uid, asin, price, price, price)
                    print(query)
                    mycursor.execute(query)
                    mydb.commit()
                    mydb.close()
                    return "PRODUCT ADDED"

            except Exception:
                query = """insert into {} values ("{}","{}","{}","{}")""".format(
                    Uid, asin, price, price, price)
                mycursor.execute(query)
                mydb.commit()
                mydb.close()
                return "PRODUCT ADDED"
        else:
            return result


class UpdateLike(Resource):
    def get(self, Uid, Asin, LikeStatus):
        query = """update {} set LikeStatus = {} where asin = {}""".format(
            Uid, LikeStatus, Asin)
        mydb = mysql.connector.connect(
            host="localhost", user="root", passwd="logon@123", database="EASY_SHOP")
        mycursor = mydb.cursor()
        mycursor.execute(query)
        mydb.commit()


class Contact(Resource):
    def get(self, FirstName, LastName, Email, Message):
        print(FirstName)
        print(LastName)
        print(Email)
        print(Message)


class check(Resource):
    def get(self, check):
        return check


api.add_resource(
    fetch, '/fetch/<string:Uid>/<string:Name>/<string:Email>')
api.add_resource(
    check, '/check/<string:check>')
api.add_resource(
    Add, '/Add/<string:Uid>/<path:url>')
api.add_resource(
    Contact, '/Contact/<string:FirstName>/<string:LastName>/<string:Email>/<string:Message>')
api.add_resource(
    UpdateLike, '/UpdateLike/<string:Uid>/<string:Asin>/<string:LikeStatus>'
)
if __name__ == "__main__":
    try:
        app.run(host="0.0.0.0", debug=True,
                ssl_context='adhoc', port=8098)
    except Exception:
        import smtplib
        import smtplib
        from email.message import EmailMessage
        msg = EmailMessage()
        msg['Subject'] = "AIRLINE BOOKING CONFIRMATION"
        msg['From'] = "theeasyshop2021"
        msg['To'] = "imnaveed2003@gmail.com"
        msg.set_content("ALERT!!!! error in API")
        with smtplib.SMTP('smtp.gmail.com', 587) as smtp:
            smtp.ehlo()
            smtp.starttls()
            smtp.ehlo()
            smtp.login("theeasyshop2021@gmail.com", "echskgcnyzxribeh")

            smtp.send_message(msg)
