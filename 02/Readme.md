Ảnh mô tả bài làm
![alt text](z6209431288485_1a2b0b0a6e884c6c7b89bce0ce7cddbc-1.jpg) 
Cách làm:
-tạo 1 mảng timestamps lưu trữ data
data = [
    [75, 188, 0, "Chào", 0, 4],
    [275, 388, 0, "Lan", 5, 3],
    [675, 100, 1, "!", 8, 1],
    [1050, 225, 0, "Mình", 10, 4],
    [1287, 188, 0, "là", 15, 2],
    [1487, 388, 0, "James", 18, 5],
    [1975, 213, 1, ",", 23, 1],
    [2187, 213, 0, "đến", 25, 3],
    [2412, 250, 0, "từ", 29, 2],
    [2675, 213, 0, "Hoa", 32, 3],
]
-1 button khi nhấn vào button sẽ chạy audio ,audio sẽ lắng nghe sự kiện chạy trả về index khi đên thời gian xuất hiện của từ
-khi đến index của từ nào sẽ hight light từ đó lên
-Promt hỏi AI :I have an output.wav audio file about a conversation between 2 people and a paragraph describing the conversation of 2 people in the audio. The code gives me a flutter app. When I press play on the audio, the person in the audio will hight light text. go there