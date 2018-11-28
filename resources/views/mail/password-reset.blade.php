@component('mail::message')
# Introduction

<h1 style="text-align: center; width: 100%;">
    Дякую за пароль для відновлення {{ $user->email }}
</h1>
<h2>Ваш новий пароль: {{ $new_password }}</h2>

@component('mail::button', ['url' => ''])
Button Text
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
