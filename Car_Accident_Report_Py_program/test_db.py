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

          cursor = conn.cursor()
          cursor.execute("SELECT * FROM accident_record")
          data = cursor.fetchone()
          print(data)
