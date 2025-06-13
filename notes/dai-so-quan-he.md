Created: 202504051737
Tags: 

## Tổng quan
- Đại số quan hệ
	- Là tập các phép toán cơ sở của mô hình dữ liệu quan hệ
	- Biểu thức đại số quan hệ là 1 chuỗi các phép toán
	- Kết quả của 1 biểu thức là 1 thể hiện quan hệ
- Ý nghĩa
	- Cở sở hình thức cho các phép toán của mô hình quan hệ
	- Cơ sở cài đặt và tối ưu hóa các câu hỏi trong các HQT CSDLQH
	- Được áp dụng trong SQL
- Toán hạng
	- Các thể hiện quan hệ
	- Các tập hợp
- Toán tử là các phép toán
	- Phép toán tập hợp: Hợp, giao, hiệu, tích Cartesian
	- Phép toán quan hệ: Chọn, chiếu, kết nối, đổi tên...
	- Một số phéo toán khác
## Phép toán 1 ngôi
- Là các phép toán chỉ tác động lên 1 quan hệ
- Bao gồm
	- Phép chọn - Select  $\sigma$
	- Phép chiếu - Project  $\pi$
	- Phép đổi tên - Rename  $\rho$
### Phép chọn
- Để chọn ra các bộ dữ liệu thỏa điều kiện chọn từ một quan hệ
- Kí hiệu: $\sigma_{<ĐK>}(r)$
- ĐK:
	- Là 1 biểu thức logic
	- Chứa các mệnh đề dạng
		- <thuộc tính><toán tử so sánh><hằng số>
		- <thuộc tính><toán tử so sánh><thuộc tính>
		- Toán tử so sánh: =, <, <=, >, >=, , ≠
		- Các mệnh đề được nối bởi toán tử logic: ∧, ∨, ¬

### Phép chiếu
### Phép đổi tên
## Phép toán 2 ngôi
- Là các phép toán tác động lên 2 quan hệ
- Gồm 2 loại
	- Phép toán tập hợp
		- Phép hợp - Union
		- Phép giao - Intersection
		- Phép hiệu - Difference
		- Phép tích đề các - Cartesian
	- Phép toán phi tập hợp
		- Phép kết nối - Join
		- Phép chia - Division



-----
## References
1.
