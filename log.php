<?php

$conn = mysqli_connect("localhost","root","","library");

if (!$conn){
    die ("Connection Failed");
}

$email =$_POST['email'];
$password =$_POST['password'];

$sql = "SELECT * FROM staff WHERE email='$email' AND password='$password'"; 
$result = mysqli_query($conn, $sql);

if(mysqli_num_rows($result)>0){
    echo "Login Successfully!";
    exit();

}else{
    echo "Login Failed";
}

mysqli_close($conn);

?>