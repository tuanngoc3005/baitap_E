##  PHẦN MỀM TỔ CHỨC SỰ KIỆN CÓ BÁN VÉ

## Mục tiêu
Hệ thống quản lý bán vé và tổ chức seminar:
- Quản lý đăng ký & bán vé.
- Check-in bằng QR code.
- Hỗ trợ sponsor quản lý gian hàng.
- Thống kê và gửi khảo sát sau sự kiện.

## TỔNG QUAN  
## 1. Tổng quan về Dự án
Dự án này là một Hệ thống Quản lý Sự kiện (Event Management System) toàn diện, được xây dựng để quản lý toàn bộ vòng đời của một sự kiện, từ khâu lên ý tưởng cho đến việc phân tích sau sự kiện. 
Hệ thống hoạt động như một nền tảng trung gian, kết nối và tự động hóa các quy trình cho tất cả các bên liên quan: ban tổ chức, người tham dự, nhà tài trợ và đội ngũ quản trị.

## 2. Các Vai trò và Chức năng Chính
+ Hệ thống quản lý sự kiện này phục vụ năm nhóm người dùng chính, mỗi nhóm có một bộ chức năng riêng biệt:
     - **Người tham gia (Visitor):** Có thể đăng ký tài khoản, mua vé trực tuyến và sử dụng mã QR để check-in tại sự kiện.
     - **Ban tổ chức (Event Operator):** Có trách nhiệm tạo, quản lý sự kiện và xem các báo cáo về hiệu suất sự kiện.
     - **Nhà tài trợ (Sponsor):** Đăng ký và quản lý các gói tài trợ cho các sự kiện.
     - **Nhân viên check-in (Checking Staff):** Sử dụng công cụ để quét mã vé và xác minh thông tin người tham dự tại địa điểm.
     - **Admin:** Có quyền cao nhất để quản lý người dùng, phân quyền và điều chỉnh các cài đặt chung của hệ thống.

## 3. Nền tảng Kỹ thuật
Các chức năng phong phú của hệ thống được xây dựng trên một cấu trúc dữ liệu chặt chẽ. Cốt lõi của hệ thống là một tập hợp các thực thể (entities) được liên kết với nhau một cách logic.
- User: Lớp cơ sở (Visitor, Admin, Operator, Sponsor, Checking Staff).
- Event: ưu trữ toàn bộ thông tin sự kiện.
- Ticket: ại diện cho một vé (liên kết User + Event, có QR code duy nhất)
- Payment: lưu trữ giao dịch mua vé, trạng thái thanh toán.
- SponsorshipPackage: Các gói tài trợ, liên kết với Sponsor + Event.
- Survey: khảo sát sau sự kiện, liên kết với Event + User.

## BIỂU ĐỒ TỔNG QUAN
**1. Context DG**

<img width="1033" height="748" alt="context DG" src="https://github.com/user-attachments/assets/d5f8a7a8-88f7-4740-847f-3fd0f5b6c424" />


**2. Usecase tổng quan**

<img width="1033" height="748" alt="tổng quan quản lý sự kiện" src="https://github.com/user-attachments/assets/cbeca660-1b7c-4485-aa92-766bbdc801d4" />

**3. ERD**

<img width="1033" height="748" alt="ERD" src="https://github.com/user-attachments/assets/6be8b8ac-6bd2-4938-8f0b-121d4e17c7cd" />

## CHỨC NĂNG
 **gồm các chức năng chính :**
 **Người tham gia (Visitor)**
  + Đăng ký và Đăng nhập:
     - Cho phép người dùng đăng ký tài khoản mới bằng email và mật khẩu.
     - Có chức năng đăng nhập an toàn, xác thực thông tin người dùng.
     - ó chức năng "Quên mật khẩu".
+ Quản lý sự kiện:
     - Có thể xem danh sách tất cả các sự kiện công khai.
     - Có thể lọc và tìm kiếm sự kiện theo tên, ngày, hoặc địa điểm.
     - ó thể xem chi tiết sự kiện, bao gồm mô tả, thời gian, địa điểm, và các loại vé.
+ Mua vé:
     - Có thể chọn loại vé và số lượng mong muốn.
     - Tích hợp cổng thanh toán trực tuyến để xử lý giao dịch mua vé.
     - Sau khi thanh toán thành công, tự động tạo và gửi vé điện tử (dưới dạng mã QR) đến email của người dùng.
+ Check-in:
     - ho phép người dùng sử dụng mã QR để check-in tại sự kiện.
     - Xác minh vé và cập nhật trạng thái.
     - Thông báo khi vé không hợp lệ.  
+ Khảo sát:
     - Có thể truy cập và hoàn thành các khảo sát sau sự kiện.
     - an tổ chức xem báo cáo thống kê: số lượng vé bán, số người tham gia, phản hồi khảo sát. 

**Ban tổ chức (Event Operator)**
+ Quản lý sự kiện:
     - Họ phải có khả năng tạo một sự kiện mới với đầy đủ thông tin: tên, mô tả, thời gian, địa điểm, hình ảnh.
     - Họ phải có thể thêm, chỉnh sửa và xóa các loại vé cho sự kiện của mình.
     - Họ có thể cập nhật thông tin sự kiện hoặc xóa sự kiện đã tạo.
+ Xem báo cáo:
     - Họ có thể xem báo cáo về số lượng vé đã bán và doanh thu theo thời gian thực.
     - Họ phải có thể xem báo cáo về số lượng người đã check-in tại sự kiện.
  
**Nhà tài trợ (Sponsor)**
+ Đăng ký tài trợ:
     - Hệ thống phải cho phép nhà tài trợ xem các gói tài trợ có sẵn.
     - Họ có thể đăng ký tài trợ cho một sự kiện cụ thể và quản lý thông tin của gói tài trợ đó.
  
**Nhân viên check-in (Checking Staff)**
+ Xác minh vé:
     - Họ phải sử dụng một ứng dụng hoặc thiết bị chuyên biệt để quét mã QR trên vé.
     - Hệ thống phải xác thực vé ngay lập tức và hiển thị thông tin chi tiết (ví dụ: tên người mua, loại vé).
     - Hệ thống phải cập nhật trạng thái của vé thành "đã sử dụng" sau khi check-in thành công.
     - thống phải có thông báo lỗi nếu vé không hợp lệ hoặc đã được sử dụng.
  
**Admin**
+ Quản lý người dùng:
     - Admin phải có thể xem danh sách tất cả người dùng trong hệ thống.
     - Có thể thêm, chỉnh sửa và xóa tài khoản người dùng.
     - Có thể thay đổi vai trò (quyền hạn) của người dùng.
+ Quản lý hệ thống:
     - Admin có thể quản lý các cài đặt chung của hệ thống và phân quyền cho các vai trò khác nhau.

## BIỂU ĐỒ CHI TIẾT 
 **1. Đăng ký và đăng nhập** 

<img width="1033" height="748" alt="đăng ký và đăng nhập" src="https://github.com/user-attachments/assets/d689c18f-2f81-4457-8526-f72f815e4729" />


## 2. Đăng ký và tham gia 

<img width="1033" height="748" alt="đăng ký và tham gia" src="https://github.com/user-attachments/assets/2276031d-2a72-4871-a481-33a1bbe4fd8b" />


## 3. mua vé và thanh toán 

<img width="1033" height="748" alt="mua vé và thanh toán" src="https://github.com/user-attachments/assets/3b1dd4e3-8d69-4f84-9b46-0876b5b2fd71" />


## 4. Check in

<img width="1033" height="748" alt="check in" src="https://github.com/user-attachments/assets/3a7c8fb7-9f11-4c3a-b36a-9c75a1776f7b" />


## 5. Quản lý sự kiện

<img width="1033" height="748" alt="quản lý sự kiện" src="https://github.com/user-attachments/assets/dfce3f0a-01e4-4ebe-a07e-1e77f685ded6" />


## 6. Quản lý và diễn giả

<img width="1033" height="748" alt="quản lý và diễn giả" src="https://github.com/user-attachments/assets/ff3b053b-9244-40bd-b512-c21e5db82c56" />


## 7. Báo cáo và khảo sát

<img width="1033" height="748" alt="báo cáo và khảo sát" src="https://github.com/user-attachments/assets/f96e581d-90fb-4914-83ff-687a7a11658e" />


## YÊU CẦU PHI CHỨC NĂNG
**1. Hiệu năng**
- Hệ thống phải có khả năng xử lý ít nhất 500 – 1000 người dùng truy cập đồng thời mà không bị gián đoạn.
- Thời gian phản hồi cho mỗi thao tác quan trọng (đăng nhập, mua vé, check-in) trong điều kiện tải bình thường.
- Hệ thống phải đảm bảo tốc độ tải trang sự kiện.

**2. Bảo mật**
- Tất cả thông tin nhạy cảm (mật khẩu, thông tin thanh toán) phải được mã hóa.
- Hỗ trợ xác thực an toàn (email verification, mã OTP khi cần).
- Chống SQL Injection, XSS, CSRF và các lỗ hổng phổ biến.
- Phân quyền chặt chẽ giữa các vai trò (Visitor, Event Operator, Sponsor, Staff, Admin).
  
**3. Khả năng mở rộng**
- Hệ thống phải dễ dàng mở rộng để phục vụ nhiều sự kiện diễn ra cùng lúc.
- Cho phép thêm module mới (ví dụ: livestream, tích hợp với mạng xã hội) mà không ảnh hưởng đến chức năng sẵn có.

**4. Khả dụng & Độ tin cậy**
- Hệ thống phải đạt thời gian hoạt động.
- Dữ liệu sự kiện và vé cần được sao lưu tự động hàng ngày.
- Có cơ chế phục hồi nhanh nếu có sự cố.
  
**5. Khả năng sử dụng**
- Giao diện phải thân thiện, hỗ trợ cả máy tính và thiết bị di động.
- Người dùng mới có thể thao tác mua vé hoặc check-in chỉ trong ≤ 3 bước.
- Ngôn ngữ: hỗ trợ đa ngôn ngữ (ít nhất Tiếng Việt và Tiếng Anh).
  
**6. Tính tương thích**
- Hệ thống hoạt động tốt trên các trình duyệt phổ biến (Chrome, Firefox, Edge, Safari).
- Ứng dụng check-in bằng QR code phải chạy ổn định trên Android và iOS.
  
**7. Quản lý & Giám sát**
- Tuân theo chuẩn lập trình để dễ bảo trì.
- Có hệ thống log và giám sát để theo dõi hoạt động đăng nhập, mua vé, check-in.
- Cập nhật, bảo trì định kỳ mà không ảnh hưởng lớn đến người dùng.






