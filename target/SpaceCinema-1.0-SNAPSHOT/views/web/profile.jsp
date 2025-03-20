<%-- 
    Document   : profile
    Created on : Mar 19, 2025, 12:45:25 AM
    Author     : LAPTOP ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>

<div class="container mt-5">
    <div class="row justify-content-center">
        <!-- Cột thông tin người dùng -->
        <div class="col-md-4 text-center">
            <div class="card p-4 shadow-lg">
                <h3 class="mt-2 text-primary">${USER.fullName}</h3>
                <p class="text-muted">@${USER.userName}</p>

                <button class="btn btn-outline-primary mt-2" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                    <i class="bi bi-pencil-square"></i> Cập nhật thông tin
                </button>
                <button class="btn btn-outline-primary mt-2" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
                    <i class="bi bi-key-fill"></i> Change password
                </button>
            </div>
        </div>
 
        <!-- Cột chi tiết thông tin -->
        <div class="col-md-6">
            <div class="card p-4 shadow-lg">
                <h4 class="mb-3 text-info"><i class="bi bi-person-circle"></i> Thông tin cá nhân</h4>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><strong>Username:</strong> ${USER.userName}</li>
                    <li class="list-group-item"><strong>Họ và tên:</strong> ${USER.fullName}</li>
                    <li class="list-group-item"><strong>Email:</strong> ${USER.email}</li>
                    <li class="list-group-item"><strong>Số điện thoại:</strong> ${USER.phone}</li>
                </ul>
            </div>
        </div>
        <!-- Cột chi tiết thông tin -->        
        <div class="col-md-4">
            <div class="card p-4 shadow-lg">
                <h4 class="mb-3 text-success"><i class="bi bi-gift"></i> Voucher có thể sử dụng</h4>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <span><strong>Giảm 10%</strong> cho đơn hàng trên 200K</span>
                        <span class="badge bg-success">Còn hạn</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <span><strong>Freeship</strong> cho đơn từ 100K</span>
                        <span class="badge bg-warning text-dark">Sắp hết hạn</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <span><strong>Giảm 50K</strong> cho đơn từ 500K</span>
                        <span class="badge bg-danger">Hết hạn</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Modal chỉnh sửa thông tin -->
<div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProfileLabel"><i class="bi bi-pencil-square"></i> Update information</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/profile" method="POST">
                    <input type="hidden" name="action" value="info">
                    <input type="hidden" name="id" value="${USER.id}">
                    <div class="mb-3">
                        <label class="form-label text-info">Full name: </label>
                        <input type="text" class="form-control" name="fullName" value="${USER.fullName}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-info">Email: </label>
                        <input type="email" class="form-control" name="email" value="${USER.email}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-info">Phone: </label>
                        <input type="text" class="form-control" name="phone" value="${USER.phone}" required>
                    </div>
                    <button type="submit" class="btn btn-success"><i class="bi bi-save"></i> Save changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal đổi mật khẩu -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changePasswordLabel"><i class="bi bi-key-fill"></i> Change password</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/change-password" method="POST">
                    <div class="mb-3">
                        <label class="form-label text-danger">Current Password</label>
                        <input type="password" class="form-control password-input" name="currentPassword" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-danger">New Password</label>
                        <input type="password" class="form-control password-input" name="newPassword" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-danger">Confirm new password</label>
                        <input type="password" class="form-control password-input" name="confirmPassword" required>
                    </div>
                    <button type="submit" class="btn btn-danger"><i class="bi bi-arrow-repeat"></i> Cập nhật mật khẩu</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Script toggle hiện/ẩn mật khẩu -->
<script>
    document.querySelectorAll(".password-input").forEach(input => {
        input.insertAdjacentHTML("afterend", `
            <button type="button" class="btn btn-sm btn-outline-secondary toggle-password">
                <i class="bi bi-eye-slash"></i>
            </button>
        `);
    });

    document.querySelectorAll(".toggle-password").forEach(button => {
        button.addEventListener("click", function () {
            const input = this.previousElementSibling;
            if (input.type === "password") {
                input.type = "text";
                this.innerHTML = '<i class="bi bi-eye"></i>';
            } else {
                input.type = "password";
                this.innerHTML = '<i class="bi bi-eye-slash"></i>';
            }
        });
    });
    // Xác nhận mật khẩu mới và mật khẩu xác nhận
    document.querySelector("form[action='/change-password']").addEventListener("submit", function(event) {
        const newPassword = document.querySelector("input[name='newPassword']").value;
        const confirmPassword = document.querySelector("input[name='confirmPassword']").value;

        if (newPassword !== confirmPassword) {
            event.preventDefault(); // Ngừng gửi form
            alert("Mật khẩu mới và mật khẩu xác nhận phải trùng nhau.");
        }
    });
</script>

