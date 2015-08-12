<?php

namespace App\Http\ViewComposers;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\ServiceProvider;

class ViewComposerServiceProvider extends ServiceProvider
{

    public function register()
    {
        view()->composer(
            '*', 'App\Http\ViewComposers\HelpersViewComposer'
        );
    }

}
