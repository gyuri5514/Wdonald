<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="${pageContext.request.contextPath}/resources/css/storeStyles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-black">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">매장 수정</h3></div>
                                    <div class="card-body">
                                        <form action="adminUpdatedo.sdo" method="get">
                                        <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="admin_id" class="form-control" value="${sessionScope.store_admin.admin_id}" id="inputFirstName" type="text" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">사업자 아이디</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input name="admin_name" class="form-control" value="${sessionScope.store_admin.admin_name}" id="inputLastName" type="text" placeholder="Enter your last name" />
                                                        <label for="inputLastName">사업자 이름</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="admin_password" class="form-control" value="${sessionScope.store_admin.admin_password}" id="inputFirstName" type="password" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">비밀번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input name="admin_phone" class="form-control" value="${sessionScope.store_admin.admin_phone}" id="inputLastName" type="text" placeholder="Enter your last name" />
                                                        <label for="inputLastName">사업자 번호(-제외)</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="" class="form-control" value="${sessionScope.store_admin.store_address}" id="inputFirstName" type="text" placeholder="Enter your first name" readonly="s"/>
                                                        <label for="inputFirstName">매장주소</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input name="" class="form-control" value="${sessionScope.store_admin.store_name}" id="inputLastName" type="text" placeholder="Enter your last name" readonly="readonly" />
                                                        <label for="inputLastName">매장이름</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input name="" class="form-control" value="${sessionScope.store_admin.store_code}" id="inputFirstName" type="text" placeholder="Enter your first name" readonly="readonly" />
                                                        <label for="inputFirstName">매장코드</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input name="" class="form-control" value="${sessionScope.store_admin.store_phone}" id="inputLastName" type="text" placeholder="Enter your last name" readonly="readonly" />
                                                        <label for="inputLastName">매장번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                        <!--     <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPassword" type="password" placeholder="Create a password" />
                                                        <label for="inputPassword">매장 코드</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                        <label for="inputPasswordConfirm">매장 번호</label>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                	<input type="submit" class="btn btn-warning btn-block">
                                               	</div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="index.sdo">메인 페이지</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
