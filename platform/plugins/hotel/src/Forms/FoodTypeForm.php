<?php

namespace Botble\Hotel\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\Hotel\Http\Requests\FoodTypeRequest;
use Botble\Hotel\Models\FoodType;

class FoodTypeForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setupModel(new FoodType())
            ->setValidatorClass(FoodTypeRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label' => trans('core/base::forms.name'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('icon', 'themeIcon', [
                'label' => trans('plugins/hotel::food-type.form.icon'),
                'attr' => [
                    'class' => 'form-control select-full',
                ],
                'default_value' => 'fa fa-check',
            ])
            ->add('status', 'customSelect', [
                'label' => trans('core/base::tables.status'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control select-full',
                ],
                'choices' => BaseStatusEnum::labels(),
            ])
            ->setBreakFieldPoint('status');
    }
}
