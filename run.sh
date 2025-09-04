#!/bin/bash

echo "================================"
echo " RUNNING Hệ thống quản lí sự kiện "
echo "================================"

# Lấy thư mục gốc tuyệt đối của script
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

# =======================
# 1. Chạy Backend
# =======================
echo "[1/2] 🚀 Starting Backend (Flask API)..."
cd "$ROOT_DIR/Backend" || {
    echo "❌ Không tìm thấy thư mục Backend"
    exit 1
}

# Kích hoạt môi trường ảo
if [ -d "venv" ]; then
    source venv/bin/activate
    echo "✅ Virtual environment activated (Backend)."
else
    echo "❌ Không tìm thấy virtual environment (venv). Vui lòng chạy setup.sh trước!"
    exit 1
fi

# Chạy Flask server ở background
if [ -f "src/app.py" ]; then
    python ./src/app.py &
else
    echo "⚠️ Không tìm thấy src/app.py trong Backend. Vui lòng kiểm tra lại cấu trúc Backend."
    exit 1
fi
BACKEND_PID=$!

# =======================
# 2. Chạy Frontend
# =======================
echo "[2/2] 🎨 Starting Frontend (Vite/React)..."
cd "$ROOT_DIR/Frontend" || {
    echo "❌ Không tìm thấy thư mục Frontend"
    kill $BACKEND_PID
    exit 1
}

if [ -f "package.json" ]; then
    npm run dev &
else
    echo "⚠️ Không tìm thấy package.json trong Frontend. Vui lòng tạo dự án React/Vite trước."
    kill $BACKEND_PID
    exit 1
fi
FRONTEND_PID=$!

# =======================
# Hoàn tất
# =======================
echo "================================"
echo "✅ Hệ thống EVENT MANAGEMENT SYSTEM đang chạy:"
echo "👉 Backend:  http://localhost:5000"
echo "👉 Frontend: http://localhost:5173 (mặc định của Vite)"
echo "📌 Nhấn CTRL+C để dừng tất cả tiến trình."
echo "================================"

# Giữ tiến trình cho đến khi nhấn Ctrl+C
wait
