<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inscription</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<link rel="shortcut icon" href="images/favicon.ico">

	
</head>
<body>
<%@ include file="MenuVisitor.jsp" %>

<section class="container">
   <h1>Inscription</h1>
   <hr/>
   <c:if test="${requestScope.res == true }">
      <div class="alert alert-success">
       <i class="fa fa-check-circle" aria-hidden="true"></i> Inscription avec succées , veuillez attendre la validation de votre compte , vous aurez un email 
        pour vous informer quand votre compte sera validé.
      </div>
   </c:if>
   <div class="col-md-6">
     <form:form method="post" action="" modelAttribute="newUser">
        <div class="form-group">
           <label>Nom</label>
           <form:input path="nom" type="text" class="form-control" placeHolder="Nom" required="required"/>
        </div>
        
        <div class="form-group">
           <label>Email</label>
           <form:input path="email" type="text" class="form-control" placeHolder="Email" required="required"/>
        </div>
        
        <div class="form-group">
           <label>Telephone</label>
           <form:input path="tel" type="text" class="form-control" placeHolder="Telephone" required="required"/>
        </div>
        
        <div class="form-group">
           <label>Login</label>
           <form:input path="login" type="text" class="form-control" placeHolder="Login" required="required"/>
        </div>
        
        <div class="form-group">
           <label>Mot de passe</label>
           <form:input path="password" type="password" class="form-control" placeHolder="Mot de passe" required="required"/>
        </div>
        
        <div class="form-group">
           <label>Confirmer Mot de passe</label>
           <input id="confPass" type="password" class="form-control" placeHolder="Confirmer Mot de passe" required="required"/>
        </div>
        
        <br/><br/>
        <input type="submit" class="btn btn-danger" value="S'inscrire"/>
        <br/><br/>
     </form:form>
   </div>
   <div class="col-md-1"></div>
   <div class="col-md-4">
     <img src="<c:url value="/images/register1.png"/>" alt=""/>
   </div>
</section>

<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />" ></script>
  
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />" ></script>

<script>
$(function () {

	var loginisValid = true;
	 $('#login').change(function() {        
	       var login = $('#login').val();
	       if(login.length < 4){
	    	   $('#login').after('<p class="text-danger" id="login-size"> Login doit contenir au minimum 4 caracteres </p>');
	    	   loginisValid = false;
		   }else{
			   loginisValid = true;
		       $('#login-size').remove();
		       $.get('verifier-login?login='+login,function(data){
					if(data == 'ERR'){
						loginisValid = false;
						$('#login').after('<p class="text-danger" id="login-used"> Login utilisé par un autre utilisateur </p>');
					}else{
						loginisValid = true;
						$('#login-used').remove();
					}
			   });
		   }

		   
	     
	    });

	var emailIsValide = true;
	 
	 $('#email').change(function() {        
	       var email = $('#email').val();
	       

		   $.get('verifier-email?email='+email,function(data){
				if(data == 'ERR'){
					emailIsValide = false;
					$('#email').after('<p class="text-danger" id="email-used"> Email utilisé par un autre utilisateur </p>');
				}else{
					emailIsValide = true;
					$('#email-used').remove();
				}
		   });
	     
	    });

	    var passIsValide = true;

	 $('#confPass').change(function() { 
        var first = $('#password').val();
        var second = $('#confPass').val();

        if(first == second){
        	passIsValide = true;
        	$('#password-match').remove();
        }else{
        	passIsValide = false;
        	$('#confPass').after('<p class="text-danger" id="password-match"> Les deux mots de passe ne sont pas conforme </p>');
        }
	 });

	 $( "#newUser" ).submit(function( event ) {
		 if(passIsValide && emailIsValide && loginisValid){
			
		 }else{
			 event.preventDefault();
			 alert("votre fomulaire contient des erreurs vueillez les corriger !");
			 }
		  
		});
});
</script>
</body>
</html>