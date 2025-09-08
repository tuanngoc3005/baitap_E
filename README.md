# HỆ THỐNG QUẢN LÝ SỰ KIỆN

## Mục tiêu
Hệ thống quản lý bán vé và tổ chức seminar cho bộ môn Biz/Khởi nghiệp FU:
- Quản lý đăng ký & bán vé.
- Check-in bằng QR code.
- Hỗ trợ sponsor quản lý gian hàng.
- Thống kê và gửi khảo sát sau sự kiện.

## Cấu trúc (skeleton)
- Backend/
- Frontend/
- docs/
- diagrams/

## Kế hoạch 
- Day1: Skeleton + README (tài liệu hiện tại)
- Day2: Vẽ sơ đồ (Context, Use Case, ERD)
- Day3: Backend: login/register
- Day4: Backend: events, tickets, qr
- Day5: Frontend: giao diện cơ bản
- Day6: Check-in & Sponsor
- Day7: Hoàn thiện, test
- Day8: Nộp báo cáo 

## TỔNG QUAN  
## 1. Tổng quan về Dự án
Dự án này là một Hệ thống Quản lý Sự kiện (Event Management System) toàn diện, được xây dựng để quản lý toàn bộ vòng đời của một sự kiện, từ khâu lên ý tưởng cho đến việc phân tích sau sự kiện. Hệ thống hoạt động như một nền tảng trung gian, kết nối và tự động hóa các quy trình cho tất cả các bên liên quan: ban tổ chức, người tham dự, nhà tài trợ và đội ngũ quản trị.

## 2. Các Vai trò và Chức năng Chính
Hệ thống được thiết kế theo cấu trúc phân quyền rõ ràng, đảm bảo mỗi loại người dùng chỉ có thể truy cập vào các chức năng phù hợp với vai trò của họ.
Người tham dự (Visitor): Đây là đối tượng người dùng cuối cùng và quan trọng nhất. Họ có thể đăng ký và đăng nhập vào hệ thống để duyệt các sự kiện. Chức năng cốt lõi là mua vé trực tuyến, sau đó sử dụng mã QR code được cấp để check-in tại sự kiện một cách nhanh chóng. Sau khi sự kiện kết thúc, họ có thể hoàn thành các khảo sát để đóng góp ý kiến.
Ban tổ chức (Event Operator): Đây là những người tạo ra nội dung chính của hệ thống. Họ có thể tạo sự kiện mới, quản lý toàn bộ thông tin chi tiết của sự kiện (bao gồm mô tả, ngày, địa điểm và loại vé), đồng thời theo dõi hiệu suất thông qua các báo cáo về doanh thu và số lượng vé bán ra.
Nhà tài trợ (Sponsor): Các cá nhân hoặc tổ chức sử dụng nền tảng này để tìm kiếm và đăng ký tài trợ cho các sự kiện. Hệ thống cung cấp một quy trình có cấu trúc để họ dễ dàng đăng ký và quản lý gói tài trợ của mình.
Nhân viên check-in (Checking Staff): Những người này hoạt động tại địa điểm tổ chức sự kiện. Họ được trang bị một công cụ đặc biệt để quét mã vé của người tham dự, xác thực thông tin và cập nhật trạng thái check-in, đảm bảo quy trình ra vào diễn ra suôn sẻ.
Admin: Là người quản trị tối cao. Họ chịu trách nhiệm quản lý tất cả người dùng và phân quyền cho họ (ví dụ: cấp quyền Ban tổ chức), cũng như điều chỉnh các thiết lập chung của hệ thống.

## 3. Nền tảng Kỹ thuật
Các chức năng phong phú của hệ thống được xây dựng trên một cấu trúc dữ liệu chặt chẽ. Cốt lõi của hệ thống là một tập hợp các thực thể (entities) được liên kết với nhau một cách logic.
User: Là lớp cơ sở cho tất cả các loại người dùng (Admin, Operator, Sponsor, Checking Staff, Visitor). Thiết kế kế thừa này giúp hệ thống trở nên linh hoạt và dễ mở rộng.
Event: Đây là thực thể trung tâm, lưu trữ mọi thông tin liên quan đến một sự kiện cụ thể.
Ticket: Đại diện cho một vé đã mua, mỗi vé được gán một mã QR duy nhất và liên kết với cả người mua lẫn sự kiện.
SponsorshipPackage: Định nghĩa chi tiết các gói tài trợ, liên kết với cả sự kiện và nhà tài trợ.

## CHỨC NĂNG
## gồm các tác nhân:
## Người tham gia (Visitor)
  + Đăng ký và Đăng nhập:
      - Hệ thống phải cho phép người dùng đăng ký tài khoản mới bằng email và mật khẩu.
      - Hệ thống phải có chức năng đăng nhập an toàn, xác thực thông tin người dùng.
      - Hệ thống phải có chức năng "Quên mật khẩu".
+ Quản lý sự kiện:
      - Người dùng phải có thể xem danh sách tất cả các sự kiện công khai.
      - Họ có thể lọc và tìm kiếm sự kiện theo tên, ngày, hoặc địa điểm.
      - Họ có thể xem chi tiết sự kiện, bao gồm mô tả, thời gian, địa điểm, và các loại vé.
+ Mua vé:
      - Người dùng phải có thể chọn loại vé và số lượng mong muốn.
      - Hệ thống phải tích hợp cổng thanh toán trực tuyến để xử lý giao dịch mua vé.
      - Sau khi thanh toán thành công, hệ thống phải tự động tạo và gửi vé điện tử (dưới dạng mã QR) đến email của người dùng.
+ Check-in:
      - Hệ thống phải cho phép người dùng sử dụng mã QR trên vé điện tử để check-in tại sự kiện.
+ Khảo sát:
      - Người dùng phải có thể truy cập và hoàn thành các khảo sát sau sự kiện

## Ban tổ chức (Event Operator)
    Quản lý sự kiện:
      - Họ phải có khả năng tạo một sự kiện mới với đầy đủ thông tin: tên, mô tả, thời gian, địa điểm, hình ảnh.
      - Họ phải có thể thêm, chỉnh sửa và xóa các loại vé cho sự kiện của mình.
      - Họ có thể cập nhật thông tin sự kiện hoặc xóa sự kiện đã tạo.
+ Xem báo cáo:
      - Họ có thể xem báo cáo về số lượng vé đã bán và doanh thu theo thời gian thực.
      - Họ phải có thể xem báo cáo về số lượng người đã check-in tại sự kiện.
  
## Nhà tài trợ (Sponsor)
+ Đăng ký tài trợ:
      - Hệ thống phải cho phép nhà tài trợ xem các gói tài trợ có sẵn.
      - Họ có thể đăng ký tài trợ cho một sự kiện cụ thể và quản lý thông tin của gói tài trợ đó.
  
## Nhân viên check-in (Checking Staff)
+ Xác minh vé:
      - Họ phải sử dụng một ứng dụng hoặc thiết bị chuyên biệt để quét mã QR trên vé.
      - Hệ thống phải xác thực vé ngay lập tức và hiển thị thông tin chi tiết (ví dụ: tên người mua, loại vé).
      - Hệ thống phải cập nhật trạng thái của vé thành "đã sử dụng" sau khi check-in thành công.
      - thống phải có thông báo lỗi nếu vé không hợp lệ hoặc đã được sử dụng.
  
## Admin
+ Quản lý người dùng:
      - Admin phải có thể xem danh sách tất cả người dùng trong hệ thống.
      - Họ có thể thêm, chỉnh sửa và xóa tài khoản người dùng.
      - Họ có thể thay đổi vai trò (quyền hạn) của người dùng.
+ Quản lý hệ thống:
      - Admin có thể quản lý các cài đặt chung của hệ thống và phân quyền cho các vai trò khác nhau.

