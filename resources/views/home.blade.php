<!DOCTYPE html>
<html>
<head>
    <meta charset=utf-8 />
    <title>Token Rank</title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>

<div class="container">
    <h1>Available Tokens and Swaps</h1>

    <div id="SwapsFilterView">
        {{-- REACT: filter --}}
        <form>
            <div class="row">
                <div class="col-md-12">
                    <h4>Search By Tokens</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-lg-3">
                    <div class="form-group">
                        <label for="tokenOutFilter">Token to Purchase</label>
                        <input type="text" class="form-control" id="tokenOutFilter" placeholder="LTBCOIN" value="">
                    </div>
                </div>
                <div class="col-sm-4 col-lg-3">
                    <div class="form-group">
                        <label for="tokenInFilter">Token to Spend</label>
                        <input type="text" class="form-control" id="tokenInFilter" placeholder="BTC" value="">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4>Search By Bot</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-lg-3">
                    <div class="form-group">
                        <label for="botNameFilter">Bot Name</label>
                        <input type="text" class="form-control" id="botNameFilter" placeholder="Tokenly" value="">
                    </div>
                </div>
                <div class="col-sm-4 col-lg-3">
                    <div class="form-group">
                        <label for="usernameFilter">Seller</label>
                        <input type="text" class="form-control" id="usernameFilter" placeholder="adam" value="">
                    </div>
                </div>
            </div>
        </form>
    </div>


    <div class="spacer2"></div>


    <div id="SwapsListView">
        {{-- REACT: list of tokens --}}
        <?php
        /*
            <ul class="list-unstyled">
            @for ($i = 0; $i < count($availableSwaps); $i+=2)
                <li class="swap-row">
                <div class="row">
                @for ($j = 0; $j < 2; $j++)
                    <?php $swap = isset($availableSwaps[$i + $j]) ? $availableSwaps[$i + $j] : null; ?>
                    <div class="col-md-6">
                        <div class="available-swap clearfix">
                            <div class="logo"><img src="{{ $swap['bot']['logoImage'] ? $swap['bot']['logoImage'] : '/images/blank-robot-fade.png' }}"></div>
                            <div class="details">
                                <div class="name"><a href="{{$swap['bot']['botUrl']}}">{{$swap['bot']['name']}}</a></div>

                                <div class="username">From {{$swap['bot']['username']}}</div>

                                <div class="swap-tokens">
                                @if (true)
                                    Selling 1 <span class="token token-out">{{$swap['swap']['out']}}</span> for 
                                     <span class="cost">{{$currency($swap['swap']['cost'])}}</span> <span class="token token-in">{{$swap['swap']['in']}}</span>
                                @else
                                    Selling <span class="rate">{{$currency($swap['swap']['rate'])}}</span> <span class="token token-out">{{$swap['swap']['out']}}</span> for 
                                     1 <span class="token token-in">{{$swap['swap']['in']}}</span>
                                @endif
                                </div>
                            </div>
                        </div>
                    </div>
                @endfor
                </div>
                </li>
            @endfor
            </ul>
        */
         ?>
    </div>

</div>
 

{{-- external dependencies --}}
{{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.min.js"></script> --}}
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>

{{-- app --}}
<script>
    var availableSwapsBootstrap = {!! json_encode($availableSwaps, 192) !!};
</script>
<script src="js/app.js"></script>
</body>
</html>
