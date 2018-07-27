<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste Avions</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<%@ include file="MenuAdmin.jsp" %>

<section id="ajout-fournisseur" class="container">
<h1>Liste Avions</h1>
     <hr/>
   <div class="col-md-12">
     <p id="table-total">
       (${requestScope.listAvions.size()}) En Total
     </p>
     <table class="table  table-striped table-bordered">
       <tr>
         <th>Code</th>
         <th>Type</th>
         <th>Etat</th>
         <th>Nombre Places</th>
         <th></th>
       </tr>
       
       <c:forEach items="${requestScope.listAvions }" var="item">
          <tr>
             <td> <c:out value="${item.code }" /> </td>
             <td> <c:out value="${item.type }" /> </td>
             <td> <c:out value="${item.etat }" /> </td>
             <td> <c:out value="${item.nbPlaces }" /> </td>
             <td> <a href="<c:url value="/agent/modifier-avion/${item.id}" />" > <button class="btn btn-primary">Modifier</button> </a>  </td>
          </tr>
       </c:forEach>
     </table>
     
     
   </div>
</section>









<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />" ></script>
  
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />" ></script>


</body>
</html>