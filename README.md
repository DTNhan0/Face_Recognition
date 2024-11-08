Sử dụng IDE Pycharm bản VIP PRO và cơ sở dữ liệu MySQL, cần cài đặt các interpreter sau:
+ opencv-python
+ mysql-connector-python
+ numpy
+ scikit-learn
+ PyQt5

*Lưu ý: trước khi chạy code, hãy kiểm tra kỹ lại phần connection của db

Sử dụng Python là ngôn ngữ chính, đầu tiên khi phần mềm hiển thị:
![image](https://github.com/user-attachments/assets/630640e5-70b2-4f39-8bfc-856bd7867569)


Nhập thông tin đầy đủ và bấm "Save to DB and generate dataset":
![image](https://github.com/user-attachments/assets/99555918-1804-4798-afdf-615d77bc7f67)


Quá trình khởi tạo dataset sẽ được lưu vào đường dẫn "../input/Dataset/(MSSV bạn mới vừa nhập)":

![image](https://github.com/user-attachments/assets/dfdd04bd-371f-4b91-9c3e-c58c100bfb06)

![image](https://github.com/user-attachments/assets/46fdf497-b7a5-4c84-9fed-4095e30c53d4)

![image](https://github.com/user-attachments/assets/6d351d80-fe5b-453d-b747-4460770e2292)

![image](https://github.com/user-attachments/assets/2acb76a4-24f0-483f-b381-b2d431fd5161)


Lúc này phần mềm sẽ lưu lại thông tin cá nhân vào DB cùng với đường dẫn của các hình ảnh:

![image](https://github.com/user-attachments/assets/b1cf402d-a069-47d5-a38e-ceb3cbe2d4e5)

![image](https://github.com/user-attachments/assets/eac89d73-3dc2-4aab-a23d-27abdb3da205)

Sau đó nhập mssv vào để tiến hành trainging:

![image](https://github.com/user-attachments/assets/628a5b14-966a-419c-a45f-7b349e8cffc6)

*Thuật toán sẽ dựa vào mssv để tìm ra đường dẫn tới các hình ảnh cần train

Sau khi train xong, 3 model sẽ được tạo ra dùng cho việc nhận diện khuôn mặt:

![image](https://github.com/user-attachments/assets/877bb4d9-1b01-432f-bec9-8149073525b1)

Dữ liệu hình ảnh được chuẩn hóa sẽ tùy thuộc vào số lượng điểm ảnh và số lượng hình ảnh, số lượng hình ảnh càng lớn thì quá trình nhận diện sẽ càng chính xác. VỚI LẠI AI CÀNG ĐẸP TRAI XINH GÁI THÌ ĐỘ NHẬN DIỆN SẼ CÀNG TĂNG NHÉ (LỜI NÓI CHƯA ĐƯỢC KIỂM CHỨNG).

Nếu muốn tạo lại dataset và train lại, nhập thông tin mssv và bấm vào nút "Generate dataset":

![image](https://github.com/user-attachments/assets/7e413d03-b2bf-4616-9fdb-a96bd6f28913)

Oke, sau khi đã hoàn thành các bước trên, chúng ta có thể sử dụng được chức năng nhận diện khuôn mặt (Lưu ý là phải train trước):

![image](https://github.com/user-attachments/assets/08a9e766-174a-4591-aded-521c32561acb)

![image](https://github.com/user-attachments/assets/405d4ace-a206-4992-9733-997f09161241)

*Lưu ý: phải mở quyền truy cập cho camera trước khi thực hiện chức năng nhận diện khuôn mặt

Tổng quan hóa quá trình hoạt động:
+ Ở đây mình sử dụng HQTCSDL MySQL, mục đích chính là dùng để lưu trữ thông tin người dùng cũng như đường dẫn hình ảnh. Việc gán nhãn dữ liệu đều được xử lý thông qua thuật toán (mn xem code hàm save_to_db_and_generate_code).
+ Vì đây chỉ là phần demo cho nên phần mềm sẽ rất là lỏd, sẽ không có phần validate nên mọi người phải tự nhập và kiểm tra thông tin.
+ Luồng hoạt động: mở phần mềm => nếu chưa có thông tin thì nhập, còn đã có model rồi thì chỉ cần dùng chức năng nhận diện khuôn mặt => thông tin lưu vào csdl => sau khi nhập xong thì bắt đầu tiến hành tạo dataset => code sẽ lấy thông tin vừa nhập để tìm kiếm trên database và tự động gán nhãn dữ liệu phân loại hình ảnh sau khi các hình ảnh được ghi lại xong => nếu muốn tạo lại dataset thì nhập thông tin mssv rồi bấm generate_dataset (quá trình hoạt động sẽ diễn ra tương tự như bước kia) => đã có dataset thì tiến hành train (trước khi train ta phải nhập mssv, sau đó thuật toán sẽ đi vào csdl bảng image để tìm kiếm toàn bộ url có chứa mssv ta mới vừa nhập => từ đường dẫn ta lấy được các hình ảnh để train => train xong thì tạo ra các model được gắn liền với thông tin mssv đem qua hàm face_recognition sử dụng => và bước cuối cùng là nhận diện khuôn mặt
+ Quá trình hoạt động của code khá dễ nên mọi có thể thay đổi thuật toán thoải mái, nhưng phải lưu ý đường dẫn vì mình fix cứng phần đường dẫn phải là ../input/Model/... và ../input/Dataset/...



