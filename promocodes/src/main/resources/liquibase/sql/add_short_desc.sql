alter table public.promo_code
    add column if not exists short_description varchar(1024);

alter table public.promo_code drop column if exists promo_code;
CREATE INDEX idx_gin_promo_code
    ON public.promo_code
        USING gin (to_tsvector('russian', "company_name"));