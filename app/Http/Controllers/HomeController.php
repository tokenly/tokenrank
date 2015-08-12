<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Tokenly\SwapbotClient\SwapbotClient;


class HomeController extends Controller
{

    public function home(SwapbotClient $swapbot_client) {
        $available_swaps = Cache::remember('swapbot.swaps', $minutes=10, function() use ($swapbot_client) {
            return $swapbot_client->getAvailableSwaps();
        });

        return view('home', ['availableSwaps' => $available_swaps]);
    }
}
