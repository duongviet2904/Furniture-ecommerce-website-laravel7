@extends('backend.layouts.master')
@section('title','E-SHOP || DASHBOARD')
@section('main-content')
<div class="container-fluid">
    @include('backend.layouts.notification')
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <!-- Content Row -->
    <div class="row">
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Revenue</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">$ {{\App\Models\Order::countRevenue()}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">NET Income</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">$ {{\App\Models\Order::countNetIncome()}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      <!-- Category -->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Category</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Category::countActiveCategory()}}</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-sitemap fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Products -->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Products</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Product::countActiveProduct()}}</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-cubes fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Order -->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Order</div>
                <div class="row no-gutters align-items-center">
                  <div class="col-auto">
                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">{{\App\Models\Order::countActiveOrder()}}</div>
                  </div>

                </div>
              </div>
              <div class="col-auto">
                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Completed Order</div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">{{\App\Models\Order::countCompletedOrder()}}</div>
                                </div>

                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Canceled Order</div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">{{\App\Models\Order::countCanceledOrder()}}</div>
                                </div>

                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      <!--Posts-->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Post</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Post::countActivePost()}}</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-folder fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">

      <!-- Area Chart -->
      <div class="col-xl-6 col-lg-6">
        <div class="card shadow mb-4">
          <!-- Card Header - Dropdown -->
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">Revenue</h6>
          </div>
          <!-- Card Body -->
          <div class="card-body">
            <div class="chart-area">
              <canvas id="myAreaChart"></canvas>
            </div>
          </div>
        </div>
      </div>

      <!-- Pie Chart -->
      <div class="col-xl-6 col-lg-6">
        <div class="card shadow mb-4">
          <!-- Card Header - Dropdown -->
{{--          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">--}}
{{--            <h6 class="m-0 font-weight-bold text-primary">Users</h6>--}}
{{--          </div>--}}
          <!-- Card Body -->
          <div class="card-body statistic-card" style="overflow:hidden">
{{--            <div id="pie_chart" style="width:350px; height:320px;">--}}
              <div class="tab">
                  <button class="tablinks active" onclick="openCity(event, 'London')">Day</button>
                  <button class="tablinks" onclick="openCity(event, 'Paris')">Week</button>
                  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Month</button>
              </div>

              <div id="London" class="tabcontent statistic-tabcontent" style="display: block">
                  <div class="row">
                      <div class="col-lg-4">
                          <h4>ET Revenue: </h4>
                          $ {{$statistic['statisticDay']['revenue']}}
                      </div>
                      <div class="col-lg-4">
                          <h4>ET NET Income: </h4>
                          $ {{$statistic['statisticDay']['income']}}
                      </div>
                      <div class="col-lg-4">
                          <h4>New Orders: </h4>
                          {{$statistic['statisticDay']['countOrderDay']}}
                      </div>
                      <div class="col-lg-12">
                          <h4>Best Sellers: </h4>
                          <table class="table">
                              <thead class="thead-dark">
                              <tr>
                                  <th scope="col">#</th>
                                  <th scope="col">Product Name</th>
                                  <th scope="col">Import Price</th>
                                  <th scope="col">Sell Price</th>
                                  <th scope="col">Sold Quantity</th>
                                  <th scope="col">Stock Remaining</th>
                              </tr>
                              </thead>
                              <tbody>
                              @if(count($statistic['statisticDay']['productHotDay']))
                                  @php $index = 0; @endphp
                                  @foreach($statistic['statisticDay']['productHotDay'] as $product)
                                      @php $index++; @endphp
                                      <tr>
                                          <th scope="row">{{$index}}</th>
                                          <td>{{$product->title}}</td>
                                          <td>$ {{$product->import_price}}</td>
                                          <td>$ {{$product->price}}</td>
                                          <td class="text-center">{{$product->sumQty}}</td>
                                          <td class="text-center">{{$product->stock}}</td>
                                      </tr>
                                  @endforeach
                              @else
                                  <p class="text-warning">There is no product sold</p>
                              @endif
                              </tbody>
                          </table>
                      </div>
                  </div>

              </div>

              <div id="Tokyo" class="tabcontent statistic-tabcontent">
                  <div class="row">
                      <div class="col-lg-4">
                          <h4>ET Revenue: </h4>
                          $ {{$statistic['statisticMonth']['revenue']}}
                      </div>
                      <div class="col-lg-4">
                          <h4>ET NET Income: </h4>
                          $ {{$statistic['statisticMonth']['income']}}
                      </div>
                      <div class="col-lg-4">
                          <h4>New Orders: </h4>
                          {{$statistic['statisticMonth']['countOrderMonth']}}
                      </div>
                      <div class="col-lg-12">
                          <h4>Best Sellers: </h4>
                          <table class="table">
                              <thead class="thead-dark">
                              <tr>
                                  <th scope="col">#</th>
                                  <th scope="col">Product Name</th>
                                  <th scope="col">Import Price</th>
                                  <th scope="col">Sell Price</th>
                                  <th scope="col">Sold Quantity</th>
                                  <th scope="col">Stock Remaining</th>
                              </tr>
                              </thead>
                              <tbody>
                              @if(count($statistic['statisticMonth']['productHotMonth']))
                                  @php $index = 0; @endphp
                                  @foreach($statistic['statisticMonth']['productHotMonth'] as $product)
                                      @php $index++; @endphp
                                      <tr>
                                          <th scope="row">{{$index}}</th>
                                          <td>{{$product->title}}</td>
                                          <td>$ {{$product->import_price}}</td>
                                          <td>$ {{$product->price}}</td>
                                          <td class="text-center">{{$product->sumQty}}</td>
                                          <td class="text-center">{{$product->stock}}</td>
                                      </tr>
                                  @endforeach
                              @else
                                  <p class="text-warning">There is no product sold</p>
                              @endif
                              </tbody>
                          </table>
                      </div>
                  </div>
              </div>

              <div id="Paris" class="tabcontent statistic-tabcontent">
                  <div class="row">
                      <div class="col-lg-4">
                          <h4>ET Revenue: </h4>
                          $ {{$statistic['statisticWeek']['revenue']}}
                      </div>
                      <div class="col-lg-4">
                          <h4>ET NET Income: </h4>
                          $ {{$statistic['statisticWeek']['income']}}
                      </div>
                      <div class="col-lg-4">
                          <h4>New Orders: </h4>
                          {{$statistic['statisticWeek']['countOrderWeek']}}
                      </div>
                      <div class="col-lg-12">
                          <h4>Best Sellers: </h4>
                          <table class="table">
                              <thead class="thead-dark">
                              <tr>
                                  <th scope="col">#</th>
                                  <th scope="col">Product Name</th>
                                  <th scope="col">Import Price</th>
                                  <th scope="col">Sell Price</th>
                                  <th scope="col">Sold Quantity</th>
                                  <th scope="col">Stock Remaining</th>
                              </tr>
                              </thead>
                              <tbody>
                              @if(count($statistic['statisticWeek']['productHotWeek']))
                                  @php $index = 0; @endphp
                                  @foreach($statistic['statisticWeek']['productHotWeek'] as $product)
                                      @php $index++; @endphp
                                      <tr>
                                          <th scope="row">{{$index}}</th>
                                          <td>{{$product->title}}</td>
                                          <td>$ {{$product->import_price}}</td>
                                          <td>$ {{$product->price}}</td>
                                          <td class="text-center">{{$product->sumQty}}</td>
                                          <td class="text-center">{{$product->stock}}</td>
                                      </tr>
                                  @endforeach
                              @else
                                  <p class="text-warning">There is no product sold</p>
                              @endif
                              </tbody>
                          </table>
                      </div>
                  </div>
              </div>

              <script>
                  function openCity(evt, cityName) {
                      var i, tabcontent, tablinks;
                      tabcontent = document.getElementsByClassName("tabcontent");
                      for (i = 0; i < tabcontent.length; i++) {
                          tabcontent[i].style.display = "none";
                      }
                      tablinks = document.getElementsByClassName("tablinks");
                      for (i = 0; i < tablinks.length; i++) {
                          tablinks[i].className = tablinks[i].className.replace(" active", "");
                      }
                      document.getElementById(cityName).style.display = "block";
                      evt.currentTarget.className += " active";
                  }
              </script>
          </div>
        </div>
      </div>
    </div>
    <!-- Content Row -->
  </div>
@endsection

<style>
    body {font-family: Arial;}

    /* Style the tab */
    .tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

    /* Style the buttons inside the tab */
    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        transition: 0.3s;
        font-size: 17px;
    }

    /* Change background color of buttons on hover */
    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current tablink class */
    .tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        display: none;
        padding: 6px 12px;
        border: 1px solid #ccc;
        border-top: none;
    }
    .statistic-card .tab{
        background-color: unset;
        border: none;
        border-bottom: 1px solid #ccc;
    }
    .statistic-card .tabcontent{
        border: none;
    }

    .statistic-tabcontent div > div {
        margin: 15px 0px;
    }
</style>

@push('scripts')
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
{{-- pie chart --}}
<script type="text/javascript">
  var analytics = <?php echo ''; ?>

  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart()
  {
      var data = google.visualization.arrayToDataTable(analytics);
      var options = {
          title : 'Last 7 Days registered user'
      };
      var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));
      chart.draw(data, options);
  }
</script>
  {{-- line chart --}}
  <script type="text/javascript">
    const url = "{{route('product.order.income')}}";
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#858796';

    function number_format(number, decimals, dec_point, thousands_sep) {
      // *     example: number_format(1234.56, 2, ',', ' ');
      // *     return: '1 234,56'
      number = (number + '').replace(',', '').replace(' ', '');
      var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function(n, prec) {
          var k = Math.pow(10, prec);
          return '' + Math.round(n * k) / k;
        };
      // Fix for IE parseFloat(0.55).toFixed(0) = 0;
      s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
      if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }
      if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
      }
      return s.join(dec);
    }

      // Area Chart Example
      var ctx = document.getElementById("myAreaChart");

        axios.get(url)
              .then(function (response) {
                const data_keys = Object.keys(response.data);
                const data_values = Object.values(response.data);
                var myLineChart = new Chart(ctx, {
                  type: 'line',
                  data: {
                    labels: data_keys, // ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                      label: "Revenue",
                      lineTension: 0.3,
                      backgroundColor: "rgba(78, 115, 223, 0.05)",
                      borderColor: "rgba(78, 115, 223, 1)",
                      pointRadius: 3,
                      pointBackgroundColor: "rgba(78, 115, 223, 1)",
                      pointBorderColor: "rgba(78, 115, 223, 1)",
                      pointHoverRadius: 3,
                      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                      pointHitRadius: 10,
                      pointBorderWidth: 2,
                      data:data_values,// [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
                    }],
                  },
                  options: {
                    maintainAspectRatio: false,
                    layout: {
                      padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                      }
                    },
                    scales: {
                      xAxes: [{
                        time: {
                          unit: 'date'
                        },
                        gridLines: {
                          display: false,
                          drawBorder: false
                        },
                        ticks: {
                          maxTicksLimit: 7
                        }
                      }],
                      yAxes: [{
                        ticks: {
                          maxTicksLimit: 5,
                          padding: 10,
                          // Include a dollar sign in the ticks
                          callback: function(value, index, values) {
                            return '$' + number_format(value);
                          }
                        },
                        gridLines: {
                          color: "rgb(234, 236, 244)",
                          zeroLineColor: "rgb(234, 236, 244)",
                          drawBorder: false,
                          borderDash: [2],
                          zeroLineBorderDash: [2]
                        }
                      }],
                    },
                    legend: {
                      display: false
                    },
                    tooltips: {
                      backgroundColor: "rgb(255,255,255)",
                      bodyFontColor: "#858796",
                      titleMarginBottom: 10,
                      titleFontColor: '#6e707e',
                      titleFontSize: 14,
                      borderColor: '#dddfeb',
                      borderWidth: 1,
                      xPadding: 15,
                      yPadding: 15,
                      displayColors: false,
                      intersect: false,
                      mode: 'index',
                      caretPadding: 10,
                      callbacks: {
                        label: function(tooltipItem, chart) {
                          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                        }
                      }
                    }
                  }
                });
              })
              .catch(function (error) {
              //   vm.answer = 'Error! Could not reach the API. ' + error
              console.log(error)
              });

  </script>
@endpush
