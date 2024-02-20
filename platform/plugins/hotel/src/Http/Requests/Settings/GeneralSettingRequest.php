<?php

namespace Botble\Hotel\Http\Requests\Settings;

use Botble\Base\Rules\OnOffRule;
use Botble\Support\Http\Requests\Request;

class GeneralSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'hotel_enable_booking' => [new OnOffRule()],
        ];
    }
}
