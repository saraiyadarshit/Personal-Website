﻿<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MovieCentral</title>
    <link rel="stylesheet" type="text/css" href="../project_css/homestyle.css" />

    <meta charset="utf-8" />

    <meta name="viewport"
    content="initial-scale=1, minimum-scale=1"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    
    <script type="text/javascript">

        var apikey = "33j424u44fyb857r2abt3938";
       
        // calls all the functions in the order written below
        onload = function loadImages() {
            loadInTheatresMovies();
            loadPopularMovies();
            loadComingSoonMovies();
        }

        function loadInTheatresMovies() {

            $.ajax({
                //The API call
                url: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?" + "&apikey=" + apikey,
                dataType: "jsonp",
                success: function (response) {
                    console.log(response);
                    if (typeof callback === "function")
                        callback(response);

                    //Storing the data in a variable
                    var movies = response.movies;
                    var imagesofintheatres = $(".intheatres");
                    imagesofintheatres.empty();

                    //Taking the first 5 movies from the data
                    for (var i = 0; i < 5; i++) {
                        var movie = movies[i];
                        
                        //Parsing the data
                        var space = " ";
                        var thumb = movie.posters.original;
                        var id = movie.id;
                        var title = movie.title;

                        //Encapsulating the data to display
                        var image = "<img src=" + thumb + " width =" + 200 + " height = " + 275 + " title ='" + title + "' alt ='" + title + "'>";
                        var display_image = "<a target='_blank' href=MovieInformation.aspx?id=" + id + ">" + image + "</a>";

                        //Displaying the data
                        imagesofintheatres.append(display_image);
                        imagesofintheatres.append(space);
                    }
                }
            });
        }

        function loadPopularMovies() {

            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?" + "&apikey=" + apikey,
                dataType: "jsonp",
                success: function (response) {
                    console.log(response);
                    if (typeof callback === "function")
                        callback(response);
                    var movies = response.movies;
                    var imagesofpopularmovies = $(".displaypopular");
                    imagesofpopularmovies.empty();
                    for (var i = 0; i < 5; i++) {
                        var movie = movies[i];
                      
                        var space = " ";
                        var thumb = movie.posters.original;
                        var id = movie.id;
                        var title = movie.title;
                        var image = "<img src=" + thumb + " width =" + 200 + " height = " + 275 + " title ='" + title + "' alt ='" + title + "'>";
                        var display_image = "<a target='_blank' href=MovieInformation.aspx?id=" + id + ">" + image + "</a>";

                        imagesofpopularmovies.append(display_image);
                        imagesofpopularmovies.append(space);
                    }
                }
            });
        }

        function loadComingSoonMovies() {

            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?" + "&apikey=" + apikey,
                dataType: "jsonp",
                success: function (response) {
                    console.log(response);
                    if (typeof callback === "function")
                        callback(response);
                    var movies = response.movies;
                    var imagesofupcomingmovies = $(".comingsoon");
                    imagesofupcomingmovies.empty();
                    for (var i = 0; i < 5; i++) {
                        var movie = movies[i];
                      
                        var thumb = movie.posters.original;
                        var id = movie.id;
                        var space = " ";
                        var title = movie.title;
                        var image = "<img src=" + thumb + " width =" + 200 + " height = " + 275 + " title ='" + title + "' alt ='" + title + "'>";
                        var display_image = "<a target='_blank' href=MovieInformation.aspx?id=" + id + ">" + image + "</a>";
                       
                        imagesofupcomingmovies.append(display_image);
                        imagesofupcomingmovies.append(space);

                    }
                }
            });
        }

        </script>

</head>

<body>
    <form id="form1" runat="server">

    </form>

    <div class="main_div">
        <div class="main_header">
            <div class="header">
                <p id="heading">Welcome to... MovieCentral</p>
                <p id="tagline">Which Movie will you watch next?</p>
            </div>
            <div class="camerareel">
                <img id="height" src="../../images/camerareel.jpg" />
            </div>
        </div>
        
        <div class="masterNavigation">
                <ul class="master_navigation">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="Search.html">Search</a></li>
                    <li><a href="OnDvd.html">On DVDs</a></li>
                    <li><a href="Compare.html">Compare Movies</a></li>
                    <li><a href="ContactMe.html">Contact Me</a></li>
                    <li><a href="SiteMap.html">Site Map</a></li>
                    <li><a target="_blank" href="../../story/index.htm?../Project/Documentation/story.txt">Documentation</a></li>
                </ul>
            </div>

        <div class="in_theatres">
            <h3>In Theatres: &nbsp;&nbsp;
               <a href="Intheatres.html" target="_blank">(See All)</a>
                
            </h3>
            <div class="intheatres">
                <%--The area where movie in theaters are displayed--%>
            </div>

        </div>

        <div class="Popular_Movies">
            <h3>Popular Movies:&nbsp;&nbsp;
               <a href="PopularMovies.html" target="_blank">(See All)</a> </h3>
            <div class="displaypopular">
                <%--The area where popular movies are displayed--%>
            </div>
        </div>

        <div class="Coming_Soon">
            <h3>Coming Soon:&nbsp;&nbsp;
               <a href="Comingsoon.html" target="_blank">(See All)</a> </h3>
            <div class="comingsoon">
                <%--The area where upcoming movies are displayed--%>
            </div>
        </div>

        <div class="footer">
                <p id="footer_text">
                    Copyright &copy; 2014 Darshit Saraiya | All Rights Reserved  
                </p>
            </div>

    </div>
    
</body>
</html>
