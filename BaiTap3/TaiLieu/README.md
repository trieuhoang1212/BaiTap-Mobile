# **Mô Tả**

Bài tập 2 yêu cầu sinh viên tạo 1 giao diện đơn giản cho phép người dùng có thể nhập 2 giá trị a và b, có thể chọn phép tính và được hiện kết quả.

![NhapDung](../SourceCode/assets/images/UI_mau.jpg)

# **Các Hàm Chính**

**Main:** khởi tạo flutter
**MyApp.build:** cấu hình theme và thiết lập NumberList
**createList:** đọc số nguyên từ TextField, kiểm tra hợp lệ, hiển thị lỗi, tạo danh sách từ 1 đến n.
**\_NumberListState.build():** TextField để nhập số, nút "Tạo" để tạo createList().

# **Kết Quả**

**Giao diện:**
    ![NhapDung](../SourceCode/assets/images/giao_dien_chinh.png)
**Nhập đúng cứu biểu thức cộng:**
    ![NhapDung](../SourceCode/assets/images/nhap_gia_tri_cong.png)
**Nhập đúng cứu biểu thức trừ:**
    ![NhapDung](../SourceCode/assets/images/nhap_gia_tri_cong.png)
**Nhập đúng cứu biểu thức nhân:**
    ![NhapDung](../SourceCode/assets/images/nhap_gia_tri_cong.png)
**Nhập đúng cứu biểu thức chia:**
    ![NhapDung](../SourceCode/assets/images/nhap_gia_tri_chia.png)
**Nhập sai cứu pháp:**
    ![NhapDung](../SourceCode/assets/images/sai_cuu_phap.png)
**Điều kiện chia:**
    ![NhapDung](../SourceCode/assets/images/dieu_kien_chia.png)