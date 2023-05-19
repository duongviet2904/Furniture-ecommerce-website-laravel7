<!DOCTYPE html>
<html>
<head>
    <title>BSEATED GLOBAL PTY.</title>
</head>
<body>
<div class="float-left site-logo">
    <img src="{{asset('backend/img/logo.png')}}" alt="" style="width: 200px;">
</div>
<h2>Your order {{$order->order_number}} has just been updated by Bseated Blobal Pty.</h2>
<p>Please check your order processing in: <a href="{{route('user.order.show', [$order->id])}}">Link</a></p>
<p>Sincerely!</p>
</body>
</html>
