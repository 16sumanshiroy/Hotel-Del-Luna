import mysql.connector

# Establish connection to MySQL database
try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_password",
        database="hotel_del_luna"
    )
    cursor = conn.cursor()
    print("Connected to MySQL Database successfully!")

    # Fetch all customers
    cursor.execute("SELECT * FROM customers;")
    customers = cursor.fetchall()

    print("\nList of Customers:")
    for customer in customers:
        print(customer)

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    if conn.is_connected():
        cursor.close()
        conn.close()
        print("MySQL connection closed.")
