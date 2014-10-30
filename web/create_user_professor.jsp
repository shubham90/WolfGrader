<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Create User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script type="text/javascript">
             
        </script>
    </head>
    <body>
        <div>
            <div class="container">
                <form class="form-signin" role="form" action="create_user_professor_2.jsp" method="post">
                    <h2 class="form-signin-heading">Create New User Account</h2>
                    <input type="text" class="form-control" placeholder="Unity ID" required autofocus name="unityid">
                    <input type="text" class="form-control" placeholder="First Name" required autofocus name="fname">
                    <input type="text" class="form-control" placeholder="Last Name" required autofocus name="lname">
                    <input type="password" class="form-control" placeholder="Password" required name="password">
                    <input type="hidden" name="role" value="3">
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>