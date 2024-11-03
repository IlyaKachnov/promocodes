alter table public.promo_code
    add column if not exists short_description varchar(1024);