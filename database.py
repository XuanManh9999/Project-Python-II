import MySQLdb as mdb

class Database:
    def __init__(self):
        self.con = None
        self.cur = None

    def open_connection(self):
        self.con = mdb.connect('localhost', 'root', '', 'cua_hang_thoi_trang')
        self.cur = self.con.cursor()

    def close_connection(self):
        if self.cur:
            self.cur.close()
        if self.con:
            self.con.close()

    def read_user(self):
        self.open_connection()
        self.cur.execute("SELECT * FROM user")
        results = self.cur.fetchall()
        self.close_connection()
        return results

    # tim kiem user theo ten
    def search_user(self, name):
        self.open_connection()
        query = "SELECT * FROM user WHERE ten LIKE %s"
        self.cur.execute(query, ('%' + name + '%',))
        results = self.cur.fetchall()
        self.close_connection()
        return results
   #select all user voi ten va id
    def select_user(self):
        self.open_connection()
        self.cur.execute("SELECT id, ten FROM user")
        results = self.cur.fetchall()
        self.close_connection()
        return results
    def insert_user(self, username, sdt, email, diachi, luong, vitri, quyen, ngaysinh):
        self.open_connection()
        query = "INSERT INTO user(ten, so_dien_thoai, email, dia_chi, luong, vi_tri, quyen, ngay_sinh) VALUES(%s, %s, %s, %s, %s, %s, %s, %s)"
        self.cur.execute(query, (username, sdt, email, diachi, luong, vitri, quyen, ngaysinh))
        self.con.commit()
        self.close_connection()

    def update_user(self, id, username, sdt, email, diachi, luong, vitri, quyen, ngaysinh):
        self.open_connection()
        query = "UPDATE user SET ten=%s, so_dien_thoai=%s, email=%s, dia_chi=%s, luong=%s, vi_tri=%s, quyen=%s, ngay_sinh=%s WHERE id=%s"
        values = (username, sdt, email, diachi, luong, vitri, quyen, ngaysinh, id)
        self.cur.execute(query, values)
        self.con.commit()
        self.close_connection()

    def delete_user(self, id):
        self.open_connection()
        query = "DELETE FROM user WHERE id=%s"
        self.cur.execute(query, (id,))
        self.con.commit()
        self.close_connection()

    def read_product(self):
        self.open_connection()
        self.cur.execute("SELECT * FROM product")
        results = self.cur.fetchall()
        self.close_connection()
        return results

    def insert_product(self, ten_san_pham, loai_san_pham, gia, mo_ta, so_luong, chat_lieu, da_ban):
        self.open_connection()
        query = "INSERT INTO product(ten, loai, gia, mo_ta, so_luong_san_pham, chat_lieu, da_ban) VALUES(%s, %s, %s, %s, %s, %s, %s)"
        self.cur.execute(query, (ten_san_pham, loai_san_pham, gia, mo_ta, so_luong, chat_lieu, da_ban))
        self.con.commit()
        self.close_connection()

    def search_product(self, name):
        self.open_connection()
        query = "SELECT * FROM product WHERE ten LIKE %s"
        self.cur.execute(query, ('%' + name + '%',))
        results = self.cur.fetchall()
        self.close_connection()
        return results

    def update_product(self, id, ten_san_pham, loai_san_pham, gia, mo_ta, so_luong, chat_lieu, da_ban):
        self.open_connection()
        query = "UPDATE product SET ten=%s, loai=%s, gia=%s, mo_ta=%s, so_luong_san_pham=%s, chat_lieu=%s, da_ban=%s WHERE id=%s"
        values = (ten_san_pham, loai_san_pham, gia, mo_ta, so_luong, chat_lieu, da_ban, id)
        self.cur.execute(query, values)
        self.con.commit()
        self.close_connection()

    def delete_product(self, id):
        self.open_connection()
        query = "DELETE FROM product WHERE id=%s"
        self.cur.execute(query, (id,))
        self.con.commit()
        self.close_connection()

    def read_service(self):
        self.open_connection()
        self.cur.execute("SELECT * FROM dich_vu")
        results = self.cur.fetchall()
        self.close_connection()
        return results

    def insert_service(self, ten_dich_vu, gia, mo_ta):
        self.open_connection()
        query = "INSERT INTO dich_vu(ten_dich_vu, gia, mo_ta) VALUES(%s, %s, %s)"
        self.cur.execute(query, (ten_dich_vu, gia, mo_ta))
        self.con.commit()
        self.close_connection()

    def update_service(self, id, ten_dich_vu, gia, mo_ta):
        self.open_connection()
        query = "UPDATE dich_vu SET ten_dich_vu=%s, gia=%s, mo_ta=%s WHERE id=%s"
        values = (ten_dich_vu, gia, mo_ta, id)
        self.cur.execute(query, values)
        self.con.commit()
        self.close_connection()

    def delete_service(self, id):
        self.open_connection()
        query = "DELETE FROM dich_vu WHERE id=%s"
        self.cur.execute(query, (id,))
        self.con.commit()
        self.close_connection()
    # them du lieu vao bang user_dich_vu
    def insert_user_service(self, user_id, service_id, quantity):
        self.open_connection()
        query = "INSERT INTO user_dich_vu (ID_user, ID_dich_vu, so_luong) VALUES(%s, %s, %s)"
        self.cur.execute(query, (user_id, service_id, quantity))
        self.con.commit()
        self.close_connection()
    # sua
    def update_user_s1ervice(self, user_id, service_id, quantity):
        self.open_connection()
        query = "UPDATE user_dich_vu SET so_luong=%s WHERE ID_user=%s AND ID_dich_vu=%s"
        self.cur.execute(query, (quantity, user_id, service_id))
        self.con.commit()
        self.close_connection()
    # xoa
    def delete_user_service(self, user_id, service_id):
        self.open_connection()
        query = "DELETE FROM user_dich_vu WHERE ID_user=%s AND ID_dich_vu=%s"
        self.cur.execute(query, (user_id, service_id))
        self.con.commit()
        self.close_connection()
    def select_quantity_user_service(self, user_id, service_id):
        self.open_connection()
        print(user_id, service_id)
        query = "SELECT so_luong FROM user_dich_vu WHERE ID_user=%s AND ID_dich_vu=%s"
        self.cur.execute(query, (user_id, service_id))
        result = self.cur.fetchone()
        self.close_connection()
        return result
    def select_user_service(self):
        self.open_connection()
        query = "SELECT * FROM user_dich_vu"
        self.cur.execute(query)
        results = self.cur.fetchall()
        self.close_connection()
        return results

