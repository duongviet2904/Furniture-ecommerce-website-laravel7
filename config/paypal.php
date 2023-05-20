<?php
/**
 * PayPal Setting & API Credentials
 * Created by Raza Mehdi <srmk@outlook.com>.
 */

return [
    'mode'    => env('PAYPAL_MODE', 'sandbox'), // Can only be 'sandbox' Or 'live'. If empty or invalid, 'live' will be used.
    'sandbox' => [
        'username'    => env('sb-2syez18857151_api1.business.example.com', ''),
        'password'    => env('RUTCU7335Z9UMLAD', ''),
        'secret'      => env('EAzl5-B5GyMhV5bPa2AEzV7SaMk-VOiaqXIoUnxIIjS2LGyEm6aE0Kt-bjroffwsrN29Ypih3jI2Uy5B', ''),
        'certificate' => env('AasdeupAIJZXTBAyQFlFsS8ZbH5fAd9cc5-BSqo54EU9lZHgMoR5H8qM', ''),
        'app_id'      => 'AUSW4eyxOQzlWOHuQf3xcyhIV2BMLpAtCxOItzUmQLahsOrB3XTw7coVh2wwedHd676NQaZmrAQSzoel', // Used for testing Adaptive Payments API in sandbox mode
    ],
    'live' => [
        'username'    => env('PAYPAL_LIVE_API_USERNAME', ''),
        'password'    => env('PAYPAL_LIVE_API_PASSWORD', ''),
        'secret'      => env('PAYPAL_LIVE_API_SECRET', ''),
        'certificate' => env('PAYPAL_LIVE_API_CERTIFICATE', ''),
        'app_id'      => '', // Used for Adaptive Payments API
    ],

    'payment_action' => 'Sale', // Can only be 'Sale', 'Authorization' or 'Order'
    'currency'       => env('PAYPAL_CURRENCY', 'USD'),
    'billing_type'   => 'MerchantInitiatedBilling',
    'notify_url'     => '', // Change this accordingly for your application.
    'locale'         => '', // force gateway language  i.e. it_IT, es_ES, en_US ... (for express checkout only)
    'validate_ssl'   => true, // Validate SSL when creating api client.
];

//return [
//    'client_id' => 'AUSW4eyxOQzlWOHuQf3xcyhIV2BMLpAtCxOItzUmQLahsOrB3XTw7coVh2wwedHd676NQaZmrAQSzoel',
//    'secret' => 'EAzl5-B5GyMhV5bPa2AEzV7SaMk-VOiaqXIoUnxIIjS2LGyEm6aE0Kt-bjroffwsrN29Ypih3jI2Uy5B',
//    'settings' => array(
//        'mode' => 'sandbox',
//        'http.ConnectionTimeOut' => 1000,
//        'log.LogEnabled' => true,
//        'log.FileName' => storage_path() . '/logs/paypal.log',
//        'log.LogLevel' => 'FINE'
//    ),
//];
