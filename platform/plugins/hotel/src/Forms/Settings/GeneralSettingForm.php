<?php

namespace Botble\Hotel\Forms\Settings;

use Botble\Hotel\Facades\HotelHelper;
use Botble\Hotel\Http\Requests\Settings\GeneralSettingRequest;
use Botble\Setting\Forms\SettingForm;

class GeneralSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/hotel::settings.general.title'))
            ->setSectionDescription(trans('plugins/hotel::settings.general.description'))
            ->setValidatorClass(GeneralSettingRequest::class)
            ->add('hotel_enable_booking', 'onOffCheckbox', [
                'label' => trans('plugins/hotel::settings.general.enable_booking'),
                'value' => HotelHelper::isBookingEnabled(),
            ]);
    }
}
