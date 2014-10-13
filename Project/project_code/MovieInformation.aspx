﻿<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Details</title>
    <link rel="stylesheet" type="text/css" href="../project_css/MovieInformation.css" />

    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'/>

    <meta charset="utf-8" />

    <meta name="viewport"
    content="initial-scale=1, minimum-scale=1"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

    <script type="text/javascript">
        var apikey = "33j424u44fyb857r2abt3938";

        //Calls the function on loading the page
        onload = function onpageload() {
            //Extracts the movie id from the url using regular expressions
            var url = document.URL;
            var id_check = /[?&]id=([^&]+)/i;
            var match = id_check.exec(url);
            if (match != null) {
                movie_id = match[1];
            } else {
                movie_id = "";
            }

        $("#contents").empty();
        $("#table").empty();
        $("#castinfo").empty();
        $.ajax({
            //The API call for movie information
            url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + movie_id + ".json?" + "&apikey=" + apikey,
            dataType: "jsonp",
            success: function (response) {
                console.log(response);
                var title = response.title;
                var image_path = response.posters.original;

                var display_image = "<img src=" + image_path + " style='width:77%;'" +" title ='" + title + "' alt ='" + title + "' hspace= 20>";

                // displaying the movie image
                $("#movie_image").append(display_image);

                $("#seesimilarmovies").append("<p>Scroll down to see Similar Movies<br></p>");

                //Parsing the data
                var synopsis = response.synopsis;
                if (synopsis == "")
                { synopsis = "Not Available"; }

                var dvd_date = response.release_dates.dvd;
                if (dvd_date === undefined)
                { dvd_date = "Not Available"; }

                var theatre_date = response.release_dates.theater;
                if (theatre_date === undefined)
                { theatre_date = "Not Available"; }

                var audience_rating = response.ratings.audience_score;
                if (audience_rating == "")
                { audience_rating = "Not Available"; }

                var critics_rating = response.ratings.critics_score;
                if (critics_rating == "")
                { critics_rating = "Not Available"; }

                var runtime = response.runtime;
                if (runtime == "")
                { runtime = "Not Available"; }
                else
                { runtime += " Minutes";}

                //Used a table to display the cast
                var cast_table = "<table cellspacing=5>";

                var cast_length = response.abridged_cast.length;

                if (cast_length === 0)
                {
                    cast_table = "Not Available";
                }
              
                for (var i = 0; i < cast_length; i++) {

                    var abridged_cast = response.abridged_cast[i];

                    //Checking if the data received have the information about cast

                    if (abridged_cast.characters === undefined) {
                        var character_name = "Not Available";
                        var cast = response.abridged_cast[i].name;
                        cast_table += "<tr><td>" + cast + "</td><td>&nbsp;&nbsp; </td>" +
                            "<td>Character Played: <i>" + character_name + "</i></td></tr>";
                    }
                    else {
                        character_name = response.abridged_cast[i].characters[0];
                        cast = response.abridged_cast[i].name;
                        cast_table += "<tr><td>" + cast + "</td><td>&nbsp;&nbsp; </td>" +
                            "<td>Character Played: <i>" + character_name + "</i></td></tr>";
                    }
                    
                }
                cast_table += "</table>";
                

                var review = response.critics_consensus;

                if (review === undefined)
                { review = "Not Available"; }
                
                var production_studio = response.studio;

                if (production_studio === undefined)
                { production_studio = "Not Available"; }

                var genre = response.genres;
                var display_genre = "";
                
                //Storing the genre in a string
                for (var i in genre)
                {
                    display_genre += genre[i] + "<br/>";
                }

                var mpaa_rating = response.mpaa_rating;

                if (mpaa_rating == "G")
                { mpaa_rating = "G = General Audiences-All Ages Admitted." }
                else if (mpaa_rating == "PG")
                { mpaa_rating = "PG = Parental Guidance Suggested. Some Material May Not Be Suitable For Children." }
                else if (mpaa_rating == "PG-13")
                { mpaa_rating = "PG-13 = Parents Strongly Cautioned. Some Material May Be Inappropriate For Children Under 13." }
                else if (mpaa_rating == "R")
                { mpaa_rating = "R = Restricted, Under 17 Requires Accompanying Parent Or Adult Guardian." }
                else if (mpaa_rating == "NC-17")
                { mpaa_rating = "NC-17 = No One 17 And Under Admitted." }

                //Appending the variables to display in one variable
                var specificmoviedetails = "<p class='specificmovieinfotitle'>Title: </p><p class='specificmovieinfocontents'>" + title + "</p><br>" +
                                           "<p class='specificmovieinfotitle'>Synopsis: </p><p class='specificmovieinfocontents'>" + synopsis + "</p><br>" +
                                           "<p class='specificmovieinfotitle'>Release Dates: </p><p class='specificmovieinfocontents'> On DVD : " + dvd_date +
                                           "<br /> In Theater : " + theatre_date + "</p><br/>" +
                                           "<p class='specificmovieinfotitle'>Average Rating: </p><p class='specificmovieinfocontents'> Audience Rating : " + audience_rating +
                                           "<br /> Critics Rating : " + critics_rating + "</p><br/>" +
                                           "<p class='specificmovieinfotitle'>Runtime: </p><p class='specificmovieinfocontents'>" + runtime + " </p><br>" +
                                           "<div class='flip'>Cast (Click for Details): </div><div id='castinfo' class='panel'>" + "</div><br>" +
                                           "<p class='specificmovieinfotitle'>Review: </p><p class='specificmovieinfocontents'>" + review + "</p><br>" +
                                           "<p class='specificmovieinfotitle'>Production Studio: </p><p class='specificmovieinfocontents'>" + production_studio + "</p><br>" +
                                           "<p class='specificmovieinfotitle'>Genre(s): </p><p class='specificmovieinfocontents'>" + display_genre + "</p><br>" +
                                           "<p class='specificmovieinfotitle'>MPAA Rating: </p><p class='specificmovieinfocontents'>" + mpaa_rating + "</p><br>" +
                                           "<p class='specificmovieinfotitle'>People Also Liked (Click for Details): </p><br/>"
                ;

                //Displaying the data
                $("#contents").append(specificmoviedetails);
                //Displaying the cast information
                $("#castinfo").append(cast_table);

                //Calling the function to display similar movies
                SimilarMovies(movie_id);
            },
                
                error: function (error) {
                    alert("Error");
                }
        });
        }

        function SimilarMovies(movie_id) {

            $.ajax({
                //The API call for similar movies
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + movie_id + "/similar.json?" + "&apikey=" + apikey,
                dataType: "jsonp",
                success: function (response) {
                    console.log(response);
                    //Initialing a table to display the similar movies
                    var similar_table = $("<table class='similarmovies'>");
                    var similar_message = $("<p class='specificmovieinfocontents'>");
                    similar_table.empty();
                    similar_message.empty();

                    var movies = response.movies;
                    var length = movies.length;
                    
                    //Checking to see if there are any similar movies
                    if (length === 0) {
                        var message = "There are NO Similar Movies to display";
                        similar_message.append(message);
                        $("#contents").append(similar_message);
                        
                    }

                    else {

                        for (var i in movies) {
                            var movie = movies[i];

                            //Parsing the data
                            var id = movie.id;
                            var title = movie.title;
                            var thumb = movie.posters.original;
                            var audience = movie.ratings.audience_score;
                            var critics = movie.ratings.critics_score;

                            //Encapsulating the data
                            var tr = $("<tr>");

                            var image = "<img src=" + thumb + " width =" + 100 + " height = " + 150 + " title ='" + title + "' alt ='" + title + "'hspace= 20>";
                            var td = $("<td>");
                            var display_image = "<a href=MovieInformation.aspx?id=" + id + ">" + image + "</a>";
                            td = $("<td>");
                            td.append(display_image);
                            tr.append(td);

                            var td = $("<td>");
                            var display_title = " <a href=MovieInformation.aspx?id=" + id + ">" + title + "</a>";
                            td.append(display_title);
                            tr.append(td);

                            similar_table.append(tr);
                        }

                        //Displaying the similar movies in table
                        $("#contents").append(similar_table);
                    }

                    //calling the sliding panel function
                    SlidePanel();

                }
            });
        }

        //The function for the sliding panel of cast information
        function SlidePanel() {
            $(".flip").click(function () {
                $(".panel").slideToggle("slow");
            });
        }

      </script>
</head>
<body>
    <form id="form1" runat="server">
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
                    <li><a href="../../story/index.htm?../Project/Documentation/story.txt" target="_blank">Documentation</a></li>
                </ul>
         </div>

          <div class="MovieDetails">
             <div class="MovieDetailsWrapper">
                 <h3>Movie Details:</h3>
                 <div class="MovieImageWrapper">
                  <%--the movie image is displayed here--%>
                    <div class="imagecontents" id="movie_image">
                    </div>
                    <br />
                    <div class="imagecontents" id="seesimilarmovies">
                    </div>
              </div>
              <div class="MovieContents" id="contents">
                  <%--The movie information is displayed in this area--%>
              </div>
            </div>
          </div>
        
          <div class="footer">
                <p id="footer_text">
                    Copyright &copy; 2014 Darshit Saraiya | All Rights Reserved  
                </p>
            </div>
        
    
    </div>
    </form>
</body>
</html>
