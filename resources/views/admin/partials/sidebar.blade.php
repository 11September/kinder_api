<ul class="sidebar navbar-nav">
    <li class="nav-item {{ request()->is('admin') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin') }}">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Головна панель</span>
        </a>
    </li>

    <li class="nav-item {{ request()->is('admin/admins*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/admins') }}">
            <i class="fas fa-key"></i>
            <span>Адміністрація</span>
        </a>
    </li>

    <li class="nav-item {{ request()->is('admin/kindergartens*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/kindergartens') }}">
            <i class="fas fa-hotel"></i>
            <span>Садки</span>
        </a>
    </li>

    <li class="nav-item {{ request()->is('admin/users*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/users') }}">
            <i class="fas fa-users"></i>
            <span>Користувачі</span></a>
    </li>

    <li class="nav-item {{ request()->is('admin/groups*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/groups') }}">
            <i class="fas fa-layer-group"></i>
            <span>Групи</span></a>
    </li>

    <li class="nav-item {{ request()->is('admin/schedules*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/schedules') }}">
            <i class="far fa-calendar-alt"></i>
            <span>Розклад занять</span></a>
    </li>

    <li class="nav-item {{ request()->is('admin/nutritions*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/nutritions') }}">
            <i class="fas fa-utensils"></i>
            <span>Меню харчування</span></a>
    </li>

    <li class="nav-item {{ request()->is('admin/posts*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/posts') }}">
            <i class="fas fa-newspaper"></i>
            <span>Новини</span></a>
    </li>

    <li class="nav-item {{ request()->is('admin/notifications*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/notifications') }}">
            <i class="fas fa-bell"></i>
            <span>Повідомлення</span></a>
    </li>

    <li class="nav-item {{ request()->is('admin/conversations*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ url('admin/conversations') }}">
            <i class="fas fa-comments"></i>
            <span>Листування</span></a>
    </li>

</ul>
