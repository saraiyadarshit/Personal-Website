<%@ Page Language="C#" %>

<script runat="server">
    //This demo page has no server side script


</script>

<!DOCTYPE html>

<html lang="en">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <script lang="javascript">

        $(document).ready(function () {
            $("#mybody section h1").click(function (z) {
                $(this).parents().siblings("section").addClass("hide_para");
                $(this).parents("section").removeClass("hide_para");

                z.preventDefault();
            });
        });
        </script>

    <head>

        <meta charset='utf-8' />
        <meta name="viewport"
        content="initial-scale=1, minimum-scale=1">

        <title>Darshit Home Page</title>
        <link rel="stylesheet" type="text/css" href="css/mystyle.css" />


    </head>

    <body>

        <div class="main_div">

            <div class="header">
                <div class="welcome">
                    <%--<h4><font color="grey">Welcome to</font> my Homepage!</h4>--%>
                    <h4>Welcome to my Homepage!</h4>
                </div>

                <div class="wrapper_name">
                    <div class="myname">
                          <h1>Darshit D. Saraiya&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <iframe src="http://free.timeanddate.com/clock/i3z2o5vx/n43/fn2/fs16/fcfff/tc000/ftb/bo3/pa8/tt0/th1/ta1/tb4" frameborder="0" width="308" height="60"></iframe></h1>
                    </div>
                </div>
            </div>
            
            <div class="masterNavigation">
                <ul class="master_navigation">
                    <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
                    <li><a href="statistics/" target="_blank">Statistics</a></li>
                    <li><a href="source/" target="_blank">Source</a></li>
                    <li><a href="search/" target="_blank">Search</a></li>
                    <li><a href="searchtree/" target="_blank">SearchTree</a></li>
                    <li><a href="textview/" target="_blank">TextView</a></li>
                    <li><a href="filelist.aspx" target="_blank">FileList</a></li>
                    <li><a href="autofile.aspx" target="_blank">AutoFile</a></li>
                    <li><a href="images/autoimage.aspx" target="_blank">Images</a></li>
                    <li><a href="blog/" target="_blank">Blog</a></li>
                    <li><a href="story/index.htm?../experiments/story.txt" target="_blank">Experiments</a></li>
                    <li><a href="Project/project_code/Default.aspx" target="_blank">Project</a></li>
                </ul>
            </div>


            <div class="main_body">
                <div class="leftbox">
                    <img id="width" src="images/Profile.jpg" alt="My Profile Pic" title="My Profile Pic" />
                </div>

                <div class="rightbox">
                    <div id="mybody">
                        <section id="para1">
                            <p class="arrow">&#9758;</p>
                            <h1><a href="#">About Me</a></h1>

                            <p>Hi, I am <strong>Darshit Saraiya</strong>, a graduate Student at Northeastern University.
                                I have enrolled in this course because my interest lies in developing interactive websites.
                                I look forward to learn new technologies such as .NET , AJAX and JQUERY. 
                                I am also interested in sports like swimming, cricket and soccer. </p>
                            <p>My home page will be enanced as the course progresses and I learn new techniques to make my homepage standout.</p>
                            <p id="link">You can find my resume here :  <a href="documents/DARSHIT SARAIYA_Resume.pdf" target="_blank">My Resume</a></p>
                        </section>

                        <section id="para2" class="hide_para">
                            <p class="arrow">&#9758;</p>
                            <h1><a href="#">Important Links</a></h1>
                  
                            <p id="links">A link to professor Rasala's HomePage : <a href="http://net4.ccs.neu.edu/home/rasala/Default.aspx" target="_blank">Dr.Rasala's Website</a><br/>
                            A link to professor Jose Annuziato's HomePage : <a href="http://net4.ccs.neu.edu/home/jga/" target="_blank">Jose Annunziato</a><br/>
                            A link to my Project : <a href="Project/project_code/Default.aspx" target="_blank">My Project</a><br/>
                            A link to University's homepage : <a href="http://www.northeastern.edu/" target="_blank">Northeastern University</a><br/><br />
                                <strong><u>References:</u></strong><br />
                            A link to W3schools.com : <a href="http://www.w3schools.com/" target="_blank">W3 Schools</a>
                            </p>
                        </section>

                        <section id="para3" class="hide_para">
                            <p class="arrow">&#9654;</p>
                                <h1><a href="#">Contact Me</a></h1>
                            <p><strong>Email : </strong>saraiya.d@husky.neu.edu
                            <br/>
                            <br/>
                            <strong>Phone :</strong> (617)-459-7376
                            <br/>
                            <br/>
                            <strong>Follow Me :</strong>
                            <br/>
                                <a href="https://www.facebook.com/saraiyadarshit" target="_blank"> <img src="images/facebook1.png" width="42" height="42" alt="Facebook" title="Facebook"></a>
                                <a href="http://www.linkedin.com/pub/darshit-saraiya/84/610/4a5" target="_blank"> <img src="images/linkedin1.png" width="42" height="42" alt="Linked in" title="Linked in"></a>
                                
                            </p>
                        </section>
                    </div>

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
