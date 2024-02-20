<?php

namespace Botble\Hotel\Http\Requests\Fronts;

use Botble\Support\Http\Requests\Request;

class RoomListRequest extends Request
{
    public function rules(): array
    {
        return [
            'start_date' => ['nullable', 'string', 'date_format:d-m-Y', 'after_or_equal:today'],
            'end_date' => ['nullable', 'string', 'date_format:d-m-Y', 'after_or_equal:start_date'],
            'adults' => ['nullable', 'integer', 'min:1'],
        ];
    }
}
