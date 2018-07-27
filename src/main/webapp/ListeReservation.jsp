<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste Des reservations</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<%@ include file="MenuAdmin.jsp" %>

<section id="ajout-fournisseur" class="container">
<h1>Liste Des Reservations non traité</h1>
     <hr/>
   <div class="col-md-12">
     <p class="table-total">
       (${requestScope.listReservations.size()}) En Total
     </p>
     <table class="table  table-striped table-bordered">
       <tr>
         <th>ID Vol</th>
         <th>C.I.N Passager</th>
         <th>Depart Vol</th>
         <th>Destionation Vol</th>
         <th>Avion</th>
         <th>Place</th>
         <th></th>
       </tr>
       
       <c:forEach items="${requestScope.listReservations }" var="item">
          <tr id="l${item.id }">
          	 <td>${item.id }</td>
             <td> <c:out value="${item.passager.cin }" /> </td>
             <td> <c:out value="${item.vol.depart }" /> <br/> <c:out value="${item.vol.aeroportDepart.nom }" /> </td>
             <td> <c:out value="${item.vol.arrivee }" /> <br/> <c:out value="${item.vol.aeroportArrivee.nom }" />  </td>
             <td>${item.vol.avion.code}</td>
             <td>${item.place}</td>
             <td>
                
                 <button class="btn btn-success accepter" id="a${item.id }"><i class="fa fa-check" aria-hidden="true"></i> Accepter</button>
                 <button class="btn btn-danger deleter" id="${item.id }" title="supprimer"><i class="fa fa-trash-o" aria-hidden="true"></i> Refuser</button>
             </td>
             
             
          </tr>
       </c:forEach>
     </table>
     
     
   </div>
   
   
   
</section>









<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />" ></script>
  
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />" ></script>

<script>
$(function(){
   $('.deleter').click(function(){
		var res = confirm('Etês vous sure de vouloir refuser cette reservation !');
	    if(res){
	    	var idClient = this.id;
			$.get('refuser-reservation?id='+idClient,function(data){
				if(data == 'OK')
					$('#l'+idClient).remove();
				else
					alert("Une erreur s'est produite");	
			});
		}
		
   });

   $('.accepter').click(function(){
		var res = confirm('Etês vous sure de vouloir accepter cette reservation !');
	    if(res){
	    	var idRes = this.id;
	    	idRes = idRes.substring(1);
			$.get('accepter-reservation?id='+idRes,function(data){
				if(data == 'OK')
					$('#l'+idRes).remove();
				else
					alert("Une erreur s'est produite");	
			});
		}
		
  });

  


});
</script>
</body>
</html>