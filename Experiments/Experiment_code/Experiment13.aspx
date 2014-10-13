<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script runat="server" type="text/C#">

        const string expectedkey = "33j424u44fyb857r2abt3938";

     protected void Page_Load(object sender, EventArgs e)
    {
        const string keyidentifier = "keyidentifier";
        
        if (!IsPostBack)
        {
            id1.Text = keyidentifier;

            id2.Text = expectedkey;

            string Text = KeyTools.GetKey(this, keyidentifier);
            if (Text == "")
            {
                id3.Text = "Null";
            }
        }
    }

        </script>

    
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
    <code>key identifier: <asp:Label ID="id1" runat="server" /></code>
    </p>
    
    <p>
    <code>expected key: <asp:Label ID="id2" runat="server" /></code>
    </p>
    
    <p>
    <code>returned key: <asp:Label ID="id3" runat="server" /></code>
    </p>
    </div>
    </form>

    <div class="documentation">
        <hr/>
        <h2>Documentation:</h2>

        <p>In this experiment I tried to implement API key hiding.</p>

        <p>Unfortunately, I was unable to implement this feature. I have followed all the steps in Prof.Rasala's implementation.</p>

        <p>I was unable to debug it, I was planning to use this in my Project for API key hiding.</p>

        <p>I will definetly try to make this feature work but I think it will be after the submission date.</p>

        <p id="link">View Source : <a href="../../fileview/Default.aspx?~/Experiments/Experiment_code/Experiment13.aspx" target="_blank">Click Here!</a></p>

  </div>

</body>
</html>
