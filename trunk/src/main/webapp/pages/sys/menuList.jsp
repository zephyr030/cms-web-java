<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>系统管理 - 用户管理</title>
    <link rel="stylesheet" href="static/ace/css/bootstrap.css"/>
    <link rel="stylesheet" href="static/ace/css/font-awesome.css"/>
    <link rel="stylesheet" href="static/ace/css/ace-fonts.css"/>
    <link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <script src="static/ace/js/jquery1x.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/ace/ace.js"></script>
    <script src="static/ace/js/ace/elements.colorpicker.js"></script>
    <script src="static/ace/js/ace/ace.widget-box.js"></script>
    <script src="static/javascript/sys/menuList.js"></script>
</head>
<body class="no-skin" style="background-color: white;">
<div class="row">
    <button id="addMenu" class="btn btn-white btn-info btn-round" style="margin-left: 12px;margin-bottom: 10px;">
        <i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
        新增
    </button>
    <div class="col-xs-12">
        <div class="widget-box widget-color-blue2 ui-sortable-handle">
            <!-- 设置table颜色 -->
            <div class="widget-header">
                <h5 class="widget-title bigger lighter">
                    <i class="ace-icon fa fa-table"></i>
                    Tables &amp; Colors
                </h5>
                <!-- 颜色列表 -->
                <div class="widget-toolbar widget-toolbar-light no-border">
                    <select id="simple-colorpicker-1" class="hide">
                        <option selected="" data-class="blue" value="#307ECC">#307ECC</option>
                        <option data-class="blue2" value="#5090C1">#5090C1</option>
                        <option data-class="blue3" value="#6379AA">#6379AA</option>
                        <option data-class="green" value="#82AF6F">#82AF6F</option>
                        <option data-class="green2" value="#2E8965">#2E8965</option>
                        <option data-class="green3" value="#5FBC47">#5FBC47</option>
                        <option data-class="red" value="#E2755F">#E2755F</option>
                        <option data-class="red2" value="#E04141">#E04141</option>
                        <option data-class="red3" value="#D15B47">#D15B47</option>
                        <option data-class="orange" value="#FFC657">#FFC657</option>
                        <option data-class="purple" value="#7E6EB0">#7E6EB0</option>
                        <option data-class="pink" value="#CE6F9E">#CE6F9E</option>
                        <option data-class="dark" value="#404040">#404040</option>
                        <option data-class="grey" value="#848484">#848484</option>
                        <option data-class="default" value="#EEE">#EEE</option>
                    </select>
                </div>
            </div>

            <!-- table内容 -->
            <div class="widget-body">
                <div class="widget-main no-padding">
                    <table class="table table-striped table-bordered table-hover">
                        <thead class="thin-border-bottom">
                        <tr>
                            <th><i></i>菜单名称</th>
                            <th><i></i>菜单类型</th>
                            <th><i></i>唯一key</th>
                            <th><i></i>url地址</th>
                            <th><i></i>隐藏</th>
                            <th><i></i>描述</th>
                            <th><i></i>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${list}" var="obj">
                            <tr>
                                <td>${obj.name}</td>
                                <td>${obj.type}</td>
                                <td>${obj.resKey}</td>
                                <td>${obj.url}</td>
                                <td>${obj.ishide}</td>
                                <td>${obj.description}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs action-buttons">
                                        <a class="blue" href="#">
                                            <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                        </a>

                                        <a class="green" href="#">
                                            <i class="ace-icon fa fa-pencil bigger-130"></i>
                                            <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></a>

                                        <a class="red" href="#">
                                            <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <nav>
            <ul class="pagination" style="float: right;padding-right: 3px;">
                <c:choose>
                    <c:when test="${hasPreviousPage}">
                        <li>
                            <a href="sys/menuList?pageNumber=${page.pageNumber-1}" aria-label="Previous">
                                <span aria-hidden="true">← prev</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="disabled">
                            <a href="javascript:;" aria-label="Previous">
                                <span aria-hidden="true">← prev</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <c:forEach items="${navigatePageNumbers}" var="obj">
                    <c:choose>
                        <c:when test="${obj == page.pageNumber}">
                            <li><a href="javascript:void(0)" class="active">${obj}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="sys/menuList?pageNumber=${obj}">${obj}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${hasNextPage}">
                        <li>
                            <a href="user/menuList?pageNumber=${page.pageNumber+1}" aria-label="Next">
                                <span aria-hidden="true">next → </span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="disabled">
                            <a href="javascript:;" aria-label="Next">
                                <span aria-hidden="true">next → </span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</div>
</div>
</body>
</html>