

def CheckPrice():
    import mysql.connector
    from amazon import Amazon
    import json

    def send_email(email, message):
        import smtplib
        import smtplib
        from email.message import EmailMessage
        msg = EmailMessage()
        msg['Subject'] = "AIRLINE BOOKING CONFIRMATION"
        msg['From'] = "theeasyshop2021"
        msg['To'] = email
        msg.set_content(message)
        with smtplib.SMTP('smtp.gmail.com', 587) as smtp:
            smtp.ehlo()
            smtp.starttls()
            smtp.ehlo()
            smtp.login("theeasyshop2021@gmail.com", "echskgcnyzxribeh")

            smtp.send_message(msg)

    mydb = mydb = mysql.connector.connect(
        host="localhost", user="root", passwd="logon@123", database="EASY_SHOP")
    mycursor = mydb.cursor()

    query = "show tables"
    mycursor.execute(query)
    UserTables = []
    res = mycursor.fetchall()

    for i in res:
        for j in i:
            if j != "users" and j != "products":

                UserTables.append(j)

    query = "select asin,URL from products"
    mycursor.execute(query)
    res = mycursor.fetchall()
    products = {}
    for i in res:
        products[i[0]] = i[1]
    UpdatedPrice = {}
    for i in products:
        result = Amazon.scrape(products[i])
        UpdatedPrice[result[0]] = result[2]
    for i in UserTables:
        query = "select asin,initial_price from {}".format(i)

        mycursor.execute(query)
        res = mycursor.fetchall()
        UserOldData = {}
        UserNewData = {}

        for x in res:
            try:
                UserOldData[x[0]] = float(x[1])
            except Exception:
                UserOldData[x[0]] = x[1]
        for asin in UserOldData:

            UserNewData[asin] = UpdatedPrice[asin]
            if UserOldData[asin] != UserNewData[asin]:
                query = """update {} set update_price='{}' and current_price='{}' where asin="{}" """.format(
                    i, UpdatedPrice[asin], UpdatedPrice[asin], asin)
                print(query)
                mycursor.execute(query)
                mydb.commit()

        for j in UserNewData:
            asin = j
            if (type(UserOldData) == float and type(UserNewData) == float and UserOldData[j] > UserNewData[j]) or (UserOldData[j] == "N/A" and UserNewData[j] != "N/A"):
                query = """select USER_NAME,USER_EMAIL from users where USER_ID='{}'""".format(
                    i)
                mycursor.execute(query)
                details = []
                for y in mycursor.fetchall():
                    for z in y:
                        details.append(z)
                OldPrice = UserOldData[j]
                NewPrice = UserNewData[j]
                query = "select name,STORE,URL from products where asin = '{}'".format(
                    j)
                mycursor.execute(query)
                ProductDetails = []
                for y in mycursor.fetchall():
                    for z in y:
                        ProductDetails.append(z)

                if UserOldData[j] == "N/A" and UserNewData[j] != "N/A":
                    message = """
Dear {}

We are honored to have you as our User.
We are always looking new ways to improve our app 
and delight our users.

The product your looking forward to buy
is back in stock

Product Details

Name: {}

Price: {}

Store: {}

URL: {}
""".format(details[0], ProductDetails[0], UserNewData[j], ProductDetails[1], ProductDetails[2])
                else:
                    final = NewPrice
                    orignal = NewPrice
                    percent = (final-orignal)
                    percent = percent/orignal
                    percent = percent*100
                    message = """
Dear {}

We are honored to have you as our User.
We are always looking new ways to improve our app 
and delight our users.

The product you are looking forward to buy has drop
down its price

Product Details

Name: {}

Store: {}

Initial Price: {}

Current Price: {}

Discount: {}%

URL: {}

""".format(details[0], ProductDetails[0], ProductDetails[1], orignal, final, percent, ProductDetails[2])

                send_email(details[1], message)
