# **Mô Tả**
Bài tập số 2 này làm về giao diện nhập số nguyên dương, nhập số liệu thì sẽ tạo dãy số từ 1 đến số người dùng nhập. Nếu nhập sai khi phải là số dương hay là kí tự là chữ cái hoặc đặt biệt thì sẽ không hiển thị dãy mong muốn.

![NhapDung](../SourceCode/assets/images/UI_mau.jpg)
# **Các Hàm Chính**
**Main:** khởi tạo flutter
**MyApp.build:** cấu hình theme và thiết lập NumberList
**createList:** đọc số nguyên từ TextField, kiểm tra hợp lệ, hiển thị lỗi, tạo danh sách từ 1 đến n.
**_NumberListState.build():** TextField để nhập số, nút "Tạo" để tạo createList().

# **Kết Quả**
Giao diện:
![NhapDung](../SourceCode/assets/images/giao_dien_chinh.png)

Nhập đúng cứu pháp:
![NhapDung](../SourceCode/assets/images/nhap_dung_cuu_phap.png)

Nhập sai cứu pháp:
![NhapDung](../SourceCode/assets/images/nhap_sai_cuu_phap.png)
