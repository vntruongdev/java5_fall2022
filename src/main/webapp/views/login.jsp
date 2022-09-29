<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalSignin">
    Login
</button>

<div class="modal fade modal-signin position-static py-5" tabindex="-1" role="dialog" id="modalSignin" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <!-- <h5 class="modal-title">Modal title</h5> -->
                <h2 class="fw-bold mb-0">Sign up for free</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="floatingInput" placeholder="name@example.com">
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password">
                        <label for="floatingPassword">Password</label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Sign up</button>
                    <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                    <hr class="my-4">
                    <h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
                    <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3" type="submit">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#twitter"></use></svg>
                        Sign up with Twitter
                    </button>
                    <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3" type="submit">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#facebook"></use></svg>
                        Sign up with Facebook
                    </button>
                    <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="submit">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#github"></use></svg>
                        Sign up with GitHub
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--<form action="/account/login" method="post" class="">--%>
<%--    <input type="text" name="username">--%>
<%--    <input type="password" name="password">--%>
<%--    <input type="checkbox" name="remember" value="true">--%>
<%--    <button class="">Submit</button>--%>
<%--</form>--%>
<script>
    if ("${message}" != null && "${message}" != "") {
        alert("${message}");
    }
</script>
