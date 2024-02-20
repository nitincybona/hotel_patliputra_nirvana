<?php

namespace Botble\Hotel\Http\Requests;

use Botble\Support\Http\Requests\Request;

class InitBookingRequest extends Request
{
    public function rules(): array
    {
        return [
            'room_id' => ['required', 'exists:ht_rooms,id'],
            'start_date' => ['required', 'string', 'date_format:d-m-Y', 'after_or_equal:today'],
            'end_date' => ['required', 'string', 'date_format:d-m-Y', 'after_or_equal:start_date'],
            'adults' => ['required', 'integer', 'min:1'],
        ];
    }
}
