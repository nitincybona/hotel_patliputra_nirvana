<div class="contact-form">
    {!! Form::open(['route' => 'public.send.contact', 'class' => 'form--contact', 'method' => 'POST']) !!}

    <div class="row">
        {!! apply_filters('pre_contact_form', null) !!}

        <div class="col-md-6">
            <div class="input-group mb-30">
                <span class="icon"><i class="far fa-user"></i></span>
                <input
                    id="contact_name"
                    name="name"
                    type="text"
                    value="{{ old('name') }}"
                    placeholder="{{ __('Name') }}"
                >
            </div>
        </div>
        <div class="col-md-6">
            <div class="input-group mb-30">
                <span class="icon"><i class="far fa-envelope"></i></span>
                <input
                    id="contact_email"
                    name="email"
                    type="email"
                    value="{{ old('email') }}"
                    placeholder="{{ __('Email') }}"
                >
            </div>
        </div>
        <div class="col-md-6">
            <div class="input-group mb-30">
                <span class="icon"><i class="fal fa-map-marker-alt"></i></span>
                <input
                    id="contact_address"
                    name="address"
                    type="text"
                    value="{{ old('address') }}"
                    placeholder="{{ __('Address') }}"
                >
            </div>
        </div>
        <div class="col-md-6">
            <div class="input-group mb-30">
                <span class="icon"><i class="far fa-phone"></i></span>
                <input
                    id="contact_phone"
                    name="phone"
                    type="text"
                    value="{{ old('phone') }}"
                    placeholder="{{ __('Phone') }}"
                >
            </div>
        </div>
        <div class="col-md-12">
            <div class="input-group mb-30">
                <span class="icon"><i class="far fa-book"></i></span>
                <input
                    id="contact_subject"
                    name="subject"
                    type="text"
                    value="{{ old('subject') }}"
                    placeholder="{{ __('Subject') }}"
                >
            </div>
        </div>
        <div class="col-md-12">
            <div class="input-group textarea mb-30">
                <span class="icon"><i class="far fa-pen"></i></span>
                <textarea
                    id="contact_content"
                    name="content"
                    rows="5"
                    placeholder="{{ __('Message') }}"
                >{{ old('content') }}</textarea>
            </div>
        </div>

        @if (is_plugin_active('captcha'))
            @if (setting('enable_captcha'))
                <div class="col-md-12">
                    <div class="input-group mb-30">
                        {!! Captcha::display() !!}
                    </div>
                </div>
            @endif

            @if (setting('enable_math_captcha_for_contact_form', 0))
                <div class="col-md-12">
                    <label for="math-captcha" class="control-label">{{ app('math-captcha')->label() }}</label>
                    <div class="input-group mb-30">
                        <span class="icon"><i class="far fa-calculator"></i></span>
                        {!! app('math-captcha')->input(['id' => 'math-group', 'placeholder' => app('math-captcha')->getMathLabelOnly()]) !!}
                    </div>
                </div>
            @endif
        @endif

        {!! apply_filters('after_contact_form', null) !!}

        <div class="col-12">
            <div class="input-group mb-30">
                <button
                    class="main-btn btn-filled"
                    type="submit"
                >{{ __('Get Free Quote') }}</button>
            </div>
        </div>

        <div class="col-12">
            <div class="input-group">
                <div
                    class="contact-message contact-success-message"
                    style="display: none"
                ></div>
                <div
                    class="contact-message contact-error-message"
                    style="display: none"
                ></div>
            </div>
        </div>

    </div>

    {!! Form::close() !!}
</div>
