<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="latest-products">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Latest Products</h2>
                    <a href="products.html">view all products <i class="fa fa-angle-right"></i></a>
                </div>
            </div>
            <div class="col-md-4">
                <c:import url="../product/_product-card.jsp"/>
            </div>
        </div>
    </div>
</div>