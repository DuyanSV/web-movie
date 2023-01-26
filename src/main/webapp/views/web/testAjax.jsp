<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/24/2021
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button onclick="testt()">test</button>
<div id="testajj"><p>hello</p></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    console.log(document.getElementById('testajj').innerHTML)
    function testt1(){
        console.log(document.getElementsByClassName('footer').length)
        $.ajax({
            url: '/web_movie_war_exploded/test',
            // data: {
            //     format: 'json'
            // },
            error: function() {
                console.log("error")
            },
            success: function(data) {
                document.getElementById('testajj').innerHTML = document.getElementById('testajj').innerHTML + data
            },
            type: 'POST'
        });}
    function testt(){
        console.log(document.getElementsByClassName('footer').length)
    $.ajax({
        url: '/web_movie_war_exploded/test',
        // data: {
        //     format: 'json'
        // },
        error: function() {
            console.log("error")
        },
        success: function(data) {
            document.getElementById('testajj').innerHTML = document.getElementById('testajj').innerHTML + data
        },
        type: 'POST'
    });}
</script>
</body>
</html>
