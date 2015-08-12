<?php

namespace App\Http\ViewComposers;

use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Tokenly\CurrencyLib\CurrencyUtil;

class FormattingHelper {

    public function __construct() {
    }



    public function formatDate($date) {
        if (!($date instanceof Carbon)) { $date = Carbon::parse($date); }

        if (($date instanceof Carbon) AND $date->getTimestamp() > 0) {
            return $date->format('D, M j, Y g:i A T');
        }
        return $date;
    }


    public function fiatSuffix($swap_config_strategy, $in_qty, $asset, $conversion_rate=null) {
        if ($asset != 'BTC') { return ''; }
        if ($swap_config_strategy == 'fiat') {
            if ($conversion_rate === null) {
                $quote_entry = $this->quotebot_client->getQuote('bitcoinAverage', ['USD', 'BTC']);
                $conversion_rate = $quote_entry['last'];
            }

            $quantity = $in_qty * $conversion_rate;
            return ' ($'.money_format('%i', $quantity).')';
        }
        return '';
    }

    // 123 satoshis (0.00000123)
    public function formatCurrency($value, $places=null) {
        if (($places === null OR $places == 8) AND $value < 0.0001) {
            $text = 
                CurrencyUtil::valueToSatoshis($value).' satoshis'.
                ' ('.CurrencyUtil::valueToFormattedString($value, $places).')';
            return $text;
        }

        return CurrencyUtil::valueToFormattedString($value, $places);
    }

}
