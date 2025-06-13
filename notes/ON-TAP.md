Created: 202504102129
Tags: 

## ĐẠI SỐ QUAN HỆ
![[luocdobtdaisoquanhe.png]]

BÀI TẬP
- Tìm các nhân viên làm việc trong phòng số 4
	-> $\sigma _{MaPB = 4} (NHANVIEN)$ 
- Tìm các nhân viên làm việc trong phòng số 4 và có mức lương từ 25.000 đến 40.000
	-> $\sigma _{MaPB = 4 \wedge Luong >= 25 \wedge Luong <= 40} (NHANVIEN)$
	
- Cho biết họ, tên, giới tính và mức lương của các nhân viên của phòng số 5
	-> $\pi _{MaNV,Ho, Ten, Gioiting, Luong}(\sigma _{MaPB = 5}(NHANVIEN))$ 
- Tìm mã số các nhân viên của phòng số 5 hoặc giám sát trực tiếp các nhân viên phòng số 5
- Cho biết họ, tên của các nhân viên nữ và tên các thân nhân của họ
	q1 <- $\sigma_{Gioitinh = Nu}(NHANVIEN)$
	q2 <- $\rho _{Ho, Ten, MaNV1}(\pi _{Ho, Ten, MaNV}(q1))$
	q3 <- $\pi _{Ten, MaNV}(THANNHAN)$
	=> $\sigma _{MaNV1 = MaNV} (q1 x q2)$

- Cho biết tên, địa chỉ của các nhân viên của phòng Nghiên cứu
- Cho biết tên các nhân viên tham gia tất cả các dự án do phòng số 5 điều phối
- Hãy cho biết mã số, tổng số nhân viên và mức lương trung bình của mỗi phòng ban
- Với mỗi nhân viên cho biết họ, tên và tên phòng nếu họ là trưởng phòng

## SQL

## PHỤ THUỘC HÀM - FUNCTIONAL DEPENDENCIES
#### Giới thiệu
- Phụ thuộc hàm là sự ràng buộc dữ liệu trong quan hệ
- Dùng để đánh giá 1 thiết kế CSDL
- Kí hiệu : $A \to B$
#### Bao đóng của tập PTH
- Bao đóng của F, KH: $F^+$

#### Luật suy diễn Armstrong
- Luật suy diễn dùng để suy diễn 1 PTH mới từ tập PTH cho trước

```
| Tên         | Luật          |                           |
| ----------- | ------------- | ------------------------- |
| Phản xạ     | Y ⊆ X         | ⇒ X → Y                   |
| Tăng trưởng | X → Y         | ⇒ XZ → YZ, với XZ = X ∪ Z |
| Bắc cầu     | X → Y, Y → Z  | ⇒ X → Z                   |
| Phân rã     | X → YZ        | ⇒ X → Y, X → Z            |
| Hợp         | X → Y, X → Z  | ⇒ X → YZ                  |
| Bắc cầu giả | X → Y, WY → Z | ⇒ WX → Z                  |
```

#### Các tập PTH tương đương
Hai tập PTH F và G là tương đương nếu
- F phủ G
- G phủ F
=> F và G tương đương <=> $F^+ = G^+$ 


#### Phủ tối thiểu
- Điều kiện 
	- Mọi PTH của F chỉ có 1 thuộc tính ở vế phải
	- Không thể thay X → A thuộc F bằng Y → A với Y ⊂ X mà tập mới tương đương với F
	- Nếu bỏ đi một PTH bất kỳ trong F thì tập PTH còn lại không tương đương với F
- Mọi tập PTH có ít nhất 1 phủ tối thiểu
- Thuật toán tìm phủ tối thiểu
#### Tìm khóa lược đồ

#### DẠNG BÀI TOÁN
##### Chứng minh PTH
##### Tìm $X^+$
##### Kiểm tra PTH suy diễn
##### Tìm phủ tối thiểu
##### Xác định khóa
##### Tìm tất cả các khóa


## CHUẨN HÓA DỮ LIỆU
#### Phép tách không mất mát thông tin - Lossless join
```
Phương pháp kẻ b khảng
b1:
- nếu là thuộc tính của R[i] -> điền a[j] vào ô đó
- nếu không phải -> điền b[i][j]
b2:
xét f = X -> Y
nếu tồn tại 2 hàng (chỉ cần 2 là đc) X giống nhau -> Y đồng nhất về a
b3:
nếu tồn tại 1 hàng gồm full a -> không mất mát
ngược lại -> mất mát 
```


```
DE SAMPLE
1C 2B 2B 4D 7D 8d 9B 10A? 11A 12A? 13A 14B 19B 18D 21C? 22d 23d
```

-----
## References
1.
