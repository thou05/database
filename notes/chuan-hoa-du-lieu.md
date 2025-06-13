Created: 202504051721
Tags: 

## Các dạng chuẩn
### 1 Normal Form - 1NF
- Lược đồ quan hệ R được gọi là thuộc dạng chuẩn 1 khi và chỉ khi mọi thuộc tính của R là thuộc tính đơn.
### 2 Normal Form - 2NF
- Lược đồ quan hệ R được gọi là thuộc dạng chuẩn 2 khi và chỉ khi:
	- R ở dạng chuẩn 1 
	- Mọi thuộc tính không khóa đều phụ thuộc hàm đầy đủ vào khóa chính
### 3 Normal Form - 3NF
- Lược đồ quan hệ R được gọi là thuộc dạng chuẩn 3 khi và chỉ khi:
	- R ở dạng chuẩn 2 
	- Mọi thuộc tính không khóa đều không phụ thuộc hàm bắc cầu vào khóa chính.
### Boyce - Codd Normal Form - BDNF
- Lược đồ quan hệ R được gọi là thuộc dạng chuẩn BCNF khi và chỉ khi: PTH không hiển nhiên X → Y đúng trên R thì X là siêu khóa của R.

- Nhận xét
	- Mọi quan hệ thuộc dạng chuẩn BCNF cũng thuộc dạng chuẩn 3 
	- Dạng chuẩn BCNF đơn giản và chặt chẽ hơn chuẩn 3 
	- Mục tiêu của quá trình chuẩn hóa là đưa lược đồ quan hệ về dạng chuẩn 3 hoặc chuẩn BCNF.
## Chuẩn hóa dữ liệu
- Mục đích
	- tìm kiếm thông tin một cách dễ dàng
	- tránh được dư thừa dữ liệu
- Giải pháp: Tách các lược đồ quan hệ “có vấn đề” thành những lược đồ quan hệ “chuẩn hơn”
- Nhược điểm: tốn thời gian join lại khi tìm thông tin

### Phép tách các lược đồ quan hệ
- Mục đích: 
- Yêu cầu
	- Bảo toàn thuộc tính, ràng buộc
	- Bảo toàn dữ liệu

### Phép tách không mất mát thông tin - Lossless join
#### Kiểm tra tính không mất mát thông tin
#### Tách bảo toàn tập phụ thuộc hàm về 3NF
#### Tách không mất mát thông tin và bảo toàn tập phụ thuộc hàm về 3NF
#### Tách không mất mát thông tin về BCNF



-----
## References
1.
