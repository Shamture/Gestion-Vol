<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
S'Authentifier
</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<%@ include file="MenuVisitor.jsp" %>

<section id="login-section" class="container">
  <div class="row">
  <h1>Page Login</h1>
  <hr/>
    <div class="col-md-6 col-sm-6">
    <c:if test="${requestScope.err == true }">
      <div class="alert alert-danger">
         <p>Login ou mot de passe invalide </p>
      </div>
    </c:if>
    <c:if test="${requestScope.notVued == true }">
      <div class="alert alert-warning">
         <p>Votre inscription n'a pas été encore consulter par nos agents, vueillez atttendre la validation ! </p>
      </div>
    </c:if>
    
    <form method="post" action="">
        <div class="form-group">
           <label>Login</label>
           <input type="text" name="login" placeHolder="Login" value="${param.login }"  class="form-control" />
        </div>
        <div class="form-group">
           <label>Mot de passe</label>
           <input type="password" name="pass" placeHolder="Mot de passe" value="" class="form-control" />
        </div>
        <br/>
        <input type="submit" value="Connecter" class="btn btn-danger"/>
        <br/>
        
     </form>
    </div>
     
  </div> 
</section>

</body>
</html>