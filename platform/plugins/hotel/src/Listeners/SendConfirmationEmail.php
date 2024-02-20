<?php

namespace Botble\Hotel\Listeners;

use Botble\Base\Facades\EmailHandler;
use Botble\Hotel\Events\BookingCreated;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendConfirmationEmail implements ShouldQueue
{
    public function handle(BookingCreated $event): void
    {
        $booking = $event->booking;

        EmailHandler::setModule(HOTEL_MODULE_SCREEN_NAME)
            ->setVariableValues([
                'booking_name' => $booking->address->first_name ? $booking->address->first_name . ' ' . $booking->address->last_name : 'N/A',
                'booking_email' => $booking->address->email ?? 'N/A',
                'booking_phone' => $booking->address->phone ?? 'N/A',
                'booking_address' => $booking->address->id ? $booking->address->address . ', ' . $booking->address->city . ', ' . $booking->address->state . ', ' . $booking->address->country . ', ' . $booking->address->zip : 'N/A',
                'booking_link' => route('public.booking.information', $booking->transaction_id),
            ]);

        EmailHandler::sendUsingTemplate('booking-confirmation', $booking->address->email);
        EmailHandler::sendUsingTemplate('booking-notice-to-admin');
    }
}
