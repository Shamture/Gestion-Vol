<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@	taglib	prefix="spring"	uri="http://www.springframework.org/tags"	%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<c:url value = "/agent/"/>"><img src="/images/logo.png" alt="logo" /></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-plane" aria-hidden="true"></i> Gestion Avions <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/agent/ajouter-avion" />">Ajouter Avion</a></li>
            <li><a href="<c:url value="/agent/list-avions" />">Liste Avions</a></li>
            
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-users" aria-hidden="true"></i> Gestion Clients <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/agent/list-demandes" />">Liste Demandes</a></li>
            <li><a href="<c:url value="/agent/list-clients" />">Liste Clients</a></li>
            
          </ul>
        </li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-paper-plane-o" aria-hidden="true"></i> Gestion Vols <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/agent/ajouter-vol" />">Ajouter Vol</a></li>
            <li><a href="<c:url value="/agent/list-vols" />">Liste Vols</a></li>
            
          </ul>
        </li>
        <li><a href="<c:url value="/agent/list-reservations" />"><i class="fa fa-bookmark" aria-hidden="true"></i> Liste Reservations</a></li>
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        
        <li><a href="<c:url value="/deconnecter" />"><i class="fa fa-sign-out" aria-hidden="true"></i> Deconnecter</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>