<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\Settings;
use App\User;
use App\Rules\MatchOldPassword;
use Hash;
use Carbon\Carbon;
use Spatie\Activitylog\Models\Activity;

class AdminController extends Controller
{
    public function index()
    {
        $data = User::select(\DB::raw("COUNT(*) as count"), \DB::raw("DAYNAME(created_at) as day_name"),
            \DB::raw("DAY(created_at) as day"))
            ->where('created_at', '>', Carbon::today()->subDay(6))
            ->groupBy('day_name', 'day')
            ->orderBy('day')
            ->get();
        $array[] = ['Name', 'Number'];
        foreach ($data as $key => $value) {
            $array[++$key] = [$value->day_name, $value->count];
        }

        $day = \Carbon\Carbon::now()->day;
        $month = \Carbon\Carbon::now()->month;
        $revenueDay = Order::with(['cart_info'])
            ->select(\DB::raw("SUM(total_amount) as revenueDay"))
            ->whereDay('created_at', $day)
            ->where('status', '!=', 'cancel')
            ->first();
        $incomeDay = Order::with(['cart_info'])
            ->join('shippings', 'shippings.id', '=', 'orders.shipping_id')
            ->select(\DB::raw("SUM(total_amount - import_amount) - sum(shippings.price) as income"))
            ->whereDay('orders.created_at', $day)
            ->where('orders.status', '!=', 'cancel')
            ->first();
        $countOrderDay = Order::with(['cart_info'])
            ->select(\DB::raw("COUNT(*) as countOrderDay"), \DB::raw("SUM(quantity) as countProduct"))
            ->where('status', '!=', 'cancel')
            ->whereDay('created_at', $day)
            ->first();
        $productIdHotDay = Cart::select(\DB::raw("carts.product_id, products.title, products.stock, products.price * (1 - products.discount / 100) as price, products.import_price, SUM(carts.quantity) as sumQty"))
            ->join('products', 'carts.product_id', '=', 'products.id')
            ->join('orders', 'carts.order_id', '=', 'orders.id')
            ->whereDay('orders.created_at', $day)
            ->where('orders.status', '!=', 'cancel')
            ->groupBy('carts.product_id')
            ->orderBy('sumQty', 'desc')
            ->skip(0)->take(4)
            ->get();
//        $productHotDay = Product::find($productIdHotDay->product_id);

        $revenueMonth = Order::with(['cart_info'])
            ->select(\DB::raw("SUM(total_amount) as revenueMonth"))
            ->whereMonth('created_at', $month)
            ->where('status', '!=', 'cancel')
            ->first();
        $incomeMonth = Order::with(['cart_info'])
            ->join('shippings', 'shippings.id', '=', 'orders.shipping_id')
            ->select(\DB::raw("SUM(total_amount - import_amount) - sum(shippings.price) as income"))
            ->whereMonth('orders.created_at', $month)
            ->where('orders.status', '!=', 'cancel')
            ->first();
        $countOrderMonth = Order::with(['cart_info'])
            ->select(\DB::raw("COUNT(*) as countOrderMonth"), \DB::raw("SUM(quantity) as countProduct"))
            ->where('status', '!=', 'cancel')
            ->whereMonth('created_at', $month)
            ->first();
        $productIdHotMonth = Cart::select(\DB::raw("carts.product_id, products.title, products.stock, products.price * (1 - products.discount / 100) as price, products.import_price, SUM(carts.quantity) as sumQty"))
            ->join('products', 'carts.product_id', '=', 'products.id')
            ->join('orders', 'carts.order_id', '=', 'orders.id')
            ->whereMonth('orders.created_at', $month)
            ->where('orders.status', '!=', 'cancel')
            ->groupBy('carts.product_id')
            ->orderBy('sumQty', 'desc')
            ->skip(0)->take(4)
            ->get();
//        $productHotMonth = Product::find($productIdHotMonth->product_id);

        $revenueWeek = Order::with(['cart_info'])
            ->select(\DB::raw("SUM(total_amount) as revenueWeek"))
            ->whereBetween('created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
            ->where('status', '!=', 'cancel')
            ->first();
        $incomeWeek = Order::with(['cart_info'])
            ->join('shippings', 'shippings.id', '=', 'orders.shipping_id')
            ->select(\DB::raw("SUM(total_amount - import_amount) - sum(shippings.price) as income"))
            ->whereBetween('orders.created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
            ->where('orders.status', '!=', 'cancel')
            ->first();
        $countOrderWeek = Order::with(['cart_info'])
            ->select(\DB::raw("COUNT(*) as countOrderWeek"), \DB::raw("SUM(quantity) as countProduct"))
            ->whereBetween('created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
            ->where('status', '!=', 'cancel')
            ->first();
        $productIdHotWeek = Cart::select(\DB::raw("carts.product_id, products.title, products.stock, products.price * (1 - products.discount / 100)  as price, products.import_price, SUM(carts.quantity) as sumQty"))
            ->join('products', 'carts.product_id', '=', 'products.id')
            ->join('orders', 'carts.order_id', '=', 'orders.id')
            ->whereBetween('orders.created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
            ->where('orders.status', '!=', 'cancel')
            ->groupBy('carts.product_id')
            ->orderBy('sumQty', 'desc')
            ->skip(0)->take(4)
            ->get();
//        $productHotWeek = Product::find($productIdHotWeek->product_id);

        return view('backend.index')->with('statistic', [
            'statisticDay' => [
                'revenue' => $revenueDay->revenueDay,
                'income' => $incomeDay->income,
                'countOrderDay' => $countOrderDay->countOrderDay,
                'productHotDay' => $productIdHotDay
            ],
            'statisticWeek' => [
                'revenue' => $revenueWeek->revenueWeek,
                'income' => $incomeWeek->income,
                'countOrderWeek' => $countOrderWeek->countOrderWeek,
                'productHotWeek' => $productIdHotWeek
            ],
            'statisticMonth' => [
                'revenue' => $revenueMonth->revenueMonth,
                'income' => $incomeMonth->income,
                'countOrderMonth' => $countOrderMonth->countOrderMonth,
                'productHotMonth' => $productIdHotMonth
            ]
        ]);
    }

    public function profile()
    {
        $profile = Auth()->user();
        // return $profile;
        return view('backend.users.profile')->with('profile', $profile);
    }

    public function profileUpdate(Request $request, $id)
    {
        // return $request->all();
        $user = User::findOrFail($id);
        $data = $request->all();
        $status = $user->fill($data)->save();
        if ($status) {
            request()->session()->flash('success', 'Successfully updated your profile');
        } else {
            request()->session()->flash('error', 'Please try again!');
        }
        return redirect()->back();
    }

    public function settings()
    {
        $data = Settings::first();
        return view('backend.setting')->with('data', $data);
    }

    public function settingsUpdate(Request $request)
    {
        // return $request->all();
        $this->validate($request, [
            'short_des' => 'required|string',
            'description' => 'required|string',
            'photo' => 'required',
            'logo' => 'required',
            'address' => 'required|string',
            'email' => 'required|email',
            'phone' => 'required|string',
        ]);
        $data = $request->all();
        // return $data;
        $settings = Settings::first();
        // return $settings;
        $status = $settings->fill($data)->save();
        if ($status) {
            request()->session()->flash('success', 'Setting successfully updated');
        } else {
            request()->session()->flash('error', 'Please try again');
        }
        return redirect()->route('admin');
    }

    public function changePassword()
    {
        return view('backend.layouts.changePassword');
    }

    public function changPasswordStore(Request $request)
    {
        $request->validate([
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ]);

        User::find(auth()->user()->id)->update(['password' => Hash::make($request->new_password)]);

        return redirect()->route('admin')->with('success', 'Password successfully changed');
    }

    // Pie chart
    public function userPieChart(Request $request)
    {
        // dd($request->all());
        $data = User::select(\DB::raw("COUNT(*) as count"), \DB::raw("DAYNAME(created_at) as day_name"),
            \DB::raw("DAY(created_at) as day"))
            ->where('created_at', '>', Carbon::today()->subDay(6))
            ->groupBy('day_name', 'day')
            ->orderBy('day')
            ->get();
        $array[] = ['Name', 'Number'];
        foreach ($data as $key => $value) {
            $array[++$key] = [$value->day_name, $value->count];
        }
        //  return $data;
        return view('backend.index')->with('course', json_encode($array));
    }

    // public function activity(){
    //     return Activity::all();
    //     $activity= Activity::all();
    //     return view('backend.layouts.activity')->with('activities',$activity);
    // }
}
