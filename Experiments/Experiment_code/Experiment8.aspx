<%@ Page Language="C#" %>

<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>


<script runat="server">
    
protected void sendMail(object sender, EventArgs e)
{
    MailMessage mail = new MailMessage();
    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
    
    mail.From = new MailAddress("cs5610neu@gmail.com");
    
    mail.To.Add(new MailAddress(mailId.Text));
    
    mail.Subject = subject.Text;
    mail.Body = bodyText.Text;

    mail.IsBodyHtml = true;

    smtp.Credentials = new System.Net.NetworkCredential("cs5610neu@gmail.com", "Spr2014ing");
    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
    smtp.EnableSsl = true;

    smtp.Send(mail);
    success.Text = "E-mail was sucessfully sent to " + mailId.Text;
    success.Visible = true;
    
}

</script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Experiment 8</title>
    <link rel="stylesheet" type="text/css" href="../css/css8.css" />

    <meta charset="utf-8" />

    <meta name="viewport"
    content="initial-scale=1, minimum-scale=1"/>
</head>
<body>
    

    <h1>EXPERIMENT 8</h1>
    <h2>Send Email using ASP.NET</h2>

    <form id="form1" runat="server">
    <div>
        
                    <asp:Label ID="mailIdLabel" runat="server" Text="Send Email To :" />
                
                    <asp:TextBox ID="mailId" runat="server" />
                
                    <asp:RequiredFieldValidator ID="EmailFieldValidator" ControlToValidate="mailId" Text="* Enter e-mail address"
                        runat="server" ForeColor="Red" />
                    <br />
                    <asp:RegularExpressionValidator ID="EmailRegEx" ControlToValidate="mailId" runat="server"
                        Text="* Enter a valid e-mail address" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ForeColor="Red" />
                    <br/>
              
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="subjectLabel" runat="server" Text="Subject :" />
                
                    <asp:TextBox ID="subject" runat="server" MaxLength="100" />
                <br/>
                <br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="bodyLabel" runat="server" Text="Feedback :" />
                
                    <asp:TextBox ID="bodyText" TextMode="MultiLine" runat="server" MaxLength="500" Width="200px"
                        Height="60px"/>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="bodyText"
                        Text="* Please enter a message" runat="server" ForeColor="Red" />
              <br/>
              <br/>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="sendButton" OnClick="sendMail" runat="server" Text="Send E-Mail" Width="100px"
                        Height="25px" />
                
        <div id="text">
            <asp:Label ID="success" runat="server" Visible="true"></asp:Label></div>
    </div>
    </form>

    <div class="documentation">
        <hr/>
        <h2>Documentation:</h2>

        <p>This experiment is used to send an e-mail using ASP.NET. </p>
        <p>This experiment is an improvement of Experiment no.6 in which I used form attribute "mailto" to send emails through local email client.</p>
        <p>I performed this experiment because the former experiment was not user friendly.</p>
        <p>I intend to use this for my project for getting feedback from users.</p>
        <p>I have used MailMessage and SmtpClient classes to form an object of mail which is sent as an electronic mail using a Simple Mail Transfer Protocol (SMTP) server for delivery.</p>
        <p>I learnt the asp Label which is very powerful when used in forms.</p>
        <p>I have also performed validation using asp:RegularExpressionValidator and asp:RequiredFieldValidator.</p>

        <p>View Source : <a href="../../fileview/Default.aspx?~/Experiments/Experiment_code/Experiment8.aspx" target="_blank">Click Here!</a></p>

  </div>

</body>
</html>
