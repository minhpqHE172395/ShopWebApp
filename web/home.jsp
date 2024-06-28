<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BookHaven</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <!-- Inline CSS for pagination -->
        <style>
            .pagination {
                display: flex;
                justify-content: center;
                padding-left: 0;
                list-style: none;
                margin: 0 0 5px;
            }
            .pagination a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
                text-decoration: none;
            }
            .pagination a:hover {
                color: black;
            }
            .pagination .active a {
                background: #03A9F4;
                color: white;
            }
            .pagination .active a:hover {
                background: #0397d6;
            }
            .pagination .disabled a {
                color: #ccc;
            }
            .pagination i {
                font-size: 16px;
                padding-top: 6px;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <!-- Header-->
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h3>List of Categories:</h3>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item text-white ${param.categoryId == C.cid ? 'active' : ''}">
                                    <a class="x-vip" href="home?categoryId=${C.cid}">
                                        <h5>${C.cname}</h5>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>List of Book:</h3>
                        <c:if test="${not empty message}">
                            <div class="alert alert-warning" role="alert">
                                ${message}
                            </div>
                        </c:if>
                        <c:choose>
                            <c:when test="${listProducts == null || listProducts.size() == 0}">
                                Don't have any book yet!!! Please try later!!!
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <c:set var="maxDisplayPages" value="5"/>
                                    <c:set var="halfMaxDisplayPages" value="${maxDisplayPages / 2}"/>
                                    <c:set var="startPage" value="${page - halfMaxDisplayPages < 1 ? 1 : page - halfMaxDisplayPages}"/>
                                    <c:set var="endPage" value="${startPage + maxDisplayPages - 1 > totalPages ? totalPages : startPage + maxDisplayPages - 1}"/>
                                    <c:set var="startPage" value="${endPage - startPage + 1 < maxDisplayPages && endPage - maxDisplayPages + 1 > 0 ? endPage - maxDisplayPages + 1 : startPage}"/>
                                    <div class="pagination">
                                        <c:if test="${page > 1}">
                                            <a class="page-link" href="home?page=${page-1}&categoryId=${param.categoryId}">Previous</a>
                                        </c:if>
                                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                            <a class="${i == page ? 'active' : ''}" href="home?page=${i}&categoryId=${param.categoryId}">${i}</a>
                                        </c:forEach>
                                        <c:if test="${page < totalPages}">
                                            <a class="page-link" href="home?page=${page+1}&categoryId=${param.categoryId}">Next</a>
                                        </c:if>
                                    </div>
                                </nav>
                            </c:otherwise>
                        </c:choose>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col mb-5">
                                    <div class="card h-100 card-vip">
                                        <a href="detail?productId=${P.id}">
                                            <img class="card-img-top" src="${P.imageUrl}" alt="..." />
                                        </a>
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <h5 class="fw-bolder">
                                                    <c:choose>
                                                        <c:when test="${fn:length(P.name) > 20}">
                                                            ${fn:substring(P.name, 0, 20)}...
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${P.name}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </h5>
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <c:choose>
                                                        <c:when test="${fn:length(P.tiltle) > 20}">
                                                            ${fn:substring(P.tiltle, 0, 20)}...
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${P.tiltle}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <span class="text-muted text-decoration-line-through">$${P.price + 10}</span>
                                                $${P.price}
                                            </div>
                                        </div>
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}">Add to cart</a>
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
