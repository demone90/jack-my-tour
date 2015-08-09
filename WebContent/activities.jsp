<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
        <%@ page import="java.util.Iterator" %>
            <%@ page import="develop.com.jackmytour.core.Restaurant" %>
            <%@ page import="develop.com.jackmytour.core.Item" %>
            <%@ page import="develop.com.jackmytour.core.DrinkBar" %>
            <%@ page import="com.evdb.javaapi.data.Event"%>
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

                <head>
                    <meta charset="UTF-8">
                    <meta content="IE=edge" http-equiv="X-UA-Compatible">
                    <meta content="width=device-width, initial-scale=1" name="viewport">
                    <meta http-equiv="cache-control" content="max-age=0" />
					<meta http-equiv="cache-control" content="no-cache" />
					<meta http-equiv="expires" content="0" />
					<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
					<meta http-equiv="pragma" content="no-cache" />
                    
                    <title>Jack My Tour</title>

                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
                    <link rel="stylesheet" href="//cdn.jsdelivr.net/fontawesome/4.3.0/css/font-awesome.min.css" />
                    <link href="http://fonts.googleapis.com/css?family=Open+Sans:700,600,400&subset=latin,latin-ext" rel="stylesheet" type="text/css">
                    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/awesome-bootstrap-checkbox/v0.2.3/awesome-bootstrap-checkbox.min.css" />
                    <link rel="stylesheet" href="css/styles.css">

                    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>
                                      

                    <!--[if IE]>
        <script src="https://cdn.jsdelivr.net/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
                </head>

                <body ng-app>


                    <div class="container">

                        <div ng-include="'header.jsp'"></div>

                    </div>


                    <main class="container" id="act">
                    <% ArrayList<Restaurant> rests = (ArrayList
                            <Restaurant>) request.getAttribute("restutants_yelp"); 
                    
                    ArrayList<DrinkBar> drinks = (ArrayList<DrinkBar>) request.getAttribute("drinks");     
                    
                	// this 2 lists must be of type Item (with their temp UUID)
                    ArrayList<Item> sports= (ArrayList<Item>) request.getAttribute("sports");
            		
                    ArrayList<Item> musics = (ArrayList<Item>) request.getAttribute("musics");                     
                    %>
                    
                        <div class="row">
                            <div class="col-sm-offset-1 col-sm-10">
                            <form method="POST" ACTION="createAgenda">
                            
                                <ul class="nav nav-tabs nav-justified" id="myTab">
                                    <% 
                            			String[] tabs = (String[]) request.getAttribute("tabs");
                                    	if(tabs != null) { 
                                    		boolean check = true;
                                    		for(String tab : tabs) { 
                                    		if(check){ %>
                                    			 <li class="active"><a href="#<%=tab%>" data-toggle="tab"><%=tab%></a>
                                                 </li>
                                                 <% } else {%>
                                                 <li><a href="#<%=tab%>" data-toggle="tab"><%=tab%></a>
                                                 </li>
                                    		<% } check = false;}
                                    	}
                                    %>
                                    
                                </ul>
                                <div class="tab-content">
                                   
                                    <% 
                                    boolean check2 = true;
                                    String classactive = "";
                                    for(String tab : tabs) { 
                                    	if(check2){classactive = "active"; } else {classactive = ""; }
                       			 			if(tab.equals("Food")) { 
                       			 					if(rests.size() != 0) {%> 
                       			 					<div class="tab-pane <%= classactive %>" id="Food">
                                                        <select class="form-control" id="food-type">
                                                          <option>all</option>
                                                          <option>chinese</option>
                                                          <option>italian</option>
                                                          <option>Vegetarian</option>
                                                          <option>Japanese</option>
                                                          <option>Indian</option>
                                                        </select>
                                                      
                                                      <select class="form-control" name="food-duration">
                                                      		<option value="900000">0:15</option>
                                                      		<option value="1800000">0:30</option>
                                                      		<option value="2700000">0:45</option>
                                                      		<option value="3600000">1:00</option>
                                                      		<option value="4500000">1:15</option>
                                                      		<option value="5400000">1:30</option>
                                                      		<option value="6300000">1:45</option>
                                                      		<option value="7200000">2:00</option>
                                                      		<option value="8100000">2:15</option>
                                                      		<option value="9000000">2:30</option>
                                                      		<option value="9900000">2:45</option>
                                                      		<option value="10800000">3:00</option>
                                                      		<option value="11700000">3:15</option>
                                                      		<option value="12600000">3:30</option>
                                                      		<option value="13500000">3:45</option>
                                                      		<option value="14400000">4:00</option>
                                                      		<option value="15300000">4:15</option>
                                                      		<option value="16200000">4:30</option>
                                                      		<option value="17100000">4:45</option>
                                                      		<option value="18000000">5:00</option>
                                                      		<option value="18900000">5:15</option>
                                                      		<option value="19800000">5:30</option>
                                                      		<option value="20700000">5:45</option>
                                                      		<option value="21600000">6:00</option>                                                      		
                                                      	</select>
                                                      
                                                      
                                                        <div id="test"></div>
                                                     
                                                    <ul class="list-group" id="food-list"><% 
                                                    		Iterator<Restaurant> iter = rests.iterator(); 
                                                    			int i=0; 
                                                    			for (Restaurant restaurant: rests) { 
                                                    				i=i+1; String a="rest"+i;
                                                     %>
                                                         <div class="item-line"></div>	
                                                    <div class="checkbox checkbox-warning">	
                                                    	<input id="<%=a%>" type="checkbox" name="rests" value="<%=restaurant.getName()+"+"+restaurant.getAddress()%>">
                                                            <label for="<%=a%>" class="rest-item"><%=restaurant.getName() %>
                                                            	</br><span>Address: <%= restaurant.getAddress() %></span>
                                                            </label>
                                                    </div>	
                                                    		
                                                    			<%}
                                                    		
                                                    	%>
                                                        
                                                    </ul>
                                                </div><% 
                       			 					}else { 
                       			 						//qui finisce il tab content del food
                       			 					}
                       			 			}else if(tab.equals("Drinks")) {
                   			 					    if(drinks.size() != 0) {%> 
                       			 					<div class="tab-pane  <%= classactive %>" id="Drinks">

														<select class="form-control" name="drinks-duration">
                                                      		<option value="900000">0:15</option>
                                                      		<option value="1800000">0:30</option>
                                                      		<option value="2700000">0:45</option>
                                                      		<option value="3600000">1:00</option>
                                                      		<option value="4500000">1:15</option>
                                                      		<option value="5400000">1:30</option>
                                                      		<option value="6300000">1:45</option>
                                                      		<option value="7200000">2:00</option>
                                                      		<option value="8100000">2:15</option>
                                                      		<option value="9000000">2:30</option>
                                                      		<option value="9900000">2:45</option>
                                                      		<option value="10800000">3:00</option>
                                                      		<option value="11700000">3:15</option>
                                                      		<option value="12600000">3:30</option>
                                                      		<option value="13500000">3:45</option>
                                                      		<option value="14400000">4:00</option>
                                                      		<option value="15300000">4:15</option>
                                                      		<option value="16200000">4:30</option>
                                                      		<option value="17100000">4:45</option>
                                                      		<option value="18000000">5:00</option>
                                                      		<option value="18900000">5:15</option>
                                                      		<option value="19800000">5:30</option>
                                                      		<option value="20700000">5:45</option>
                                                      		<option value="21600000">6:00</option>                                                       		
                                                      	</select>


                                                    <ul class="list-group"  id="notfood"><% 
                                                    		Iterator<DrinkBar> iter = drinks.iterator(); 
                                                    			int i=0; 
                                                    			for (DrinkBar bar: drinks) { 
                                                    				i=i+1; String a="bar"+i;
                                                     %>
                                                    <div class="item-line"></div>	
                                                    <div class="checkbox checkbox-warning">	
                                                    	<input id="<%=a%>" type="checkbox" name="drinks" value="<%=bar.getName()+"+"+bar.getAddress()%>">
                                                            <label for="<%=a%>" class="rest-item"><%=bar.getName() %>
                                                            	</br><span>Address: <%= bar.getAddress() %></span>
                                                            </label>
                                                    </div>	
                                                    		
                                                    	        <%}
                                                    		
                                                    	%>
                                                        
                                                    </ul>
                                                </div><% 
                       			 					}else { 
                       			 						//qui finisce il tab content del food
                       			 					}
                       			 			 }else if(tab.equals("Music")) {
                			 					    if(musics.size() != 0) {%> 
                    			 					<div class="tab-pane  <%= classactive %>" id="Music">

														<select class="form-control" name="music-duration">
                                                      		<option value="900000">0:15</option>
                                                      		<option value="1800000">0:30</option>
                                                      		<option value="2700000">0:45</option>
                                                      		<option value="3600000">1:00</option>
                                                      		<option value="4500000">1:15</option>
                                                      		<option value="5400000">1:30</option>
                                                      		<option value="6300000">1:45</option>
                                                      		<option value="7200000">2:00</option>
                                                      		<option value="8100000">2:15</option>
                                                      		<option value="9000000">2:30</option>
                                                      		<option value="9900000">2:45</option>
                                                      		<option value="10800000">3:00</option>
                                                      		<option value="11700000">3:15</option>
                                                      		<option value="12600000">3:30</option>
                                                      		<option value="13500000">3:45</option>
                                                      		<option value="14400000">4:00</option>
                                                      		<option value="15300000">4:15</option>
                                                      		<option value="16200000">4:30</option>
                                                      		<option value="17100000">4:45</option>
                                                      		<option value="18000000">5:00</option>
                                                      		<option value="18900000">5:15</option>
                                                      		<option value="19800000">5:30</option>
                                                      		<option value="20700000">5:45</option>
                                                      		<option value="21600000">6:00</option>                                                         		
                                                      	</select>


                                                 <ul class="list-group"  id="notfood"><% 
                                                 		Iterator<Item> iter = musics.iterator(); 
                                                 			int i=0; 
                                                 			for (Item item: musics) { 
                                                 				i=i+1; String a="musicEvent"+i;
                                                  %>
                                                 <div class="item-line"></div>	
                                                 <div class="checkbox checkbox-warning">	
                                                 	<input id="<%=a%>" type="checkbox" name="musics" value="<%= item.getName()+"+"+ item.getAddress() %>">
                                                         <label for="<%=a%>" class="rest-item"><%=item.getName() %>
                                                         	</br><span>Address: <%= item.getAddress() %></span>
                                                         </label>
                                                 </div>	
                                                 		
                                                 	      <%}
                                                 		
                                                 	%>
                                                     
                                                 </ul>
                                             </div><% 
                    			 					}else { 
                    			 						
                    			 					}
                    			 			 }else if(tab.equals("Sports")) {
             			 					    if(sports.size() != 0) {%> 
                 			 					<div class="tab-pane  <%= classactive %>" id="Sports">

													<select class="form-control" name="sports-duration">
                                                      		<option value="900000">0:15</option>
                                                      		<option value="1800000">0:30</option>
                                                      		<option value="2700000">0:45</option>
                                                      		<option value="3600000">1:00</option>
                                                      		<option value="4500000">1:15</option>
                                                      		<option value="5400000">1:30</option>
                                                      		<option value="6300000">1:45</option>
                                                      		<option value="7200000">2:00</option>
                                                      		<option value="8100000">2:15</option>
                                                      		<option value="9000000">2:30</option>
                                                      		<option value="9900000">2:45</option>
                                                      		<option value="10800000">3:00</option>
                                                      		<option value="11700000">3:15</option>
                                                      		<option value="12600000">3:30</option>
                                                      		<option value="13500000">3:45</option>
                                                      		<option value="14400000">4:00</option>
                                                      		<option value="15300000">4:15</option>
                                                      		<option value="16200000">4:30</option>
                                                      		<option value="17100000">4:45</option>
                                                      		<option value="18000000">5:00</option>
                                                      		<option value="18900000">5:15</option>
                                                      		<option value="19800000">5:30</option>
                                                      		<option value="20700000">5:45</option>
                                                      		<option value="21600000">6:00</option>                                                                		
                                                      	</select>
													

                                              <ul class="list-group"  id="notfood"><% 
                                              		Iterator<Item> iter = sports.iterator(); 
                                              			int i=0; 
                                              			for (Item item: sports) { 
                                              				i=i+1; String a="sportEvent"+i;
                                               %>
                                              <div class="item-line"></div>	
                                              <div class="checkbox checkbox-warning">	
                                              	<input id="<%=a%>" type="checkbox" name="sports" value="<%= item.getName()+"+"+ item.getAddress() %>">
                                                      <label for="<%=a%>" class="rest-item"><%=item.getName() %>
                                                      	</br><span>Address: <%=  item.getAddress()  %></span>
                                                      </label>
                                              </div>	
                                              		
                                              	      <%}
                                              		
                                              	%>
                                                  
                                              </ul>
                                          </div><% 
                 			 					}else { 
                 			 						
                 			 					}
                 			 			 } check2 = false;
                       				}
                                    %>
                                    
                                    <!-- @end #hello -->
									
                                 
                                    <!-- @end #empty -->
                                    
                                    <!-- @end #sports -->
 </div>
 
 <div class="col-xs-12">
 <INPUT class="btn btn-primary btn-lg btn-block" TYPE=submit name=submit Value="Create agenda" id="ag">
 </div>
 </form>
                                </div>
                            </div>
                        

                        
                    </main>

                    <div class="container footer">

                        <div ng-include="'footer.html'"></div>

                    </div>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
                    <script type="text/javascript" src="js/bootstrap-tabcollapse.js"></script>
                    <script type="text/javascript">
                        $('#myTab').tabCollapse();
                    </script>
                      <script type="text/javascript">
                      $(document).ready(function() {
                        $("#food-type").change(function(){
                        	 var term = $('#food-type :selected').text();
                       	  $.ajax({
                        	      url: 'UpdateActivities',
                        	        type: "POST",
                        	        data: {"term" : term},
                        	        success: function(request, response){
                        	        rests  = data.rests;     
                        	    $("#test").html("success"); 
                        	  
                        	         },
                        	        error: function(request, response){
                          	          //  rests  = data.rests;
                          	          $('#test').html("fail"); 
                          	         },
                        	    }); 
                        });
                      });
                    </script>


                </body>

                </html>