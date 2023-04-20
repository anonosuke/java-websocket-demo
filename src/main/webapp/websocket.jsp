<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Demo</title>
</head>
<body onload="connectWebSocket()">
    <h1>WebSocket Demo</h1>
    <textarea id="messages" rows="10" cols="50" readonly></textarea><br>
    <input type="text" id="message" size="50">
    <button onclick="sendMessage()">Send</button>
</body>
<script>
    let websocket;

    function connectWebSocket() {
        websocket = new WebSocket("ws://" + location.host + "/WebSocketDemo/chat");
        websocket.onmessage = function (event) {
            let messagesArea = document.getElementById("messages");
            messagesArea.value += event.data + "\n";
        };
        websocket.onopen = function () {
            let messagesArea = document.getElementById("messages");
            messagesArea.value += "Connected to server\n";
        };
        websocket.onclose = function () {
            let messagesArea = document.getElementById("messages");
            messagesArea.value += "Disconnected from server\n";
        };
    }

    function sendMessage() {
        let messageInput = document.getElementById("message");
        websocket.send(messageInput.value);
        messageInput.value = "";
    }
</script>
</html>
