<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable=['user_id','order_number','sub_total','quantity','delivery_charge','status','total_amount','first_name','last_name','country','post_code','address1','address2','phone','email','payment_method','payment_status','shipping_id','coupon', 'import_amount'];

    public function cart_info(){
        return $this->hasMany('App\Models\Cart','order_id','id');
    }
    public static function getAllOrder($id){
        return Order::with('cart_info')->find($id);
    }
    public static function countActiveOrder(){
        $data=Order::count();
        if($data){
            return $data;
        }
        return 0;
    }
    public static function countCompletedOrder(){
        $data=Order::where('status', 'delivered')->count();
        if($data){
            return $data;
        }
        return 0;
    }
    public static function countCanceledOrder(){
        $data=Order::where('status', 'cancel')->count();
        if($data){
            return $data;
        }
        return 0;
    }

    public static function countRevenue() {
        $data=Order::select(\DB::raw("sum(total_amount) as revenue"))->where('status', 'delivered')->first();
        if($data){
            return $data->revenue;
        }
        return 0;
    }

    public static function countNetIncome() {
        $data=Order::select(\DB::raw("(sum(total_amount) - sum(import_amount) - sum(shippings.price)) as income"))
            ->join('shippings', 'shippings.id', '=', 'orders.shipping_id')
            ->where('orders.status','delivered')->first();
        if($data){
            return $data->income;
        }
        return 0;
    }

    public function cart(){
        return $this->hasMany(Cart::class);
    }

    public function shipping(){
        return $this->belongsTo(Shipping::class,'shipping_id');
    }
    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }

}
