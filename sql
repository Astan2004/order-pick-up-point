import pyodbc

connection = pyodbc.connect('Driver={SQL Server};' 'Server=DESKTOP-C27D013\MSSQLSERVERCOMP;'
                            'Database=PVZ;' 'Trusted_connection=yes;')


def Read(connection):
    cursor = connection.cursor()
    print('Read')
    cursor.execute('SELECT * FROM rack')
    for row in cursor:
        print(row)
    connection.commit()


def Write(connection):
    cursor = connection.cursor()
    print('Write')
    rack = input('Enter First rack: ')
    cursor.execute('insert into rack(rack_desk) values(?);', (rack))
    Read(connection)
    connection.commit()


Write(connection)

