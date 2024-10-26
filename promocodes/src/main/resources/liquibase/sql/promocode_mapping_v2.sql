alter table promo_code add column if not exists expires_at varchar(100);
alter table promo_code add column if not exists promo_code_value varchar(100);
alter table promo_code add column if not exists alg_version varchar(20);
alter table promo_code add column if not exists gpt_message text;

alter table raw_gpt_company rename to gpt_message;

alter table gpt_message add column if not exists request text;