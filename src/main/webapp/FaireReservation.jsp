<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Faire reservation</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/main.css" />"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
</head>
<body>
<%@ include file="MenuVisitor.jsp" %>

<section  class="container">
<h1>Faire une reservation</h1>
     <br/><br/><br/>
   <div class="col-md-7" id="passenger-add-form">
     
     <c:choose>
       <c:when test="${requestScope.res == true }">
          <div class="alert alert-success">
            Reservation effectué avec succées, elle sera consulter par nos agents pour confirmation
          </div>
       </c:when>
       
       <c:when test="${requestScope.res == false }">
          <div class="alert alert-danger">
             Une erreur s'est produite
          </div>
       </c:when>
     </c:choose>
     
     <form:form method="post" action="" modelAttribute="newReservation">
       <div class="form-group">
         <label>Carte Identité</label>
         <form:input id="cin" path="passager.cin" type="text" placeHolder="C.I.N Passager" class="form-control" required = "required"/>
         <form:errors	path="passager.cin"	cssClass="text-danger"/>
       </div>
       <div class="form-group">
         <label>Type Carte Identité</label>
         <form:select path="passager.typeCarte" class="form-control" id="typeCarte" >
            <option value="cin" >Carte Identité Nationnale</option>
            <option value="passwport" >Passeport</option>
         </form:select>
       </div>
       <div class="form-group">
         <label>Nom</label>
         <form:input id="nom" path="passager.nom" type="text" placeHolder="Nom Passager" class="form-control" required = "required"/>
         <form:errors	path="passager.nom"	cssClass="text-danger"/>
       </div>
       
       <div class="form-group">
         <label>Prenom</label>
         <form:input id="prenom" path="passager.prenom" type="text" placeHolder="Nom Passager" class="form-control" required = "required"/>
         <form:errors	path="passager.prenom"	cssClass="text-danger"/>
       </div>
       
       <div class="form-group">
         <label>Date Naissance</label>
         <form:input id="dateNaissance" path="passager.birthDate" type="text" placeHolder="Date Naissance" class="form-control" required = "required"/>
         <form:errors	path="passager.birthDate"	cssClass="text-danger"/>
       </div>
       
       <div class="form-group">
         <label>Email</label>
         <form:input id="email" path="passager.email" type="text" placeHolder="Email Passager" class="form-control" required = "required"/>
         <form:errors	path="passager.email"	cssClass="text-danger"/>
       </div>
       
       <div class="form-group">
         <label>Telephone</label>
         <form:input id="tel" path="passager.tel" type="text" placeHolder="Telephone" class="form-control" required = "required"/>
         <form:errors	path="passager.tel"	cssClass="text-danger"/>
       </div>
       
       <div class="form-group">
         <label>Sexe</label>
         <form:select path="passager.sexe" class="form-control" id="sexe">
           <option value="homme">Homme</option>
           <option value="femme">Femme</option>
         </form:select>
       </div>
       
       <div class="form-group">
         <label>Place</label>
         <form:input path="place" type="number" placeHolder="Places" class="form-control" required = "required"/>
         <form:errors	path="place"	cssClass="text-danger"/>
       </div>
       
       <br/>
       <div>
       <br/><br/>
       	<input type="submit" value="Reserver Maintenant" class="btn btn-danger"/>
       	<br/><br/><br/>
       </div>
       
       
     </form:form>
     
   </div>
   
   <div class="col-md-4" id="vol-info-in-reservation-page">
      <h2>Information Vol</h2>
      
      <p><strong>Date depart  : </strong> ${vol.depart}</p>
      <p><strong>Date arrivée : </strong>${vol.arrivee } </p>
      <p><strong>Aeroport de depart  : </strong> ${vol.aeroportDepart.nom} </p>
      <p><strong>Lieu de depart  : </strong> ${vol.aeroportDepart.ville.nom} , ${vol.aeroportDepart.ville.pays.nom}</p>
      <p><strong>Aeroport d'arrivé  : </strong> ${vol.aeroportArrivee.nom} </p>
      <p><strong>Lieu d'arrivé  : </strong> ${vol.aeroportArrivee.ville.nom} , ${vol.aeroportArrivee.ville.pays.nom}</p>
      <p><strong>Prix : </strong> ${vol.prix } DT</p>
      <p><strong>Avion  : </strong> ${vol.avion.type } (${vol.avion.nbPlaces } places)</p>
      <c:if test="${vol.escales.size()>0 }">
         <p><strong>Escales : </strong></p>
         <c:forEach items="${vol.escales }" var="item">
           <p>${item.aeroport.nom}</p>
         </c:forEach>
      </c:if>
      
   </div>
</section>






<input type="hidden" id="idVol" value="${vol.id }"/>
<input type="hidden" id="totalPlaces" value="${vol.avion.nbPlaces }"/>

<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />" ></script>
<script>
$(function(){
	$( "#dateNaissance" ).datepicker({ dateFormat: 'yy-mm-dd', maxDate:'2018-04-30' });
	
	$('#cin').change(function() {
        var cin = $('#cin').val();
        console.log(cin);
        $.get('/client/find-passager?cin='+cin,function(data){
            if(data != null){
            	$('#nom').val(data.nom);
    			$('#prenom').val(data.prenom);
    			$('#tel').val(data.tel);
    			$('#email').val(data.email);
    			$('#dateNaissance').val(data.birthDate);
    			$('#sexe').val(data.sexe);
    			$('#typeCarte').val(data.typeCarte);
    			
            }else{
				$('#nom').val('');
    			$('#prenom').val('');
    			$('#tel').val('');
    			$('#email').val('');
    			$('#dateNaissance').val('');
    			
            }
			
        });
	});

	var somethingWrong = false;

	$('#place').change(function(){
		var place = $('#place').val();
		var idVol = $('#idVol').val();
		var total = $('#totalPlaces').val();
		console.log(place);
		console.log(idVol);
		console.log(total);
		if(parseInt(place) <= parseInt(total)){
			$('#place-is-too-much-error').remove();
			somethingWrong = false;
			$.get('/client/check-place?place='+place+'&idVol='+idVol,function(data){
				if(data =='YES'){
					$('#place').after('<p class="text-danger" id="place-is-taken-error">Cette place est deja occupé !</p>');
					somethingWrong = true;
				}else{
					$('#place-is-taken-error').remove();
					somethingWrong = false;
				}
			});
		}else{
			console.log('t3ada lel else');
			somethingWrong = true;
			$('#place').after('<p class="text-danger" id="place-is-too-much-error">Ce vol contient '+total+' places !</p>');
		}
		
	})
	$( "#newReservation" ).submit(function( event ) {
		 if(somethingWrong){
			 event.preventDefault();
			 alert("votre fomulaire contient des erreurs vueillez les corriger !");
		 }
		  
		});
});
</script>

</body>
</html>