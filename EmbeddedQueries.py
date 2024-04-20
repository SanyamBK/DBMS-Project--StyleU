import pymysql

def fetchorders(user_id):
    connection = pymysql.connect(host='localhost', user='root', password='root', db='styleu')
    
    try:
        with connection.cursor() as cursor: 
            orders = "SELECT ProductID FROM Order_User WHERE UserID = %s"
            cursor.execute(orders, (user_id,))
            
            for row in cursor.fetchall():
                print(f"Product ID: {row[0]}")
    
    finally:
        connection.close()
        
        
def place_order(value_order, user_id, placement, delivery_date, delivery_personnel, product_id, product_name, status_order, agent_id):
    connection = pymysql.connect(host='localhost', user='root', password='root', db='styleu')
    
    try:
        with connection.cursor() as cursor:
            
            insert_order = """
            INSERT INTO Order_User (Value_Order, UserID, Placement, Delivery_Date, Delivery_Personnel, ProductID, Product_Name, Status_Order, AgentID) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(insert_order, (value_order, user_id, placement, delivery_date, delivery_personnel, product_id, product_name, status_order, agent_id))
        
        connection.commit()
    finally:
        connection.close()
        
        
#fetchorders(3)    
#place_order(2999, 1, 'Online', '2023-03-27', 'Ravi Kumar', 1, 'T-Shirt', 'D', 1)  
            