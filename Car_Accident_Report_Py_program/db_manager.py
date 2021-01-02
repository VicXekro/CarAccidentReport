from sshtunnel import SSHTunnelForwarder
import MySQLdb as db

host = '3.17.59.144'
localhost = '127.0.0.1'
ssh_username = 'ubuntu'
ssh_private_key = '/home/pi/Documents/ubuntu_server_1604.pem'

# database variables
user='root'
password='asdfgh'
database='car_accident'

def get_connector(lat, lng):
    """
    Connect to the MYSQL server on the EC2 instance through SSH and return
    connector that will help handle the database.
    """
    with SSHTunnelForwarder(
              (host, 22),
              ssh_username=ssh_username,
              ssh_private_key=ssh_private_key,
              remote_bind_address=(localhost, 3306)
         ) as server:
              conn = db.connect(host=localhost,
              port=server.local_bind_port,
              user=user,
              passwd=password,
              db=database)

              sql = "INSERT INTO accident_record(latitude,longitude,date) VALUES (%s,%s,now())"
              val=(lat,lng)
              
              cursor = conn.cursor()
              cursor.execute(sql,val)
              conn.commit()
              print("Done")
              
              

"""def upload_location(lat,lng):
    cursor = get_connector().cursor()

    cursor.execute("SELECT * FROM accident_record")
    data = cursor.fetchone()
    print(data)
    
    sql = "INSERT INTO accident_record(latitude,longitude,date) VALUES (%s,%s,now())"
    val=(lat,lng)
    cursor.execute(sql,val)
    cursor.close()
"""
