alter table public.promo_code
    add column if not exists category_id bigint;
ALTER TABLE public.promo_code
    ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES public.category (id);