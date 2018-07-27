<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajouter Avion</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<%@ include file="MenuAdmin.jsp" %>

<section id="ajout-fournisseur" class="container">
<h1>Ajouter Nouveau Avion</h1>
     <hr/>
   <div class="col-md-6">
     
     <c:choose>
       <c:when test="${requestScope.res == true }">
          <div class="alert alert-success">
            Avion Ajouté avec succées
          </div>
       </c:when>
       
       <c:when test="${requestScope.res == false }">
          <div class="alert alert-danger">
             Une erreur s'est produite
          </div>
       </c:when>
     </c:choose>
     
     <form:form method="post" action="" modelAttribute="newAvion">
       <div class="form-group">
         <label>Code</label>
         <form:input path="code" type="text" placeHolder="Code Avion" class="form-control" required = "required"/>
         <form:errors	path="code"	cssClass="text-danger"/>
       </div>
       <div class="form-group">
         <label>Type</label>
         <form:input path="type" type="text" placeHolder="Type Avion" class="form-control"/>
       </div>
       <div class="form-group">
         <label>Nombre Places</label>
         <form:input path="nbPlaces" type="number" placeHolder="Nombre Places" class="form-control" required = "required"/>
         <form:errors	path="nbPlaces"	cssClass="text-danger"/>
       </div>
       
       
       
       
       <br/>
       <div class="col-md-12">
       <br/><br/><br/>
       	<input type="submit" value="Ajouter Avion" class="btn btn-danger"/>
       </div>
       
       
     </form:form>
     
   </div>
</section>









<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />" ></script>
  
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />" ></script>


</body>
</html>