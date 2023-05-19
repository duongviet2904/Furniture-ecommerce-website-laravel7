@extends('user.layouts.master')

@section('title','Order Detail')

@section('main-content')
    <div class="card">
        <h5 class="card-header">
            <a href="{{route('user.order.index')}}" class=" btn btn-sm btn-danger shadow-sm">Back</a>
        </h5>
        <div class="card-body">
            <section>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-stepper text-black" style="border-radius: 16px;">
                                <div class="card-body">
                                    <ul id="progressbar-2" class="d-flex justify-content-between mx-0 mt-0 mb-5 px-0 pt-0 pb-2">
                                        @if($order->status=='new')
                                            <li class="step0 text-center" id="step1"></li>
                                            <li class="step0 text-center" id="step2"></li>
                                            <li class="step0 text-center" id="step3"></li>
                                            <li class="step0 text-muted text-end" id="step4"></li>
                                        @elseif($order->status=='process')
                                            <li class="step0 active text-center" id="step1"></li>
                                            <li class="step0 text-center" id="step2"></li>
                                            <li class="step0 text-center" id="step3"></li>
                                            <li class="step0 text-muted text-end" id="step4"></li>
                                        @elseif($order->status=='transfer')
                                            <li class="step0 active text-center" id="step1"></li>
                                            <li class="step0 active text-center" id="step2"></li>
                                            <li class="step0 active text-center" id="step3"></li>
                                            <li class="step0 text-muted text-end" id="step4"></li>
                                        @elseif($order->status=='delivered')
                                            <li class="step0 active text-center" id="step1"></li>
                                            <li class="step0 active text-center" id="step2"></li>
                                            <li class="step0 active text-center" id="step3"></li>
                                            <li class="step0 active text-end" id="step4"></li>
                                        @else
                                            <span class="">{{$order->status}}</span>
                                        @endif
                                    </ul>

                                    <div class="d-flex justify-content-between">
                                        <div class="d-lg-flex align-items-center">
                                            <i class="fas fa-clipboard-list fa-3x me-lg-4 mb-3 mb-lg-0"></i>
                                            <div>
                                                <p class="fw-bold mb-1">Order</p>
                                                <p class="fw-bold mb-0">Processed</p>
                                            </div>
                                        </div>
                                        <div class="d-lg-flex align-items-center">
                                            <i class="fas fa-box-open fa-3x me-lg-4 mb-3 mb-lg-0"></i>
                                            <div>
                                                <p class="fw-bold mb-1">Order</p>
                                                <p class="fw-bold mb-0">Shipped</p>
                                            </div>
                                        </div>
                                        <div class="d-lg-flex align-items-center">
                                            <i class="fas fa-shipping-fast fa-3x me-lg-4 mb-3 mb-lg-0"></i>
                                            <div>
                                                <p class="fw-bold mb-1">Order</p>
                                                <p class="fw-bold mb-0">En Route</p>
                                            </div>
                                        </div>
                                        <div class="d-lg-flex align-items-center">
                                            <i class="fas fa-home fa-3x me-lg-4 mb-3 mb-lg-0"></i>
                                            <div>
                                                <p class="fw-bold mb-1">Order</p>
                                                <p class="fw-bold mb-0">Arrived</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            @if($order)
                <div class="row">
                    <div class="col-sm-12 col-lg-12">
                        <div class="panel panel-default invoice" id="invoice">
                            <div class="panel-body">
                                <div class="row">

                                    <div class="col-sm-6 top-left" style="display: flex;">
                                        <div style="background-image: url('{{asset('backend/img/logo.png')}}');
                                      background-repeat: no-repeat;
                                      height: 100px; width: 250px;
                                      background-size: contain;
                                      background-position: center;">
                                        </div>
                                        <div class="order-status"
                                             style="clear: both; line-height: 1; margin-left: 20px;">
                                            @if($order->status=='new')
                                                <span class="">{{$order->status}}</span>
                                            @elseif($order->status=='process')
                                                <span class="">{{$order->status}}</span>
                                            @elseif($order->status=='delivered')
                                                <span class="">{{$order->status}}</span>
                                            @else
                                                <span class="">{{$order->status}}</span>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="col-sm-6 top-right">
                                        <h3 class="marginright">{{$order->order_number}}</h3>
                                        <span class="marginright">{{$order->created_at->format('D d M, Y')}} </span>
                                    </div>

                                </div>
                                <hr>
                                <div class="row">
                                    @php
                                        $settings=DB::table('settings')->first();
                                    @endphp
                                    <div class="col-lg-4 from">
                                        <p class="lead marginbottom">From : BSeated Global Pty.</p>
                                        <p>Phone Number: {{$settings->phone}}</p>
                                        <p>Email: {{$settings->email}}</p>
                                        <p>Address: {{$settings->address}}</p>
                                    </div>

                                    <div class="col-lg-4 to">
                                        <p class="lead marginbottom">
                                            To: {{$order->first_name}} {{$order->last_name}}</p>
                                        <p>Phone Number: {{$order->phone}}</p>
                                        <p>Email: {{$order->email}}</p>
                                        <p>First Address: {{$order->address1}}</p>
                                        <p>Second Address: {{$order->address2}}</p>
                                    </div>

                                    <div class="col-lg-4 text-left payment-details">
                                        <p class="lead marginbottom payment-info">Payment details</p>
                                        @php
                                            $shipping=DB::table('shippings')->where('id', $order->shipping_id)->first();
                                        @endphp
                                        <p>Shipping Method: {{$shipping->type}}</p>
                                        <p>Payment Method: {{$order->payment_method}}</p>
                                        <p>Payment Status: {{$order->payment_status}}</p>
                                    </div>

                                </div>

                                <div class="row table-row">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th class="text-center" style="width:5%">#</th>
                                            <th style="width:50%">Product Name</th>
                                            <th class="text-right" style="width:15%">Quantity</th>
                                            <th class="text-right" style="width:15%">Unit Price</th>
                                            <th class="text-right" style="width:15%">Total Price</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @php
                                            $index = 0;
                                        @endphp
                                        @foreach($order->cart_info as $cart)
                                            @php
                                                $product=DB::table('products')->where('id',$cart->product_id)->first();
                                                $index++;
                                            @endphp
                                            <tr>
                                                <td class="text-center">{{$index}}</td>
                                                <td>{{$product->title}}</td>
                                                <td class="text-right">{{$cart->quantity}}</td>
                                                <td class="text-right">{{$cart->price}}</td>
                                                <td class="text-right">{{$cart->amount}}</td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>

                                </div>

                                <div class="row">
                                    <div class="col-lg-6 margintop">
                                        <p class="lead marginbottom">THANK YOU!</p>
                                        <a href="{{route('order.pdf',$order->id)}}">
                                            <button class="btn btn-success" id="invoice-print"><i class="fa fa-print"></i>
                                                Print Invoice
                                            </button>
                                        </a>
                                    </div>
                                    <div class="col-lg-6 text-right pull-right invoice-total">
                                        <p>Subtotal : ${{number_format($order->sub_total,2)}}</p>
                                        <p>Discount : ${{number_format($order->coupon,2)}} </p>
                                        <p>Shipping Fee : ${{$order->shipping->price}} </p>
                                        <p>Total : ${{number_format($order->total_amount,2)}} </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            @endif
        </div>
    </div>
@endsection

@push('styles')
<style>
    .order-info,.shipping-info{
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4,.shipping-info h4{
        text-decoration: underline;
    }
    body {
        margin-top: 20px;
        background: #eee;
    }

    /*Invoice*/
    .invoice .top-left {
        font-size: 65px;
        color: #3ba0ff;
    }

    .invoice .top-right {
        text-align: right;
        padding-right: 20px;
    }

    .invoice .table-row {
        margin-left: -15px;
        margin-right: -15px;
        margin-top: 25px;
    }

    .invoice .payment-info {
        font-weight: 500;
    }

    .invoice .table-row .table > thead {
        border-top: 1px solid #ddd;
    }

    .invoice .table-row .table > thead > tr > th {
        border-bottom: none;
    }

    .invoice .table > tbody > tr > td {
        padding: 8px 20px;
    }

    .invoice .invoice-total {
        margin-right: -10px;
        font-size: 16px;
    }

    .invoice .last-row {
        border-bottom: 1px solid #ddd;
    }

    .order-status {
        width: 200px;
    }

    .order-status span {
        width: 150px;
        border: 1px solid gray;
        border-radius: 15px;
        padding: 10px 30px;
        color: gray;
        font-size: 16px;
    }

    @media (max-width: 575px) {
        .invoice .top-left, .invoice .top-right, .invoice .payment-details {
            text-align: center;
        }

        .invoice .from, .invoice .to, .invoice .payment-details {
            float: none;
            width: 100%;
            text-align: center;
            margin-bottom: 25px;
        }

        .invoice p.lead, .invoice .from p.lead, .invoice .to p.lead, .invoice .payment-details p.lead {
            font-size: 22px;
        }

        .invoice .btn {
            margin-top: 10px;
        }
    }

    @media print {
        .invoice {
            width: 900px;
            height: 800px;
        }
    }

    /*////////////////*/
    .card-stepper {
        z-index: 0
    }

    #progressbar-2 {
        color: #455A64;
    }

    #progressbar-2 li {
        list-style-type: none;
        font-size: 13px;
        width: 33.33%;
        float: left;
        position: relative;
    }

    #progressbar-2 #step1:before {
        content: '\f058';
        font-family: "Font Awesome 5 Free";
        color: #fff;
        width: 37px;
        margin-left: 0px;
        padding-left: 0px;
    }

    #progressbar-2 #step2:before {
        content: '\f058';
        font-family: "Font Awesome 5 Free";
        color: #fff;
        width: 37px;
    }

    #progressbar-2 #step3:before {
        content: '\f058';
        font-family: "Font Awesome 5 Free";
        color: #fff;
        width: 37px;
        margin-right: 0;
        text-align: center;
    }

    #progressbar-2 #step4:before {
        content: '\f111';
        font-family: "Font Awesome 5 Free";
        color: #fff;
        width: 37px;
        margin-right: 0;
        text-align: center;
    }

    #progressbar-2 li:before {
        line-height: 37px;
        display: block;
        font-size: 12px;
        background: #c5cae9;
        border-radius: 50%;
    }

    #progressbar-2 li:after {
        content: '';
        width: 100%;
        height: 10px;
        background: #c5cae9;
        position: absolute;
        left: 0%;
        right: 0%;
        top: 15px;
        z-index: -1;
    }

    #progressbar-2 li:nth-child(1):after {
        left: 1%;
        width: 100%;
        @if($order->status=='process')
            background: #c5cae9 !important;
        @endif
    }

    #progressbar-2 li:nth-child(2):after {
        left: 1%;
        width: 100%;
    }

    #progressbar-2 li:nth-child(3):after {
        left: 1%;
        width: 100%;
        @if($order->status=='transfer')
            background: #c5cae9 !important;
        @endif
    }

    #progressbar-2 li:nth-child(4) {
        left: 0;
        width: 37px;
    }

    #progressbar-2 li:nth-child(4):after {
        left: 0;
        width: 0;
        @if($order->status=='delivered')
            background: #c5cae9 !important;
        @endif
    }

    #progressbar-2 li.active:before,
    #progressbar-2 li.active:after {
        background: #6520ff;
    }
</style>
@endpush
