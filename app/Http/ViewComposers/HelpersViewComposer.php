<?php

namespace App\Http\ViewComposers;

use App\Http\ViewComposers\FormattingHelper;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;

class HelpersViewComposer
{

    function __construct(FormattingHelper $formatting_helper) {
        $this->formatting_helper = $formatting_helper;
    }

    /**
     * Bind data to the view.
     *
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {
        // add config to all views
        // Settings
        $view->with([
            'fmt'      => $this->formatting_helper,
            'currency' => function($value, $places=null) { return $this->formatting_helper->formatCurrency($value, $places); },
        ]);
    }

}
