
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BookHaven</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <!-- Header-->
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5" >
                        <h3>List Categories:</h3>
                        <ul class="list-group category_block ">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item text-white ${tag == C.cid? "active":""}"><a class="x-vip" href="category?categoryId=${C.cid}"><h5>${C.cname}</h5></a></li>
                                        </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>List Book:</h3>
                        <c:choose>
                            <c:when test="${listProducts == null || listProducts.size() == 0}">
                                Don't have any book yet!!! Please try later!!!
                            </c:when>
                            <c:otherwise>
                                <c:if test="${empty key}">
                                    <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                        <c:set var="startPage" value="${page - 7}"/>
                                        <c:choose>
                                            <c:when test="${startPage < 1}">
                                                <c:set var="startPage" value="1"/>
                                            </c:when>
                                            <c:when test="${startPage > totalPage - 14}">
                                                <c:set var="startPage" value="${totalPage - 14}"/>
                                            </c:when>
                                        </c:choose>
                                        <c:set var="endPage" value="${startPage + 14}"/>
                                        <div class="clearfix" >
                                            <ul class="pagination">
                                                <c:if test="${page > 1}">
                                                    <li class="page-item"><a class="page-link" href="home?page=${page-1}">Previous</a></li>
                                                    </c:if>
                                                    <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                    <li class="page-item ${i == page ? 'active' : ''}">
                                                        <a class="page-link" href="home?page=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <c:if test="${page < totalPage}">
                                                    <li class="page-item"><a class="page-link" href="home?page=${page+1}">Next</a></li>
                                                    </c:if>
                                            </ul>
                                        </div>
                                    </nav>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                        <div
                            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center"
                            >
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col mb-5">
                                    <!--${P.id}-->
                                    <div class="card h-100 card-vip">
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                            <img
                                                class="card-img-top"
                                                src="${P.imageUrl}"
                                                alt="..."
                                                />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div
                                                    class="d-flex justify-content-center small text-warning mb-2"
                                                    >
                                                    <div class="bi-star-fill">${P.tiltle}</div>

                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through"
                                                      >$${P.price+10}</span
                                                >
                                                $${P.price}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}"
                                                   >Add to cart</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
