<%-- 
    Document   : info
    Created on : 13 thg 3, 2025, 09:01:32
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<div class="container py-5">
    <h2 class="text-center fw-bold">PAYMENT PAGE</h2>
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="bg-danger opacity-75 p-4 rounded">
                <h5 class="text-warning fw-bold">CUSTOMER INFORMATION</h5>
                <form>
                    <div class="mb-3">
                        <label class="form-label">Full Name *</label>
                        <input
                            type="text"
                            class="form-control"
                            name="name"
                            value = "${USER.fullName != null ? USER.fullName : ""}"
                            placeholder="Enter full name"
                            />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number *</label>
                        <input
                            type="text"
                            class="form-control"
                            name="phone"
                            value = "${USER.phone != null ? USER.phone : ""}"
                            placeholder="Enter phone number"
                            />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email *</label>
                        <input
                            type="email"
                            class="form-control"
                            name ="email"
                            placeholder="Enter email"
                            value = "${USER.email != null ? USER.email : ""}"
                            />
                    </div>
                    <button type="submit" class="btn btn-warning w-100 fw-bold">
                        CONTINUE
                    </button>
                </form>
            </div>
        </div>

        <!-- Ticket Information -->
        <div class="col-md-6">
            <div class="bg-primary p-4 rounded text-white">
                <h5 class="fw-bold">QUỶ NHẬP TRĂNG (T18)</h5>
                <p class="text-warning">
                    Phim dành cho khán giả từ đủ 18 tuổi trở lên (18+)
                </p>
                <p><strong>Cinestar Quốc Thanh (TP.HCM)</strong></p>
                <p>
                    271 Nguyễn Trãi, Phường Nguyễn Cư Trinh, Quận 1, TP Hồ Chí Minh
                </p>
                <p><strong>Thời gian:</strong> 10:00 Thứ Sáu 14/03/2025</p>
                <p>
                    <strong>Phòng chiếu:</strong> 04 &nbsp;&nbsp;
                    <strong>Số vé:</strong> 1 &nbsp;&nbsp;
                    <strong>Loại vé:</strong> Người Lớn
                </p>
                <p>
                    <strong>Loại ghế:</strong> Ghế Thường &nbsp;&nbsp;
                    <strong>Số ghế:</strong> H05
                </p>
                <p><strong>Bắp nước:</strong> 1 Combo Có Gấu</p>
                <hr />
                <p class="text-warning text-end fw-bold">
                    SỐ TIỀN CẦN THANH TOÁN: 199,000 VND
                </p>
            </div>
        </div>
    </div>
</div>
