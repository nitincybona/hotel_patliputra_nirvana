<?php

namespace Botble\Hotel\Facades;

use Botble\Hotel\Supports\HotelSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static bool isEnableEmailVerification()
 * @method static string|null getSettingPrefix()
 * @method static bool isReviewEnabled()
 * @method static bool isBookingEnabled()
 * @method static array getReviewExtraData()
 * @method static array|string|int|null getSetting(string $key, string|int|bool|null $default = '')
 * @method static bool loadCountriesStatesCitiesFromPluginLocation()
 * @method static string viewPath(string $view)
 * @method static array getRoomFilters(\Illuminate\Http\Request|array $request)
 * @method static array getRoomBookingParams()
 * @method static mixed|null getCheckoutData(string|null $key = null)
 * @method static void saveCheckoutData(array $data)
 *
 * @see \Botble\Hotel\Supports\HotelSupport
 */
class HotelHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return HotelSupport::class;
    }
}
