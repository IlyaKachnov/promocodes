--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_token (
                                     id bigint NOT NULL,
                                     token text,
                                     expires_at bigint
);


ALTER TABLE public.access_token OWNER TO postgres;

--
-- Name: access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.access_token ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.access_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
                                 id bigint NOT NULL,
                                 name character varying
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
                                id bigint NOT NULL,
                                name character varying,
                                category_id bigint,
                                url character varying
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.company ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.execution (
                                  id bigint NOT NULL,
                                  created_at timestamp without time zone,
                                  status character varying(20)
);


ALTER TABLE public.execution OWNER TO postgres;

--
-- Name: execution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.execution ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.execution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: promo_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo_code (
                                   id bigint NOT NULL,
                                   company_name character varying,
                                   description text,
                                   promo_code character varying,
                                   url character varying,
                                   created_at timestamp without time zone,
                                   category character varying,
                                   execution_id bigint,
                                   published_date date
);


ALTER TABLE public.promo_code OWNER TO postgres;

--
-- Name: raw_video_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_video_data (
                                       promo_code character varying,
                                       id bigint NOT NULL,
                                       description text,
                                       published_date date,
                                       name character varying,
                                       channel_id character varying,
                                       play_list_id character varying,
                                       created_at timestamp without time zone,
                                       channel_name character varying,
                                       execution_id bigint
);


ALTER TABLE public.raw_video_data OWNER TO postgres;

--
-- Name: promo_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.raw_video_data ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.promo_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: promo_code_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.promo_code ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.promo_code_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: raw_gpt_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_gpt_company (
                                        id bigint NOT NULL,
                                        data text
);


ALTER TABLE public.raw_gpt_company OWNER TO postgres;

--
-- Name: raw_gpt_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.raw_gpt_company ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.raw_gpt_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Name: youtube_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.youtube_channel (
                                        id bigint NOT NULL,
                                        name character varying,
                                        channel_id character varying
);


ALTER TABLE public.youtube_channel OWNER TO postgres;

--
-- Name: youtube_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.youtube_channel ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.youtube_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );


--
-- Data for Name: access_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (1, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.ihs2U9mYOKzQe-ldCloa1W3Ixp5V1dkVRa6FO3zJqiJuqpFW2iq8CnfXOWSEH7MU2waFSt4-rOOwS86Ud6SJ8cQBiHJUQxvk8wYrf41ljF7oGgoxWtAwnILpz3WiNx_y1q5I9_qkHDYVcqRa83C4GMmkJ4hNgHYYI5QmwHTxgQ_GUwxZYvoxYdXhibSYdyYzQKL3jyqFNUldyL2AoD8HbRyu9wmHhHBO_eUP3tAkf636JIgGJClA2AcTndI93E6OfqlCViunM2SzmOW8l37ZIFmwqODA9qmLmDC8EqhBpEyvb8JSH2D1i--3vugUwYH24gWMFur8w-_UEiXrzUB90A.cd2I7g5XjfzAsO_jvcZdXQ.7KfJ85Blhc6aswZ6YGH9zMl7v8tcXo5KyDO4NHtYg1fxqLsSgw1I8LDUAfA2-Po25akQdKom4TMNi2mwfGyIlBKDjwI42N8LTSxjMp2kyRzITEGffUPhZlGHaDCdf3zl9ejTPdzYeh8A4sLtKxrzU5Vgdw4uBv7QNI6fZrKUaMYPQZ8E4rTckJUbmNcRqwjLlu82gar-iVZeahoFOvLmbECcjvl-TDQ5uN7DDmODKStEN3ZkLztcvH2xDFsPoQD0u8re6-dwPlOdZeraehMSs1WsUEdwAwZSSDqK4ypeDCjQ1hvPpBfGM30QBD7rHwirZAmimozz3EoY5Mnr6C-QPrV-69k0mGWu4vLfaKMvwuarSMSLsRlCE09UWW1GOcvbX2odi_cYnF9AmIB3Xg-cnlPjoMNMxvdXjqGK4e0UPooG6weeVNAY-jy3KvhhTuDyPp8r7GU0zZ2mANyYLnUuw76LTjVQ3c40FScEB8-W7CJPUOmohPbdXrpwH8bYMGzHgNmyyr5v3isLLM-pc59b7YY-EFxMyoei6zjoEa8ys8fJmQDAPV6pGWCGvViMYw5reWZ8SEvLxCz6ep-HBlGr8hs--FEQQRIXdeDJAdVjeBxgm4VcSFfCKXD49MOxQ_GivMOVxvkpOnmCDWEkxHx-ZEe_LgFTlyKEt1QEfViYHDsPAZhEN7m0yryEgaYWRMbVeNGcZ5_GisAxN6uK-G-CjXr6xwSQRf6xGTPI63SZTzM.8MZA5ZeR0_WckF01uxYXOYIaHpE03vJI0Bv3Ip4Z9nw', 1718276885967);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (2, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.OsQAzI7OKBIO3SjElAOSrwT0aFRYEaQktN8lBRur9y2PbfLU_XsUUPieB2SJCwKt5xsClOW8MCak_9zhslD00zUo4k8XsHu_-jK70JLkblESJl7MmJrP4X8q566DVl-hBPCBpsQ_mV4JS-P-CTXAm9ANX60Z7ldKoh6EG-CFyJx32icIzB7Mvk3m3N1lSFPpEsQ9ebR-em7cv7QU59-Hyk7H8b8I2gmv9VKJQvVkMgp_osCzxFo2fWRuVqyi3-z1zYtRCNdd918T1OMwW9ahNMibdTCgAD6MFKZexFL80xyOebmOlkLnlGUbl6Ajjwwct_aba4VchuRmm1DsheZ48g.chzukmP2zEZXoapGYvWxUg.xs5UqA0Rhed6x4PshaokwjS1VtqWqI0W-AbOMW01aOxyQaGy1DECeCFf1WzWrk_gm0YkbFekpumQN2qbL-W5EeIy3JP_lRb_JCfcIfLQ6N_DueqnA529tgwQ2GaYvpLvWG2smeTRY26tu3Ypw6NRTBLj9DTDE5fjS8S0FUUdpcgbbrN0mU9l3wKiaBt2i0rs8vZQZIqg3DMLV5yG5C2Z8iXHjiU6pXwsZgAavMi-huBHx2-DteFXqKCpcq2j1gNXbpB4rVoRZVurbCg2BD6YjM9SMnBr25xk0py-T--d0HS1h9OBAJut4UNUXvOGwS_CspycTKF149khajygQCMcNoRl2Zdx0jh-Jg5opAJGuIY68pYnmcZaiRJRliTIF6dqBrrdaoV2VjmydbZNVKY0KKLt18TXgnXnsznKxpjJVl3pzwUzdG7el9PQEc5dSPxdaiv1C1RP742j99AFxbN5VxFfc1ZxV3cVxJuuZ3PGMmb0XqW2pxeHqm41cr4F-kL1jxDRaWgKQaAeDGJGYl2d2LflKGJNm_w211G9GMwfFNq9d1bcH0ghNyLwF2_QeC4BJr_DhktXy5byJHZk5M_3kM4naZqQ4VCiO_PhV73OGDQjM9dA1nIMeW4Asy-0pWW1XSwtuS_e20X-HWJYi63mOjXdqgo4_wEshvfoGLTIX5PQzf2pcqN_yDnbxHvB9iaLpuc8hldKPBMyBprZfhLTz5dd7YYzrcPYK6Q2FJ_LoG8.VMcw9ZKTusjcPSTNuIOLOiiglnaqvVR3Mitudpo9dAM', 1718489604956);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (3, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.eiA028eWt3rcs9XMEymooUjdhH1ctaMsU1J-LJP-wBE4Iag2K4e-no38MhSQVMYSKxG1bIQ7i_Em4nPTbwJzEpNoqFL6M3x1mIbutmtz9hlGDdfQwROTMtPSFlLp9s9asn9E7Wfyt1XsRZ3uaHzhQr5lY8UfVCH0E_8mPPLh7qUcd3zCm4lh7MzxCIx1tUhOF29jBaKvmSZNyszDSOobKxlPkronzVOA3mUKIze_woar26sxZuZr_bCawzOCoqyausXnYN5QP_9gbfzE_p_Q3UaoeAbCv9tNJgkj-mb3zNOeLKKKbNIEKIBexSH4eJ-w6LvJR-Abwbi-iIYGVO6fsQ.uzRmDxbkESDgEC5JbB1Whg.S1-yPmrgM7ROfuQTHXKXLodJEdh9fWLebuZ7emoupu7h4Cmirhw_WXZelaw15fTjjKrAYjFXFfDajPljzgnL9vSfRZNkcB_qexpfOWRk5YD674Ab1j0J6I5pqkJ03hu0hKYCfKvMWth-TE0xkQzV1v7a1oSDO2nPkYrzQMUCWW2fPphnybAatqbtzAh9cTFwLBIMR3u1mFWA6F3Vs63gvKjrB4BOgQeJ8RJzANVqzn5HyYp-o5Tmi0BYTyYNR1HAow02GI1j0qlph2d2fXZGRera6610xDf_3dRFHIN4aXcS48qPNvWy4Uj3k7hmvttbSdVuquaeX-UOLtRgDpthXjSbpXqSUbv8oVFQmKmCyZ8RSalgsN0yagzthkHdRoNMUMG-bt0s1drJmZFWmzIOgx1G2uKDTLXo_0OU1b6kM9fdeWI-hLTtDjNKJRDj2tX9ttiL9tatSz_wDHBz_9Vyk5vKT5QWjIZRzJCMqzegkTSDqh9ndsW1WXm5TIZlKcUpHeRx5lSGBiV6zjXG9pL0f_2ikQIQiUVBpSyyJgAGwD13LJ7-EFsS4MivEDQqFZvWec8DMm5zrKJPdmELTckvfjCorxl0TwhRD8AZlWh2w-yNIuxd1S6fVMyVhybe-wAJXuBjus4wn3FDRDEjJ1ZzVUCOxl9D1-TQWV-T4KEI3QP8fgnLNTgbxZOo9QanBv8aoZywwVbNZMpHBubVDTvF-4MKC1VEkyhLoW3fL2EK1R8.kowloDL84nNplShzHihkGg5OIU5ha5tFKaSMEtRmork', 1718491421593);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (4, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.q4dn77FUrfpq-JLDZh2JWiCJUcAB97qcbdtFnCzfrbBiICRbUPGcdMl1_0iifQCYxktdppZcIdW09fLx3CWxAlW0ULoOjU_bZ9QVOeWNytFyDYzBrTPvOUhdH1s7NyjJoxnJHRbfnF7pbx9nB634xyrU-8HvJFOpmqCqX1JK9RM09aUP0H-S_7-Dr87R46IkzjLC1So8Nv8FCkJguwTfR8rPZsoFI9KbGAoDwpbLkI198nTbC0kMfdtLD8dxAFKXjVFmvdYMZnbMg5hj8EEuApwCtp0P8oYfuH7wACjfLZVGmjAokuBSOp9mfkGPr6GDWmN1iON7IxXVgeZ34_Co2w.Zvc5aogEJbfiErluNjBmeQ.Np55mgRl7iOmNLBkPcf-ELF-q-jI8LBy-etmZOmgmI6nRqRhbgRG4elDdbbFSXCTYFZbgQpb8S01RzwI1H2Q7WndHsGRPNMyHBCLoDUhNYhbnHll_XZkCh8ejPig0hfkrEdE-Pzqu7Z3ZqIXOX52DvcXbYafABkBGMdhF4bXI26fKv_DMJTf6JvLHzcVCRpX1PLN3qG5PKqz0lqL3RQrY0S8h12l-jnlpceyhNBff7dfQzdI_FvxacVUOFaphLaP3EKavoeSgMbSqwFSd9ZGe1tS1GF6IzLZb47jZcCtp9dzqzjhkvf2zFA6OE1AO0CHzW2w6B5TQ3cYPgNVoSQxBToCZg0RTjym1TTgCNRn7G1wiVplxtUygzeOGLcZo_DrAqapkgeDkjwIP8FDbrmnnk3X3APjGKJMDwQjE6IJw-CeiWWuFeSmfu7aKb2W94MKj6CqgPR081KUEhS8HAuyCzGkKjBFgYbI71JytAiQa3VZQnClz76sfv1h4RZ-7CXPswR69U2uPVBVqk7GhtTO3vA4xyBC5__CwAXf8v_j6mryqUJhYaIMm7PxBN-Hg1jhyxxGwszP7j0Ld0_pLMR05iF_POULDiPrxKZQ7m1QnXhqOQs6kYbJlvWVHaGjVQeAeHkYyoSd-mRNAZvOlmZ6WwVyAd0RRu67p8fzER-kFFcTHsnMZYBDNpZg6uX06reHCfPXztQmwFkyoo2aughx8VxDl4_IQ1C62qkdLaWjCDc.82bbnBnSzraHYOAvncgNBAcqbAciVbmMB290hKBTVtQ', 1720815298945);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (5, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.Rr25nZ8ZAPevAyBDJ9AdLBfErajgdDiEFXdKxY1bRWgFguG3kS6Q2EwwNxRKndcOdTjSiaKhHqHNRHX4k8gXcCzVBrsgsEutEGRYnLZX8dYc6YHgDXfG5oPtu_pvW1pbDE7p-Oj-YCW49leyi3JIFH-yodWVtYqGmlEIHBeu60vwa67o0irvRwTznNDzNja7FawGPRoCBxGNOvYZ4SlqGCe0fbhNQmEkBY-t0hXlRSjIm42L1eo3oDfvhiAmw-iRuKoTQ6vdidkwt5gOCr1QYfBioTi3LDQYisF3huqcvHpYNdre4-2xSBPQUMoB82V1lUsAjEelOffpJH9311k2fg.1ZGMEU402hBFMEDeCUnd8Q.21FA0RjGsmWgfsU_mB3ya984mG4HI5YU4kJ8T1PEICJ-CJqhfrixop7H7e641haZBqY8Xj_205pqZygGV3clN-ZNHog_HGPX-6BHAAsBsGBC2WYleZw6RN7D4rCih7Ag4yG0fKaFD-uyGaqPqawbj5Yept_P2DUfRZc9xmHlpPL1U80_0W0asRtIF9AuEDKfd2k1A8aevP3ZN-u-aeg1qVenOmu8M4cvbZN0NqBmK4_8t2EXUZJYGf5HEfgFiCzP-KPefkHMojNkSTsV3X2dBVvqoc-pXn6swt6O_yiYAF1-vPpnj6UQLiMTDlu1dgKZWHoyZegEurxf8g5uplVumF9QN3yBSy0_7NP1Cc0kHDH8X7gV58FWWWH9mhEP7BGiQdCwL96Nulu3aBImyXgPUDpS-7kl1RfFRVmX1BIMPaP9-xiEB7UkBAf4PxqpChEEyCWkbKZiV6wrYCQ0lRRceB4RXQ0SEJdy3lyrTUfV6OtYDM3WV7RHvr0AITtlX3KC4V6yf-pyMiBhfTqNLtRFlvYUCVKZH1GMSq31xD5zC-DJZLleiGH9gkTMRAbh6tJPHgcqO9mpT02trwLaDnhWUi83iK5Tv2uoHs-O85Z6MA4P3Iv_bhYBGVosqDWdawz00IwNUXowxdehTeccBuzdr5p4hnfyF93BuvgyXlZ0I1igtYhgSEgiDqekNrMHf-ZHU9RrFDqALRZzbe5nVCgV_xC7ZOHINAG57MbioLtyHBE.ccF7sw-8Uc60T9oVm6C_uthbWUo_aqYHFn0qssBMgY0', 1720817167382);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (6, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.SNqPvS4tQfwsTYydxd_LaIyYui4W7RJq2UtkXTE_JqpeBniyS-HIZUOJJK-ArLclP51F8KSZqThd6t3wVz6F05D8vFEhDKPgfhht95W55I8nEK4cZgY9yNmL9tt8GjuymYXtNsYAKnNp_o-GDjd7pwMVj3KKABauISl9UMqz1bJAL8mF3oktDzyrJTg_QetNIKp95rdVn7fTWbMngdWuATmAqUT5_7NNNQk34PjRshyS-y2pWxrrqGn6B482ee-TyZ866Kz3Kp-JFEHnvqoJAK09gf1ZmWLx_fCDnH6hf9IB3zToTr6-1xkSBuXGg6y5pOvlmxshlb0a5RvePq_1dQ.76-dMQLikD9erauOYQ5o_Q.QP8UgdodPZEMx91J22HYHMXcECQlqcdg8efn3OiU2rRgs_EhpLH6zLEuzscwleNdijuC8oCFyZYVe62IabvpvZZaUEACfcZobz4R1H6ERiXTQiaU0hW2BKJZuXGx2jYtJIqaAZTTQDPtlRXz0mqbDaASqrCBtgYQyl8WD5AiuYOrQWe9ab1ESUCmCSzyZv8vUzZdngjOup1h-zP6pYndoTZYGAL_wzjTwERqSy72tx2ptqTCaf21K3k5QQy25BMnzMIJHFXv04ixw1pqzg8eYgaM_zS_nN4xOc1ZUn3l846jOhiq2T1D5RLR2S6XRWRCsQYTSms7exaMCu9JQfTjDXHMeqK0yTkR_VFjrnVqkJauQ3mVguNHT4V7mxyo_51a3phTji1PpgIjvFrilp3D0c9Q4dUGxNX1I_hlV79IWaondOcxRNZ6TPnXlK3jy1HmDaH7nnt46irI4gH5HtmTobKwqa0U5RDBYhXMX0RjZefQQ9kMh0T_b6oH94XErIX5pZxAq6ssFDy4hJV5lcy3kMW6DOUnqFWvU8mOn0f1jyFKBo2jz3TfdhIQ8n0fDbUSawxeTwzYVdkr4aeOWKcUyHA5tkSJTnXi5JPl1hiTNcZ5UHAR9UoJuLRCnsiROU00SLWGhW-Ep85TViQf_o5PlT8RkcDXFub0jKF5JsITaXaHwnyMCd6QRtheZxxGebjaVMgXF8Y8P2nf3F3khprOlj-zymiCyi8MheZ0rA69QLw.VjLxVR71_8dHSVo_TzaKcql9-FJOaHsGC_Ke9r9gjPQ', 1720818986601);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (7, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.pFpVomozit2J7KRLzmvy4SsvvZLwBMGO--IcfZQv9n0LXyqNiLMN-E0nEFmwo35_htWCzKF1-HabJdkmRCQ5P133HhLink7t6mJiOOOZSBK5r4I_viqPeju5cjr2a0oeaylmdBzfEDnZxpPmEsTaPmRvOBnt-stGTjC7ozygvDo2Sj0iZpYT7nUz9VMACQmj4HbLIHQsr2KKuiwrsh47V-7j3YjfdM1m74ilFkPIeswp2HfINW6TtGbr2H6WzQZhGfumz2L3XsvfJsXfqZP1dZ9a7EjVJh-_S_8kTRLxZwZRff-rq3WAULGUjyQzOjKpviiVoE-GnEswDId7tYP5DQ.h5-ZVjxDADF9IUhEivTr2g.cGmbqJ-M6a2bOTzWERSZWKc4Rfcsthf94x7JJ0Sz5NHFKkKHYB1-MxyQ0_8sxVha37FmMorusmzCz5OvZBoiClwFs-N3zv3MRVQj0iIlgV28pBDmVUB9jC7BlW6ykIgJexQsZczjMfowtZGqwJg8tW-wtXcVy72qbZcdUBOt4j5IB71-XHW28nz64PVCriTBaD4ju-vM2pvBukbGPHV6Fex5rACSPgvB30jZIMsvKMEXRrqrVIgkRrizDSw9hCgIJg_8CY8OpoVzhESfZ1MUatmK9tbBReX-7VV2ArReoiNNYSV_FDOSQemydEeHYHf-j8hg_o363HpCQFkLYx4BDI_pIttGrfFmOhDRNNS4lyGP0Oc0HtStC7sHAEtSSoSSHT09AffJl18qJ5r6qCABSmm4URpc_Qr3UxhfUPkWTfqwQDdTYONazHzv6B-KJUq4LpIumIHX_5EpqohUZDXLBhgqv4wy-UvPt2VsdiZM4THOFCy0r84ZHMb8ySla9mJ14tQyD9xWmOa3AZcLgmXG7K_bWZsJT6aZDFclJuS8f5-BrdTHSwKCOcD0_BhdD91VoeiAeEP0kKZltjzkPrg6ApPAZRlk9Qey0U4JT7D0yeMz4m6-gCh2j_IfwvtljCNEvkZUVmp6J8B0HMcqr3i5ICLO-x-PwRlz9HLe4d7lE9-V-YwTPn2o7wgCc4C97G4C_vhityDSvrbJmXU8oHWZL3rF0OPMZbDtlp92_xzjwYM.OwnwUe7xLF-sh0bquL4wxB19a2hcuC0JnieYacFbQTc', 1720820762965);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (8, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.sZiWB2fnVOun02ZiaknWfKF37Ddxn7XgeGVnuzgSsZt8Gs_zjdjkW-dsxZnHatkLdLTRUWnYJtIX2vfqRVS5DukLpr5bm5i15ZrwljhUYN7hDF5qx2fIzhgbGqj-ibwD9lC1PnnElzugrEPiOnuOxf4T2YdpNIqSUBee69iINL2ILm_aCz3817Ub9PSulGFWhvuYreBOIyWmk5wfXXbOhrc9OH9CGJewMztb9N8I3HUD04CuiCcXNZgjAfeL5JMx7N39JNBhLHfxcSfVXn3oYlztdoyrjitnCdDKPQUGWg-O_CrwvdL2onryG4mkZ2JYBDfMof2eNYwIH9C_pI0JCw.yI_aGcFWh410IwtsFNGFKw.PjD_onSw6ZEpSQY8gnppl-kFjumSd9uYqw2sIzL6g_zMqXi09WJjI-57BrK07KueIARvqfEl0z8yNyQXEAPH4K778gUeyO8_GcQh1YVArS-ukiqHpR7ozZuAftu1wjGahLuI9pq4lMqGV13kS6NsEzPHkpb48twVVt5sR0T9RYUJp0lGHrQMBjdLU_KsGhoZZPiSeYNEMN9dJ27Pzhi4-FJR5DNTUrw4VSrbHhoanSAf3MWGGlcprMLHqeeaH410T_OctpG0qdjzi7wp_bd1hib8ve2ySbp5LmC0cqcQLfee_uEzW463O6H68kx8-h6feZv-ebYIPXW8uwhWwQ1xXYG0a8MuJGKqqDDXVR8hfH4WHceuhznKKTE9Zp-eJLWMW_82qtIHBlaNOOCF0czkKW3jcUKcSpmraIq2gjiX8j8NrzYZ-UWxNkiD485eJcmuM61MVucctLHUc2jWDSBTjG24FCK0QUw5ZMbYSTO7buMsRQqfgk7aRMc99iWqGLOztA_6aeIwnzPCKESTdjMS3JXctE_7e03-8zMtZDShHZCz1m-X_qH7tUchvvcQW7a52aoAsRG5pxY-HivRsqntHYPSpEOIpzCdPbNSRg1sSCqm_99enrbneytbM4YCfU8LkYuJGQOEoOvagQLRf9PWvlx-q0j9QWfta2b-gp3BSwDi4l3qbjrck7UU--cq_nVE_PCafFhgQ8KzXdHSwAYZ3P1Yt-sKJ0vJjciRuihob-E.MLYhGdGYU6C2udVrmKtXPnwjq72Hyq1AdgSzauFp2v8', 1726333961621);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (9, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.OfaOX9g5fLaE45UxHQVuYAd67nrtZrFt2wphFWntI0M6GdjfutgeHvMh7M7XtI8K-b9joXxM2zzoR5C9ObCp4p6xttPu1S6S2ViFtSMmDKJHDw3HjuaJu3yjjN2kvW0qOx2scKhA0Doo6IAjFuQPycKrEvxq6a89B-ayHn9FlBPbKHqWA6mkZsvNMrFxPtgNU627_t5a9OuEkWthR2jP8QqK7gz70KpJRO76cCiHBylXHOsst9GDjBk2dAL-OHRqEQMTt29VKMy9ONIDbj81Qq-Zk57TtGDXTzElddL7EQkR61LRSdtBsOR-hltb3pSL4jUh_K96A6AcrvHJ7UvXPw.wxpGxD1yiXhgVSPTMbhGiA.w2WM6WWuJiuD8WPEeDYn6XSwsetY3KXIBxtEMr2xKDzYSvul7RZnj2II2YX6r2xHhSTd4A0tpGTotpkYJTbOhAsu5vkeJho4-4r2KHy2jTNPVykKMabtXFRzkB7Fay0aaKp5vPiKIc3WGyIi2EfjxSRYquCuw1oRKOwDgCh5HbubWj4QTdjVs-UZsK2WOgyIGyRVELT72mAfTsnWTiSYRqAFidLNMZOKU5T3tbq0_sqsDIkaKDASNGsbx3AvAqNAshypPzj33MVN9-U8oPmG5r9NrFp8O6XTRnGm644U3E1of9-nkneWzNcfXwH1YVOOrHnGvFu_K4R5nKtdqtJf--sZy9pa4vjKNnfIjzMX65uPZT52h-jq1wH2hZvU-faz8zlyhkb2A4FLxxCXSTqHoDB8ovHjBFeSSDmgufk_Z9gCKrahSYBOvzCmO8J07W7-seyHwuP6Oc1D2HBe3sb64Aw5GBsuJf8jZgaMN1DFrLwRN8wpNB5ZWdc3xOaYxSk_U-hBW6guXEltLDDVeui-a_OuUN05QnEadZ3CT3swl8wGJicehtsxC_x-zSkV5PEY2csw458dRBWOYSLt3gBpyvWU4R2w_9bc6xb7fq0MlQgyigOt98R6qW2NG7lpfMedouLfc565XLkROG3CtvzvzKfG1OvXRsx-MW_DokfoQGGvtEWEUqVErPU-L7lp7FVWwd4XZvNB1IO2QfXFROXt_ov6mw9CJinNpK4Zu9Kcn9Y.qEu6tenG4Vqp6W7iNvacCDChAY86IRvXinh50pb4pYU', 1726347084357);
INSERT INTO public.access_token (id, token, expires_at) OVERRIDING SYSTEM VALUE VALUES (10, 'eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.HWhBerH44HwDP4OFvTH0ZmVOAtXu82T0CtHe23KvZVpFos79cCmSb8FxD7DRDA1qTXXWO7dKH3KA6-bDBHx2ht1KLQKECo-7JFXMbt7OWqHibHsYIOL6vz8AMt6DyhJaChMHzmidIwzXdTo5W4LAgfQb8Npi09jXGBSn50_IIN_E6YlgkQqYBV0ul7rZoTqs23zbLAVIe5spmiEMu2-PQ3OMnjTGC0XKbJRoxZWxieffOf1pakLnzukTQcv9aTZluUZxgQrSb9mUOKtaZrMlerd72Pd95tQb9JzHexgLVuDp7IqYpnotYp5pEorWQEomFQcY5ZmFbEGshYTy_Ec34w.YSxld-E5QO_ew-QtwyTtyw.GmXq0G_53GoKWKSwXFHjIKBsYkqNhUt-fJlPjkHKZJOronZXVoxsQkMpons9N-mQzjMAN2AYHinV3c6AI5nEObElfwu02hH78jqdunvvC2a7LDYadggmu2S727z1OroF0Tu3UGAVxJKXhiNW13MqZTJvz9YuefHDkL7pUiDo0tdgwZEfvfpb0jVwW_aa2DmapXuZKvuCueTJS7l8WfoYWbHmDRZ8qZn-yjp5o8PWs-kVBUIT3nmrfVAY32weed4adbG5QKUQ1N15fzG0-cIA_fK6jUg_OuAPBRYfElqpY4LiHZamSyNmgSQRP3GNzQOg-yvvswdve3wDSlF-2NY-ZLJfTKIxXVqIu1GK68-7-Qib6K0YnJVzyrjsIzq_quAa5X9X6ZyscIygOxSWF_Omu7-zPet85uofF1BnPF_8hJpzvJ0tC_8wNzXHD1zdnUa2PKAC_fP6OhUYMZNGy89m1CErjFZ5hm7K-81YDGuoZhZNSV5rjpoyL54RklRW8imbE73W21gsU7CY4PFcvOcakJBr7m2AeavnF_re5t48cZ2jgBu24-jaAGTidUK4PoI1raIvqUamI8sVWIiQvH0idJo6wzBwcNRR5r8v-jGkkQoaSMS6bMbfEX4xKhuzJMqWBDuzyLJom-gkO89P56TuOHebet1xMqesoP54O1H-cO40Q2w9a9UPxSLx-8FS3Dyt4vMMjVKRHmd7BdHDm8xllxpjLqpPfzoLvLubRHG5xUA.GTJnCk2C7VEalz0QR9ljvhj6oVkeWLnF6i8BPXhWHQA', 1727035399492);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Электроника');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'Одежда');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (3, 'Книги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (4, 'Автомобили');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (5, 'Мебель');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (6, 'Услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (7, 'Продукты питания');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (8, 'Красота и здоровье');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (9, 'Спорт и отдых');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (10, 'Дом и сад');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (11, 'Детские товары');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (12, 'Транспорт');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (13, 'Бытовая техника');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (14, 'Инструменты');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (15, 'Животные и растения');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (16, 'Ювелирные изделия');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (17, 'Туризм и путешествия');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (18, 'Развлечения');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (19, 'Строительство');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (20, 'Антиквариат');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (21, 'Программное обеспечение');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (22, 'Образование');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (23, 'Игры и хобби');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (24, 'Канцелярские товары');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (25, 'Рестораны и кафе');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (26, 'Офисное оборудование');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (27, 'Финансовые услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (28, 'Связь и коммуникации');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (29, 'Гаджеты и аксессуары');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (30, 'Музыка и фильмы');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (31, 'Безопасность');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (32, 'Медицина');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (33, 'Фармацевтика');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (34, 'Промышленные товары');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (35, 'Креативные услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (36, 'Профессиональные услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (37, 'Косметические средства');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (38, 'Кухонная утварь');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (39, 'Готовые блюда');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (40, 'Украшения для дома');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (41, 'Аксессуары для автомобилей');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (42, 'Домашняя электроника');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (43, 'Товары для животных');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (44, 'Подарки и сувениры');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (45, 'Оборудование для офиса');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (46, 'Товары ручной работы');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (47, 'Запчасти и комплектующие');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (48, 'Товары личной гигиены');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (49, 'Компьютеры и ноутбуки');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (50, 'Мобильные телефоны');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (51, 'Электронные книги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (52, 'Звуковое оборудование');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (53, 'Фотография и видео');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (54, 'Медиапродукция');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (55, 'Уход за телом');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (56, 'Авиаперелеты');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (57, 'Автобусные перевозки');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (58, 'Ж/Д билеты');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (59, 'Пассажирские корабли');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (60, 'Такси и каршеринг');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (61, 'Бизнес-услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (62, 'Персональные услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (63, 'Юридические услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (64, 'Бухгалтерские услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (65, 'Ветеринарные услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (66, 'Дизайнерские услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (67, 'Консалтинговые услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (68, 'Рекламные услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (69, 'Организация мероприятий');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (70, 'Переводческие услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (71, 'Службы доставки');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (72, 'Курьерские службы');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (73, 'Интернет-услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (74, 'Телекоммуникационные услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (75, 'Аренда и прокат');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (76, 'Страхование');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (77, 'Банковские услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (78, 'Инвестиционные услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (79, 'Платежные системы');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (80, 'Медицинское страхование');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (81, 'Социальные услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (82, 'Логистика и транспорт');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (83, 'Подбор персонала');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (84, 'Сервисы для путешествий');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (85, 'Благотворительность');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (86, 'Культурные мероприятия');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (87, 'Визовые услуги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (88, 'Курсы и тренинги');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (89, 'Лицензии и разрешения');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (90, 'Туристическое снаряжение');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (91, 'Билеты на концерты');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (92, 'Услуги автосервиса');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (93, 'Карьера и образование');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (94, 'Танцы и фитнес');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (95, 'Обувь');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (96, 'Аксессуары');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (97, 'Коллекционные предметы');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (98, 'Прокат оборудования');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (99, 'Велосипеды и самокаты');
INSERT INTO public.category (id, name) OVERRIDING SYSTEM VALUE VALUES (100, 'Прокат велосипедов');


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (4, 'Авоська', 7, 'https://avoska.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (5, 'АВТО-ЕВРО', 4, 'https://www.avto-euro.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (7, 'АвтоМаг', 1, 'https://www.avtomag.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (9, 'АДАМАС', 16, 'https://www.adamas.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (10, 'Азбука вкуса', 7, 'https://www.azbukavkusa.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (12, 'Аквафор', 13, 'https://www.aquaphor.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (13, 'Акушерство', 11, 'https://www.akusherstvo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (14, 'Аленка', 7, 'https://www.alenka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (16, 'Аптека 36,6', 33, 'https://www.366.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (17, 'Аптека Апрель', 33, 'https://www.apteka-aprel.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (19, 'Аптека Вита', 33, 'https://www.vita.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (21, 'Аптека Ригла', 33, 'https://www.rigla.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (23, 'Ароматный Мир', 7, 'https://www.aromatmir.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (24, 'Ассорти-продукт', 7, 'https://www.assorti-product.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (27, 'Аэрофлот', 12, 'https://www.aeroflot.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (29, 'Банки.ру', 27, 'https://www.banki.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (30, 'Бауцентр', 13, 'https://baucenter.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (31, 'Бетховен', 7, 'https://www.betboom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (34, 'Бигам', 13, 'https://www.bigam.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (36, 'Билайн ТВ', 28, 'https://www.beeline.ru/tv/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (38, 'Бристоль', 7, 'https://bristol.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (39, 'Бука', 1, 'https://buka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (40, 'Буквоед', 3, 'https://bookvoed.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (42, 'ВелоДрайв', 12, 'https://velodrive.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (43, 'ВелоСклад', 12, 'https://velosklad.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (45, 'Виктория', 7, 'https://victoria-group.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (46, 'ВИНЛАБ', 7, 'https://www.vinlab.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (51, 'Вкусно — и точка', 7, 'https://vkusnoetochka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (52, 'Водопад', 1, 'https://vodopad.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (54, 'Всёсмарт', 1, 'https://vsemart.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (55, 'Встройка-Соло', 1, 'https://vstroika-solo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (56, 'ВТБ', 27, 'https://www.vtb.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (59, 'Газпромбанк', 27, 'https://www.gazprombank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (61, 'Галамарт', 10, 'https://www.galamart.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (63, 'Гемотест', 32, 'https://www.gemotest.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (64, 'Горздрав', 33, 'https://www.gorzdrav.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (65, 'ДА!', 1, 'https://www.da.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (67, 'Деливери (бывший Delivery Club)', 25, 'https://www.delivery-club.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (68, 'Деликатеска.ру', 7, 'https://delicateska.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (70, 'Детский Мир', 11, 'https://detmir.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (71, 'Дефиле', 2, 'https://www.defile.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (72, 'Дикси', 7, 'https://www.dixy.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (74, 'Додо Пицца', 25, 'https://www.dodopizza.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (77, 'Домовой', 5, 'https://www.domovoy.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (79, 'Достаевский', 25, 'https://www.dostaevsky.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (81, 'ЕАПТЕКА', 33, 'https://www.eapteka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (82, 'Евродом', 5, 'https://www.evrodom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (84, 'Евросеть', 1, 'https://www.euroset.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (85, 'Живика', 33, 'https://www.zivika.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (86, 'Ёбидоёби', 25, 'https://www.yobidoyobi.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (87, 'ЗВУК', 1, 'https://sound.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (92, 'ИгроРай', 1, 'https://igroray.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (95, 'Издательство МИФ', 3, 'https://mif.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (96, 'Издательство Питер', 3, 'https://piter.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (98, 'Издательство Эксмо', 3, 'https://www.eksmo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (99, 'ИЛЬ ДЕ БОТЭ', 37, 'https://www.ildebe.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (100, 'Империя Техно', 1, 'https://www.imperiatechno.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (101, 'Ингосстрах', 76, 'https://www.ingos.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (103, 'КАЛЯЕВ', 2, 'https://www.klyaev.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (25, 'АФИША', NULL, 'https://afisha.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (104, 'КАНТ', 1, 'https://www.kant.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (107, 'КЕЙ', 1, 'https://www.key.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (111, 'КОЛЕСО.ру', 4, 'https://www.koleso-russia.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (113, 'КОМУС', 1, 'https://www.komus.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (115, 'Корпорация Центр', 1, 'https://www.corpcentre.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (117, 'Кредит Европа Банк', 27, 'https://www.crediteurope.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (118, 'Кувалда.ру', 1, 'https://www.kuvalda.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (119, 'Лабиринт', 3, 'https://www.labirint.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (121, 'Лента', 7, 'https://www.lenta.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (124, 'ЛитРес', 3, 'https://www.litres.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (126, 'Лукошко', 1, 'https://www.lukoshko.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (127, 'ЛЭТУАЛЬ', 8, 'https://www.letu.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (129, 'Магнит', 7, 'https://magnit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (131, 'Магнит Косметик', 8, 'https://kosmetika.magnit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (48, 'ВКонтакте', NULL, 'https://vk.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (133, 'Магнит-Аптека', 33, 'https://www.magnit-apteka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (90, 'ЗооЗавр', NULL, 'https://zoozaver.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (93, 'Игры Mail.ru', NULL, 'https://games.mail.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (109, 'Кинопоиск', NULL, 'https://www.kinopoisk.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (112, 'КОММЕРСАНТ', NULL, 'https://www.kommersant.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (885, 'Lamoda', 2, 'https://www.lamoda.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (138, 'Матч ТВ', 9, 'https://www.matchtv.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (140, 'Мегабит', 1, 'https://www.megabit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (141, 'Мегамаркет', 1, 'https://www.megamarket.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (142, 'Мегамарт', 7, 'https://www.megamart.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (144, 'МегаФон ТВ', 74, 'https://tv.megafon.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (145, 'Миндаль', 1, 'https://www.mindal.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (147, 'Мир Nintendo', 1, 'https://www.mir-nintendo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (151, 'Мираторг', 7, 'https://www.miraktor.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (152, 'Много лосося', 7, 'https://www.mnogolososya.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (154, 'Монетник.ру', 1, 'https://www.monetnik.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (155, 'МОСИГРА', 23, 'https://www.mosigra.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (158, 'МТС', 28, 'https://www.mts.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (159, 'МТС Live', 28, 'https://live.mts.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (161, 'МТС Premium', 28, 'https://premium.mts.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (163, 'МТС Банк', 27, 'https://www.mtsbank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (164, 'Музторг', 1, 'https://www.muztorg.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (166, 'Нефтьмагистраль', 12, 'https://www.neftemagistral.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (167, 'НИКС', 1, 'https://www.niks.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (169, 'НТВ+', 1, 'https://www.ntvplus.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (170, 'О''КЕЙ', 7, 'https://www.ok.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (172, 'ОГО!', 1, 'https://www.ogogo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (173, 'ОКОЛО', 1, 'https://okolo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (175, 'ОнЛайм', 28, 'https://www.onlime.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (178, 'Открытие', 27, 'https://www.open.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (179, 'ОФИСМАГ', 1, 'https://www.ofismag.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (186, 'Перекрёсток Впрок', 7, 'https://www.vprok.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (187, 'Петрович', 19, 'https://www.petrovich.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (188, 'ПИВ&Ко', 7, 'https://www.pivkoko.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (190, 'Планета Спорт', 9, 'https://planetasport.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (191, 'Плеер.ру', 1, 'https://pleer.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (193, 'Победа Вкуса', 7, 'https://www.pobeda-vkusa.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (195, 'Позитроника', 1, 'https://www.positronica.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (196, 'Порядок', 1, 'https://www.ordern.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (200, 'Почта России', 6, 'https://www.pochta.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (201, 'Принтио', 1, 'https://www.printio.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (202, 'Пятерочка', 7, 'https://5ka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (204, 'Райффайзен банк', 27, 'https://www.raiffeisen.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (205, 'Рамблер Касса', 6, 'https://www.rambler.ru/kassa/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (206, 'РЕGАРД', 1, 'https://www.regard.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (209, 'Республика', 3, 'https://www.respublica.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (210, 'РЖД', 12, 'https://www.rzd.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (211, 'РИВ ГОШ', 8, 'https://www.riviera.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (214, 'Роснефть', 12, 'https://www.rosneft.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (215, 'Ростелеком', 28, 'https://www.rostelecom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (217, 'РУМИКОМ', 1, 'https://www.rumicom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (218, 'РыбачОК', 1, 'https://rybakok.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (220, 'Самбери', 7, 'https://samber.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (221, 'Самокат', 7, 'https://samokat.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (224, 'САТРА', 1, 'https://satra.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (227, 'СберБанк', 27, 'https://www.sberbank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (229, 'СберЗдоровье', 32, 'https://sberhealth.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (232, 'Связной', 1, 'https://www.svyaznoy.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (233, 'Семишагофф', 7, 'https://www.semishagoff.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (235, 'Сити Пицца', 25, 'https://www.citypizza.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (238, 'Ситимобил', 60, 'https://www.citimobil.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (240, 'Снежная Королева', 2, 'https://www.snegorol.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (241, 'СПЛАВ', 9, 'https://www.splash-shop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (243, 'Спортмастер', 9, 'https://www.sportmaster.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (244, 'СТОКМАНН', 1, 'https://www.stockmann.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (245, 'СТОЛПЛИТ', 5, 'https://www.stolplit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (248, 'Строки от МТС', 1, 'https://www.mts.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (250, 'СУШИ МАСТЕР', 25, 'https://www.sushi-master.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (251, 'Суши шоп', 25, 'https://www.sushishop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (253, 'СУШИСЕТ', 1, 'https://sushiset.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (255, 'ТАНУКИ', 7, 'https://tanki.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (256, 'Ташир Пицца', 7, 'https://tashirpizza.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (257, 'ТВОЕ', 2, 'https://tvoe.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (260, 'Теремок', 25, 'https://teremok.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (262, 'ТЕХПОРТ', 1, 'https://tehport.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (265, 'ТОКИО-CITY', 1, 'https://www.tokyo-city.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (267, 'Траектория', 1, 'https://www.trajectoria.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (269, 'Триколор', 1, 'https://www.tricolor.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (176, 'ОНЛАЙНТРЕЙД.РУ', NULL, 'https://onlinetrade.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (270, 'ТТК', 28, 'https://www.ttk.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (272, 'Улыбка радуги', 8, 'https://www.ulibra.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (273, 'Уралсиб', 27, 'https://www.uralsib.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (183, 'Парк Сказка', NULL, 'https://parks-skazka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (184, 'Парфюм Лидер', NULL, 'https://www.parfum-leader.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (223, 'Сантехника Тут', NULL, 'https://santehnikatut.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (230, 'СБЕРМАРКЕТ', NULL, 'https://www.sbermarket.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (259, 'Телеканал Дождь', NULL, 'https://tvrain.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (339, 'AMEDIATEKA', 30, NULL);
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (412, 'castorama', 10, NULL);
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (277, 'Фармленд', 33, 'https://www.pharmelend.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (278, 'Финуслуги', 27, 'https://finuslugi.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (280, 'Фотосклад.ру', 1, 'https://fotosklad.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (281, 'Халва', 13, 'https://halvacard.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (283, 'Хекслет', 22, 'https://hexlet.io/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (286, 'Цифрус', 1, 'https://www.cifrus.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (287, 'ЦУМ', 2, 'https://www.cum.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (289, 'Чижик', 1, 'https://chizhik.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (290, 'Чистая Линия', 7, 'https://chistaya-linia.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (292, 'Шоколадница', 25, 'https://shokoladnitsa.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (293, 'Щедрый', 1, 'https://shchedryi.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (295, 'ЭТМ', 1, 'https://www.etm.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (297, 'Юла', 1, 'https://www.yula.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (298, 'Юлмарт', 1, 'https://www.ulmart.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (299, 'ЮНИЗОО', 1, 'https://www.unizo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (300, 'Юрент', 12, 'https://www.yurent.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (304, 'Яндекс 360', 1, 'https://360.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (305, 'Яндекс Go', 12, 'https://go.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (307, 'Яндекс Диск', 1, 'https://disk.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (308, 'Яндекс Еда', 25, 'https://eda.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (310, 'Яндекс Лавка', 7, 'https://lavka.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (311, 'Яндекс Маркет', 1, 'https://market.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (313, 'Яндекс Плюс', 1, 'https://plus.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (316, 'Яндекс Услуги', 6, 'https://services.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (317, 'Яндекс.Шеф', 7, 'https://chef.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (319, 'Ярче!', 7, 'https://www.yarche.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (320, 'A4 Pizza', 7, 'https://a4pizza.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (321, 'ABBYY', 1, 'https://www.abbyy.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (322, 'Acer', 1, 'https://www.acer.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (324, 'acoola', 1, 'https://www.acoola.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (328, 'adidas', 9, 'https://www.adidas.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (330, 'Adorama', 1, 'https://www.adorama.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (332, 'Alienware arena', 1, 'https://www.alienwarearena.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (334, 'Allsoft', 21, 'https://www.allsoft.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (335, 'Alltime', 1, 'https://www.alltime.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (337, 'Amazon Prime Gaming', 1, 'https://www.amazon.com/gaming');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (340, 'American Tourister', 17, 'https://www.american-tourister.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (341, 'AOMEI', 1, 'https://www.aomei.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (344, 'Apple', 1, 'https://www.apple.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (345, 'Apple Music', 1, 'https://music.apple.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (346, 'apteka.ru', 33, 'https://www.apteka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (348, 'Arzamas', 22, 'https://arzamas.academy/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (350, 'Ashford', 1, 'https://www.ashford.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (351, 'ASKONA', 5, 'https://askona.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (353, 'ASUS', 1, 'https://www.asus.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (356, 'Auslogics', 13, 'https://www.auslogics.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (358, 'auto.ru', 4, 'https://auto.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (360, 'autodoc.ru', 1, 'https://www.autodoc.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (361, 'AUTOTEKA', 1, 'https://www.autoteka.pl/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (363, 'AVG', 21, 'https://www.avg.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (366, 'Avito', 1, 'https://www.avito.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (368, 'BangGood', 1, 'https://www.banggood.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (369, 'BAON', 2, 'https://www.baon.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (371, 'Battle.net', 1, 'https://www.battle.net/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (373, 'BeCompact', 1, 'https://www.becompact.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (375, 'befree', 2, 'https://www.befree.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (376, 'BEKO', 13, 'https://www.beko.com.tr/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (379, 'Bershka', 2, 'https://www.bershka.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (381, 'Bestwatch', 1, 'https://www.bestwatch.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (383, 'BIG geek', 1, 'https://www.biggeek.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (384, 'Biglion', 17, 'https://www.biglion.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (386, 'BILLA', 7, 'https://www.billa.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (389, 'Blizzard', 1, 'https://www.blizzard.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (391, 'BOLT', 1, 'https://www.bolt.eu/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (392, 'Bonprix', 2, 'https://www.bonprix.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (394, 'Book24', 3, 'https://www.book24.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (396, 'Bookmate', 3, 'https://bookmate.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (397, 'BOSCH', 13, 'https://www.bosch.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (399, 'BQ', 1, 'https://www.bq.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (402, 'BRANDSHOP', 1, 'https://www.brandshop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (403, 'Braun', 13, 'https://www.braun.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (405, 'BUBBLE', 1, 'https://www.bubble.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (407, 'BUTIK.', 2, 'https://www.butik.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (408, 'Cafago', 1, 'https://www.cafago.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (410, 'Candy', 7, 'https://www.candy.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (411, 'Canon', 1, 'https://www.canon.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (414, 'CCleaner', 13, 'https://www.ccleaner.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (417, 'cdkeys.com', 1, 'https://www.cdkeys.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (419, 'cheese-cake.ru', 7, 'https://www.cheese-cake.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (421, 'CITIBANK', 27, 'https://www.citibank.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (422, 'Clarins', 8, 'https://www.clarins.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (424, 'COGGLES', 1, 'https://www.coggles.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (425, 'COLIN''S', 2, 'https://www.colins.com.tr/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (426, 'Combo от Mail.ru', 1, 'https://combo.mail.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (429, 'Comss', 1, 'https://www.comss.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (433, 'crockid', 1, NULL);
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (471, 'END.', 1, NULL);
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (435, 'CROPP', 2, 'https://www.cropp.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (436, 'Cstore', 1, 'https://www.cstore.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (438, 'CYMATICS', 1, 'https://www.cymatics.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (439, 'DANYCOM', 28, 'https://www.danycom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (443, 'DELL', 1, 'https://www.dell.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (445, 'Desport', 9, 'https://www.desport.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (446, 'DeWALT', 14, 'https://www.dewalt.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (448, 'DiDi', 12, 'https://www.didiglobal.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (450, 'DLH.net', 1, 'https://www.dlh.net/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (452, 'Domino''s Pizza', 25, 'https://www.dominos.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (453, 'Dostavista', 71, 'https://www.dostavista.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (455, 'Dr.Web', 21, 'https://www.drweb.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (458, 'Drimsim', 28, 'https://www.drimsim.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (460, 'e2e4', 1, 'https://www.e2e4.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (462, 'ECCO', 2, 'https://www.ecco.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (464, 'Edifier', 1, 'https://www.edifier.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (465, 'ELECITY', 1, 'https://www.elecity.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (467, 'Electronic Arts', 23, 'https://www.ea.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (469, 'Elyts', 1, 'https://www.elyts.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (473, 'EnglishDom', 6, 'https://www.englishdom.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (475, 'EPLAZA', 1, 'https://www.eplaza.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (476, 'ESET', 21, 'https://www.eset.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (478, 'FARFETCH', 17, 'https://www.farfetch.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (479, 'FARFOR', 7, 'https://www.farfor.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (481, 'Finn Flare', 2, 'https://www.finnflare.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (484, 'FIX price', 1, 'https://www.fixprice.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (485, 'Flor2U', 6, 'https://www.flor2u.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (487, 'FMAGAZIN', 1, 'https://www.fmagazin.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (489, 'FOOTASYLUM', 2, 'https://footasylum.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (490, 'FORWARD', 1, 'https://www.forward.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (492, 'FUN&SUN', 17, 'https://www.funandsun.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (494, 'GAGA.RU', 1, 'https://www.gaga.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (497, 'GAMERSGATE', 1, 'https://www.gamersgate.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (499, 'GameSessions', 1, 'https://www.gamesessions.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (501, 'Gamiss', 2, 'https://www.gamiss.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (502, 'Gamivo', 1, 'https://www.gamivo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (504, 'GARMIN', 1, 'https://www.garmin.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (506, 'GearVita', 1, 'https://www.gearvita.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (507, 'GeekBrains', 22, 'https://www.geekbrains.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (510, 'Gett', 12, 'https://www.gett.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (512, 'GIVEAWAY of the Day', 1, 'https://www.giveawayoftheday.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (514, 'GLAMOOD', 1, 'https://www.glamood.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (516, 'Gleam', 1, 'https://www.gleam.io/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (517, 'GLOBUS', 1, 'https://www.globus.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (519, 'GOG.com', 1, 'https://www.gog.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (520, 'golama', 1, 'https://www.golama.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (523, 'GRASS', 1, 'https://www.grass.com.au/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (526, 'GROHE', 13, 'https://www.grohe.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (527, 'Grow Food', 7, 'https://www.growfood.com.au/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (528, 'Gshopper', 1, 'https://www.gshopper.com.au/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (530, 'Gulliver TOYS', 11, 'https://www.gullivertoys.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (531, 'H&M', 2, 'https://www.hm.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (533, 'HARMAN', 1, 'https://www.harman.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (536, 'HELIX', 1, 'https://www.helix.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (538, 'Hewlett-Packard', 1, 'https://www.hp.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (540, 'HOFF', 5, 'https://www.hoff.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (542, 'Home Credit', 27, 'https://www.homecredit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (543, 'Home market', 1, 'https://www.homemarket.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (544, 'Homeme', 1, 'https://www.homeme.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (546, 'Hooray Heroes', 1, 'https://www.hoorayheroes.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (549, 'HP', 1, 'https://www.hp.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (551, 'Huawei VMALL', 1, 'https://www.vmall.com.cn/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (553, 'Humble Bundle', 1, 'https://www.humblebundle.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (556, 'IKEA', 5, 'https://www.ikea.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (558, 'IndieGala', 23, 'https://www.indiegala.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (560, 'INSKER', 1, 'https://www.insker.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (563, 'Intel Gaming Access', 1, 'https://www.intelgamingaccess.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (565, 'INVITRO', 32, 'https://www.invitro.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (566, 'IObit', 21, 'https://www.iobit.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (568, 'IVI', 1, 'https://www.ivi.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (569, 'JBL', 1, 'https://www.jbl.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (571, 'JMART', 1, 'https://www.jmart.com.cn/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (573, 'Joom', 1, 'https://www.joom.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (574, 'JYSK', 5, 'https://www.jysk.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (578, 'Kaspersky', 21, 'https://www.kaspersky.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (580, 'KDL', 1, 'https://www.kdl.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (581, 'KDV', 1, 'https://www.kdv.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (582, 'KEENETIC', 1, 'https://www.keenetic.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (584, 'KIABI', 2, 'https://www.kiabi.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (587, 'KION', 1, 'https://www.kion.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (589, 'KolesaDarom', 4, 'https://www.kolesa-darom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (592, 'Kukmara', 13, 'https://www.kukmara.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (596, 'La Redoute', 2, 'https://www.laroutes.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (597, 'La Roche Posay', 33, 'https://www.larocheposay.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (599, 'Lamoda', 2, 'https://www.lamoda.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (555, 'iHerb', NULL, 'https://www.iherb.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (591, 'kotofoto.ru', NULL, 'https://www.kotofoto.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (594, 'L-Wine', NULL, 'https://www.l-wine.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (661, 'newegg', 1, NULL);
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (603, 'LC WAIKIKI', 2, 'https://www.lcwaikiki.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (605, 'Lenovo', 1, 'https://www.lenovo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (606, 'LEOMAX', 1, 'https://www.leomax.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (608, 'Level One', 1, 'https://www.levelone.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (609, 'Level Travel', 17, 'https://www.leveltravel.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (611, 'LG', 1, 'https://www.lg.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (614, 'Lite-Mobile', 1, 'https://www.litemobile.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (616, 'LUDING', 7, 'https://luding.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (617, 'Mail.ru', 73, 'https://www.mail.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (619, 'mamsy', 2, 'https://www.mamsy.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (620, 'MANGO', 1, 'https://www.mango.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (622, 'Marks & Spencer', 2, 'https://www.marksandspencer.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (626, 'Mastercard', 27, 'https://www.mastercard.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (627, 'MATCHESFASHION', 2, 'https://www.matchesfashion.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (629, 'McDonald''s', 25, 'https://www.mcdonalds.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (631, 'MediaMarkt', 1, 'https://www.mediamarkt.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (632, 'MEGOGO', 30, 'https://www.megogo.net/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (633, 'METRO', 7, 'https://www.metro.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (635, 'mi.com', 1, 'https://www.mi.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (639, 'MMOGA', 23, 'https://www.mmoga.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (640, 'modi', 1, 'https://www.modi.com.ua/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (642, 'MOHITO', 1, 'https://www.mohito.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (644, 'MOON-TRADE', 1, 'https://www.moon-trade.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (645, 'More.tv', 30, 'https://www.more.tv/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (647, 'MR PORTER', 2, 'https://www.mrporter.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (650, 'MYBOOK', 3, 'https://www.mybook.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (654, 'Myprotein', 9, 'https://www.myprotein.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (655, 'myToys', 11, 'https://www.mytoys.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (657, 'NETFLIX', 30, 'https://www.netflix.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (659, 'New Balance', 9, 'https://www.newbalance.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (660, 'New Yorker', 3, 'https://www.newyorker.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (663, 'Nike', 9, 'https://www.nike.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (665, 'Nintendo eShop', 1, 'https://www.nintendo.com/eshop/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (666, 'NOKIA', 1, 'https://www.nokia.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (669, 'NOTINO', 1, 'https://www.notino.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (671, 'O''STIN', 2, 'https://www.ostin.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (673, 'OkayFreedom', 6, 'https://www.okayfreedom.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (675, 'OLDI', 1, 'https://www.oldi.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (677, 'ON1', 1, 'https://www.on1.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (679, 'Onlinetours', 17, 'https://www.onlinetours.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (680, 'Oodji', 2, 'https://www.oodji.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (682, 'orby', 1, 'https://www.orby.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (683, 'Origin', 1, 'https://www.origin.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (687, 'OTUS', 22, 'https://otus.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (689, 'OZON', 1, 'https://www.ozon.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (690, 'OZON.travel', 17, 'https://www.ozon.travel/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (691, 'P&G', 13, 'https://www.pg.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (694, 'Pandao', 1, 'https://www.pandao.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (696, 'Paper Shop', 2, 'https://www.paper-shop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (698, 'PayPal', 27, 'https://www.paypal.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (699, 'Pedigree', 43, 'https://www.pedigree.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (701, 'Petshop', 15, 'https://www.petshop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (703, 'Philips', 1, 'https://www.philips.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (704, 'Pizza Hut', 25, 'https://www.pizzahut.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (708, 'PlayStation Store', 1, 'https://store.playstation.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (709, 'PLEX', 1, 'https://www.plex.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (711, 'POCO', 1, 'https://www.pocoproject.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (712, 'Polaris', 1, 'https://www.polaris.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (714, 'PREMIER', 1, 'https://www.premier.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (716, 'PRISMA', 1, 'https://www.prisma.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (718, 'ProPlan', 7, 'https://www.proplan.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (719, 'PULL&BEAR', 2, 'https://www.pullandbear.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (721, 'PUMA', 9, 'https://www.puma.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (724, 'QIWI', 79, 'https://qiwi.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (725, 'Quiksilver', 2, 'https://www.quiksilver.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (727, 'Qwertee', 2, 'https://www.qwertee.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (729, 'RANDEWOO', 1, 'https://www.randoo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (730, 'Ravenol', 12, 'https://www.ravenol.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (732, 'RBT.ru', 1, 'https://www.rbtru.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (735, 'Reebok', 9, 'https://www.reebok.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (737, 'Reima', 11, 'https://www.reima.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (739, 'Reserved', 1, 'https://www.reserved.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (740, 'Respect', 1, 'https://www.respect.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (742, 'Rockstar games', 1, 'https://www.rockstargames.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (744, 'Rowenta', 13, 'https://www.rowenta.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (747, 'Rushbe', 1, 'https://www.rushbe.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (749, 'Salomon', 27, 'https://www.salomon.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (751, 'Samsung', 1, 'https://www.samsung.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (753, 'Savetime', 1, 'https://www.savetime.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (754, 'SberDevices', 1, 'https://www.sberdevices.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (756, 'SELA', 2, 'https://www.sela.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (758, 'Sennheiser', 1, 'https://www.sennheiser.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (759, 'SEPHORA', 8, 'https://www.sephora.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (761, 'SHEIN', 2, 'https://www.shein.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (764, 'SHOPOTAM', 73, 'https://www.shopotam.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (765, 'Sidex', 1, 'https://www.sidex.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (767, 'SiNSAY', 2, 'https://www.sin-saya.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (649, 'My-shop.ru', NULL, 'https://www.my-shop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (830, 'tutu.ru', 17, NULL);
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (2, 'Авиакомпания Азимут', 12, 'https://www.azimuth.aero/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (6, 'Автодор', 12, 'https://www.guc.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (8, 'Автосуши и Автопицца', 25, 'https://avtosushi.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (11, 'Азбука Техники', 1, 'https://www.azbuka-tehniki.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (15, 'Альфа-Банк', 27, 'https://www.alfabank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (18, 'Аптека Будь здоров!', 33, 'https://www.zdorov.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (22, 'Аптека Самсон-Фарма', 33, 'https://www.samson-pharma.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (26, 'Ашан', 7, 'https://www.auchan.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (28, 'Аэроэкспресс', 12, 'https://aeroexpress.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (32, 'БИ-БИ', 1, 'https://www.bibigames.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (37, 'БОЛЬШОЕ ТВ', 1, 'https://www.bolshoetv.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (41, 'Важная Рыба', 1, 'https://vazhnaya-ryba.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (44, 'Верный', 7, 'https://vernyi.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (47, 'Винный склад', 7, 'https://winelab.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (53, 'Все инструменты', 1, 'https://vsinstrumenty.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (57, 'Высшая лига', 1, 'https://www.vysshe-liga.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (60, 'Газпромнефть', 34, 'https://www.gazpromneft.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (62, 'Галерея косметики', 8, 'https://galeriaspb.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (66, 'ДЕКАТЛОН', 9, 'https://www.decathlon.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (69, 'Делимобиль', 12, 'https://delimobil.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (73, 'Доброцен', 7, 'https://www.dobrocent.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (75, 'Доктор Слон', 1, 'https://www.doktor-slon.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (80, 'Дочки-Сыночки', 11, 'https://www.detskiysyonochki.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (769, 'Skillbox', 22, 'https://www.skillbox.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (770, 'Skillshare', 22, 'https://www.skillshare.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (772, 'SKYLUM', 1, 'https://www.skylum.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (774, 'Slamdunk', 1, 'https://www.slamdunk.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (775, 'smartChef', 13, 'https://www.smartchef.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (777, 'SoftMaker', 1, 'https://www.softmaker.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (778, 'SOKOLOV', 16, 'https://www.sokolov.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (782, 'SPB TV', 1, 'https://www.spb.tv/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (784, 'Spinningline', 1, 'https://www.spinningline.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (785, 'splice', 1, 'https://www.splice.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (787, 'Springfield', 1, 'https://www.springfield.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (789, 'START', 1, 'https://www.start.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (790, 'Steam', 1, 'https://store.steampowered.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (792, 'Steganos', 1, 'https://www.steganos.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (793, 'Stepik', 1, 'https://stepik.org/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (797, 'STREET BEAT', 1, 'https://www.streetbeat.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (799, 'Subway', 7, 'https://www.subway.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (800, 'Sunlight', 1, 'https://www.sunlight.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (802, 'SuperStep', 1, 'https://www.superstep.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (803, 'surfdome', 1, 'https://www.surfdome.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (807, 'TASTY COFFEE', 7, 'https://www.tastycoffee.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (810, 'tech INN', 1, 'https://www.techinn.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (812, 'Technopoint', 1, 'https://www.technopoint.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (813, 'Tefal', 13, 'https://www.tefal.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (816, 'TEZ TOUR', 17, 'https://www.tez-tour.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (817, 'The Body Shop', 8, 'https://www.thebodyshop.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (819, 'themeforest', 1, 'https://themeforest.net/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (822, 'Timberland', 2, 'https://www.timberland.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (823, 'Tinder', 21, 'https://www.tinder.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (825, 'TomTop', 1, 'https://www.tomtop.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (827, 'TOY.ru', 11, 'https://www.toy.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (828, 'Trainbit', 1, 'https://www.trainbit.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (832, 'TVZavr', 30, 'https://tvzavr.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (833, 'UBER', 12, 'https://www.uber.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (835, 'Udemy', 22, 'https://www.udemy.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (838, 'UNIQLO', 2, 'https://www.uniqlo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (840, 'Unreal Engine', 1, 'https://www.unrealengine.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (841, 'Ural Airlines', 12, 'https://www.uralairlines.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (843, 'usmall', 1, 'https://www.usmall.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (844, 'Utair', 12, 'https://www.utair.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (846, 'VICHY', 8, 'https://www.vichy.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (849, 'viju', 1, 'https://www.viju.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (851, 'VISA', 27, 'https://www.visa.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (853, 'VK Combo', 1, 'https://combo.vk.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (854, 'VK Play', 1, 'https://play.vk.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (809, 'tea.ru', NULL, 'https://www.tea.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (857, 'Walmart', 1, 'https://www.walmart.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (859, 'WAVES', 1, 'https://waves.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (861, 'Whirlpool', 13, 'https://www.whirlpool.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (862, 'WHOOSH', 1, 'https://whoosh.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (866, 'Wish', 1, 'https://www.wish.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (867, 'Wishmaster', 1, 'https://www.wishmaster.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (871, 'XChesserAudio', 1, 'https://www.xchesser.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (872, 'xcom-shop', 1, 'https://www.xcom-shop.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (874, 'YOTA', 1, 'https://www.yota.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (876, 'YouTube', 1, 'https://www.youtube.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (877, 'Yves Rocher', 8, 'https://www.yves-rocher.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (879, 'Zapals', 1, 'https://www.zapals.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (881, 'Zarina', 2, 'https://www.zarina.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (884, '123', 1, 'https://www.123.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (856, 'VSEMAYKI.RU', NULL, 'https://vse-mayki.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (869, 'Woot!', NULL, 'https://www.woot.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (91, 'Игровед', NULL, 'https://igroved.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (105, 'КАРО', NULL, 'https://www.karofilm.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (108, 'Киномакс', NULL, 'https://www.kinomax.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (122, 'Лента Онлайн', NULL, 'https://lenta.online/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (199, 'Почта Маркет', NULL, 'https://market.pochta.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (222, 'Сантехника Онлайн', NULL, 'https://santehnika-online.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (242, 'Спорт-Марафон', NULL, 'https://www.sport-marafon.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (347, 'AROMA-BUTIK', NULL, 'https://www.aromabutik.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (88, 'Здравсити', 33, 'https://zdravcity.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (94, 'Издательство CLEVER', 3, 'https://clever.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (97, 'Издательство Просвещение', 22, 'https://www.prosv.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (102, 'ИнструмТорг', 14, 'https://www.instrumentorg.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (110, 'Кинотеатр.ру', 30, 'https://www.kinoteatr.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (116, 'Красное&Белое', 7, 'https://krasnoeibeloe.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (120, 'Ле''Муррр', 7, 'https://www.lemurr.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (125, 'Лукойл', 12, 'https://www.lukoil.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (128, 'М.Видео', 13, 'https://www.mvideo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (130, 'Магнит Доставка', 7, 'https://dostavka.magnit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (134, 'Магнолия', 7, 'https://www.magnolia.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (137, 'Маркет 15', 1, 'https://market15.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (139, 'МАЯК гипермаркет', 7, 'https://www.mayak-gip.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (143, 'МегаФон', 28, 'https://megafon.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (146, 'МИР', 1, 'https://www.mir-shop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (148, 'Мир кораблей', 12, 'https://www.mir-korabli.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (153, 'Монетка', 13, 'https://www.monetka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (156, 'Московский зоопарк', 15, 'https://www.moscowzoo.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (160, 'МТС Music', 1, 'https://music.mts.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (162, 'МТС Travel', 17, 'https://travel.mts.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (168, 'НИЯМА', 25, 'https://www.nyama.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (171, 'Облако Mail.ru', 1, 'https://cloud.mail.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (174, 'Он и Она', 1, 'https://onona.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (177, 'ОРТЕКА', 32, 'https://orteka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (180, 'Пакет', 1, 'https://www.paket.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (182, 'Папа Джонс', 25, 'https://www.papajohns.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (185, 'Перекрёсток', 7, 'https://www.перекрёсток.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (189, 'Планета Здоровья', 8, 'https://planetazdorov.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (192, 'Пловдив', 1, 'https://www.plovdiv.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (197, 'Посуда центр', 13, 'https://posudacenter.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (203, 'Пятерочка Доставка', 7, 'https://5ka.ru/delivery/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (207, 'РеалЪ', 1, 'https://real-shop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (208, 'Ренессанс Кредит', 27, 'https://www.rencredit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (212, 'Розовый кролик', 1, 'https://pinkrose.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (216, 'Рубль Бум', 1, 'https://rubl.biz/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (219, 'С.Пудовъ', 7, 'https://s-pudov.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (228, 'СберЗвук', 30, 'https://sberzvuk.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (231, 'Светофор', 7, 'https://www.svetofor.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (234, 'СИМА-ЛЕНД', 1, 'https://www.sima-land.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (239, 'Склад Здоровья', 8, 'https://zdorovie.sberbank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (246, 'Строительный двор', 19, 'https://www.stroydvor.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (249, 'СУТОЧНО.РУ', 17, 'https://www.sutochno.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (252, 'СушиWok', 7, 'https://www.sushiwok.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (258, 'Твой дом', 5, 'https://tvoy-dom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (261, 'ТЕХНОПАРК', 1, 'https://technopark.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (264, 'ТМК', 12, 'https://www.tmk-group.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (266, 'Томат и Чеддер', 7, 'https://tomat-cheddar.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (268, 'ТРИАЛ-СПОРТ', 9, 'https://www.trial-sport.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (274, 'УРЮК', 7, 'https://www.uryuk.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (276, 'Фамилия', 1, 'https://www.familia.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (279, 'Фоксфорд', 22, 'https://foxford.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (282, 'Хваловские воды', 7, 'https://www.hvalovskievody.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (285, 'ЦЕХ 85', 25, 'https://ceh85.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (288, 'Четыре лапы', 15, 'https://www.chetyre-lapy.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (291, 'Читай город', 1, 'https://chitagorod.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (294, 'Эльдорадо', 13, 'https://eldorado.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (301, 'Ютека', 33, 'https://www.yutexa.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (303, 'Яндекс', 73, 'https://www.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (306, 'Яндекс Афиша', 18, 'https://afisha.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (309, 'Яндекс Заправки', 12, 'https://zapravki.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (312, 'Яндекс Музыка', 30, 'https://music.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (315, 'Яндекс Такси', 12, 'https://taxi.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (318, 'Яркий фотомаркет', 1, 'https://fotomarket.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (323, 'aceronline.ru', 1, 'https://www.aceronline.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (325, 'Activision', 1, 'https://www.activision.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (327, 'ADGUARD', 1, 'https://www.adguard.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (329, 'Adobe', 1, 'https://www.adobe.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (331, 'AIR GUN', 1, 'https://www.airgun.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (336, 'Amazon', 1, 'https://www.amazon.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (338, 'AMD', 1, 'https://www.amd.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (342, 'App Store', 1, 'https://www.apple.com/ru/app-store/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (349, 'Ashampoo', 13, 'https://www.ashampoo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (352, 'Asos', 2, 'https://www.asos.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (354, 'Audiomania', 1, 'https://www.audiomania.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (357, 'Author.Today', 3, 'https://www.author.today/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (486, 'Flowwow', NULL, 'https://flowwow.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (564, 'Internet Archive', NULL, 'https://archive.org/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (570, 'JD', NULL, 'https://www.jd.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (579, 'KASSIR.RU', NULL, 'https://www.kassir.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (593, 'KUPIVIP.RU', NULL, 'https://www.kupivip.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (623, 'MARVEL', NULL, 'https://www.marvel.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (362, 'Avast', 21, 'https://www.avast.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (365, 'Avira', 1, 'https://www.avira.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (367, 'B&H', 1, 'https://www.bhphotovideo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (370, 'BASK', 2, 'https://www.bask.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (374, 'BEELINE GAMING', 1, 'https://www.beeline.gaming/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (378, 'BELWEST', 2, 'https://www.belwest.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (380, 'Best Buy', 1, 'https://www.bestbuy.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (382, 'Bethesda', 1, 'https://www.bethesda.net/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (385, 'BIGtv', 1, 'https://www.bigtv.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (390, 'Board Shop №1', 9, 'https://boardshop1.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (393, 'boohoo', 2, 'https://www.boohoo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (395, 'Booking.com', 17, 'https://www.booking.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (398, 'Boxberry', 71, 'https://www.boxberry.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (401, 'Brandly', 1, 'https://www.brandly.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (404, 'bringly', 1, 'https://bringly.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (409, 'Calvin Klein', 2, 'https://www.calvinklein.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (413, 'Castrol', 4, 'https://www.castrol.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (415, 'CDEK маркет', 72, 'https://market.cdek.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (418, 'Chain reaction cycles', 1, 'https://www.chainreactioncycles.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (423, 'CMD Центр Молекулярной Диагностики', 32, 'https://www.cmd-online.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (427, 'Comixology', 3, 'https://www.comixology.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (430, 'CONCEPT CLUB', 2, 'https://www.conceptclub.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (431, 'COZY HOME', 5, 'https://www.cozyhome.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (432, 'Creation Watches', 1, 'https://www.creationwatches.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (437, 'CULTIZM', 1, 'https://www.cultizm.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (440, 'DC Shoes', 9, 'https://www.dcs.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (444, 'DESIGNCUTS', 1, 'https://www.designcuts.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (447, 'DHgate', 1, 'https://www.dhgate.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (449, 'DJSTORE', 1, 'https://www.djstore.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (451, 'DNS', 1, 'https://www.dns.com.au/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (454, 'dr.head', 1, 'https://www.drhead.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (459, 'DROP', 1, 'https://www.drop.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (461, 'eBay', 1, 'https://www.ebay.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (463, 'ECO MARKET', 1, 'https://www.eco-market.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (466, 'Electrolux', 13, 'https://www.electrolux.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (472, 'eneba', 1, 'https://www.eneba.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (474, 'Epic Games Store', 23, 'https://www.epicgames.com/store/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (477, 'Fanatical', 1, 'https://www.fanatical.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (480, 'FastTech', 1, 'https://www.fasttech.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (488, 'FoodBand', 7, 'https://foodband.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (491, 'Fossil', 1, 'https://www.fossil.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (493, 'G2A.com', 1, 'https://www.g2a.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (495, 'Galaxystore', 1, 'https://www.galaxystore.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (500, 'Gamesplanet', 1, 'https://www.gamesplanet.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (503, 'GAP', 2, 'https://www.gap.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (505, 'GearBest', 1, 'https://www.gearbest.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (508, 'Geekbuying', 1, 'https://www.geekbuying.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (511, 'Gipfel', 1, 'https://www.gipfel.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (513, 'Giztop', 1, 'https://www.giztop.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (518, 'Gloria Jeans', 2, 'https://www.gloriajeans.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (521, 'Google Play Store', 1, 'https://play.google.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (524, 'Green Mama', 8, 'https://www.greenmama.com.au/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (525, 'Green Man Gaming', 1, 'https://www.greenmangaming.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (529, 'GUESS', 2, 'https://www.guess.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (532, 'Haier', 13, 'https://www.haier.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (537, 'HENDERSON', 2, 'https://www.henderson.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (539, 'Hobby Games', 23, 'https://www.hobbygames.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (541, 'HOLODILNIK.RU', 1, 'https://www.holodilnik.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (545, 'HONOR', 1, 'https://www.honor.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (550, 'Huawei', 1, 'https://www.huawei.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (552, 'HUGGIES', 11, 'https://www.huggies.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (554, 'igooods', 73, 'https://www.igooods.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (557, 'INCANTO', 2, 'https://www.incanto.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (561, 'Inspector gadgets', 1, 'https://www.inspectorgadgets.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (567, 'itch.io', 23, 'https://itch.io/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (572, 'JOMASHOP', 1, 'https://www.jomashop.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (575, 'KANZLER', 2, 'https://www.kanzler.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (577, 'KARI', 1, 'https://www.kari.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (583, 'KFC и ROSTIC''S', 25, 'https://www.kfc.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (588, 'KNS', 1, 'https://www.kns.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (590, 'KomfortBT.ru', 1, 'https://www.komfortbt.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (595, 'L''Oreal Paris', 8, 'https://www.lorealparis.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (598, 'Lacoste', 2, 'https://www.lacoste.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (602, 'Lassie', 11, 'https://www.lassie.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (604, 'LEGO Россия', 11, 'https://lego.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (607, 'LESTA Games', 1, 'https://www.lesta-games.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (610, 'LEVI''S', 2, 'https://www.levis.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (615, 'LOVE REPUBLIC', 2, 'https://loverepublic.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (618, 'MAKEUP', 8, 'https://www.makeup.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (621, 'MANGO outlet', 2, 'https://www.mango.com/outlet');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (625, 'Massimo Dutti', 2, 'https://www.massimodutti.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (628, 'MaxGaming', 1, 'https://www.maxgaming.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (630, 'MED-МАГАЗИН.RU', 32, 'https://med-magazin.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (653, 'MyPostcard', NULL, 'https://www.mypostcard.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (3, 'Авиакомпания Победа', 12, 'https://www.pobeda.aero/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (20, 'Аптека Озерки', 33, 'https://www.ozerki.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (33, 'Библио Глобус', 17, 'https://www.biblioglobus.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (49, 'ВкусВилл', 7, 'https://vkusvill.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (58, 'Газпром Бонус (бывший Огонь)', 1, 'https://gazprombonus.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (76, 'Домино Пицца', 7, 'https://www.domino-pizza.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (89, 'Золотое Яблоко', 8, 'https://zolotoyapple.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (638, 'Mixit', 2, 'https://www.mixit.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (643, 'MOLNIA', 1, 'https://www.molnia.com.ua/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (646, 'mothercare', 11, 'https://www.mothercare.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (648, 'My Food', 7, 'https://www.myfood.com.ua/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (651, 'MYBOX', 1, 'https://www.mybox.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (658, 'netPrint.ru', 1, 'https://www.netprint.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (662, 'NewMart', 1, 'https://www.newmart.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (664, 'Nils', 1, 'https://www.nils.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (667, 'NordVPN', 1, 'https://www.nordvpn.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (672, 'OBI', 10, 'https://www.obi.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (674, 'Okko', 30, 'https://www.okko.tv/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (676, 'Ollis', 1, 'https://www.ollis.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (678, 'ONLINE-SAMSUNG', 1, 'https://www.online-samsung.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (681, 'OPPO', 1, 'https://www.oppo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (684, 'ORMATEK', 5, 'https://www.ormatek.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (686, 'Otello', 1, 'https://www.otello.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (692, 'padmate', 1, 'https://www.padmate.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (695, 'Pandora', 1, 'https://www.pandora.net/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (697, 'Paragon Software', 1, 'https://www.paragon-software.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (700, 'Pepper', 1, 'https://www.pepper.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (702, 'Pharmacosmetica.ru', 8, 'https://www.pharmacosmetica.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (705, 'PIZZA SUSHI WOK', 25, 'https://www.pizzasushiwok.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (707, 'PlayStation', 1, 'https://www.playstation.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (710, 'Plugin Boutique', 1, 'https://www.pluginboutique.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (715, 'PRINT BAR', 25, 'https://www.printbar.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (717, 'Pro:Direct Select', 9, 'https://www.prodirectselect.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (720, 'pult.ru', 1, 'https://www.pult.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (722, 'Puzzle English', 22, 'https://puzzleenglish.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (726, 'QUKE.RU', 1, 'https://quke.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (731, 'Razer', 1, 'https://www.razer.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (733, 'Re-Store', 1, 'https://www.restore.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (736, 'Reebok USA', 9, 'https://www.reebok.com/us/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (738, 'RENDEZ-VOUS', 17, 'https://www.rendez-vous.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (743, 'Rosegal', 2, 'https://www.rosegal.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (745, 'Royal Canin', 7, 'https://www.royalcanin.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (748, 'S7 Airlines', 12, 'https://www.s7.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (750, 'Samsonite', 17, 'https://www.samsonite.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (755, 'Seed4me VPN', 1, 'https://seed4me.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (757, 'SELGROS Cash&Carry', 7, 'https://www.selgros.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (760, 'SharewareOnSale', 1, 'https://www.sharewareonsale.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (763, 'SHiFT Gearbox Software', 1, 'https://www.shiftgearbox.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (766, 'simplewine', 7, 'https://www.simplewine.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (771, 'skyeng', 22, 'https://www.skyeng.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (773, 'Skyscanner', 17, 'https://www.skyscanner.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (776, 'Sneakerhead', 2, 'https://www.sneakerhead.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (779, 'SONY', 1, 'https://www.sony.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (781, 'SPAR', 7, 'https://www.spar.co.uk/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (786, 'Spotify', 1, 'https://www.spotify.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (788, 'Starbucks', 25, 'https://www.starbucks.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (791, 'Steelseries', 1, 'https://www.steelseries.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (794, 'StickerMule', 6, 'https://stickermule.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (796, 'Storytel', 3, 'https://www.storytel.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (801, 'SUNSKY', 1, 'https://www.sunsky.com.hk/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (804, 'Synergetic', 1, 'https://www.synergetic.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (806, 'Taobao', 1, 'https://www.taobao.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (808, 'TATNEFT', 34, 'https://www.tatneft.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (811, 'TECHNOMART', 1, 'https://www.technomart.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (814, 'TELE2', 28, 'https://www.tele2.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (818, 'THE OUTNET', 2, 'https://www.theoutnet.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (821, 'TIDAL', 30, 'https://www.tidal.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (824, 'Tom Tailor', 2, 'https://www.tom-tailor.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (826, 'Top Computer', 1, 'https://www.top-computer.de/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (834, 'Ubisoft', 1, 'https://www.ubisoft.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (836, 'UltraTrade', 1, 'https://ultratrade.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (839, 'United Colors of Benetton', 2, 'https://www.unitedcolorsofbenetton.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (842, 'URBANTIGER', 1, 'https://www.urbantiger.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (845, 'VANS', 9, 'https://www.vans.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (850, 'VIPAVENUE', 1, 'https://www.vipavenue.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (852, 'VIVO', 1, 'https://www.vivo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (855, 'VK Музыка', 30, 'https://music.vk.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (858, 'Wargaming', 23, 'https://www.wargaming.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (860, 'Westland', 1, 'https://westland.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (865, 'WINK', 1, 'https://www.wink.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (868, 'Wizz Air', 12, 'https://www.wizzair.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (870, 'XBOX Store', 1, 'https://www.xbox.com/en-US/store/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (873, 'YOOX', 2, 'https://www.yoox.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (875, 'YouTravel.me', 17, 'https://www.youtravel.me/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (878, 'Zaful', 2, 'https://www.zaful.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (883, 'ZENDEN', 95, 'https://www.zenden.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (106, 'Карусель', 7, 'https://www.karusel.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (123, 'Леруа Мерлен', 10, 'https://www.leroymerlin.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (132, 'Магнит Маркет (бывший KazanExpress)', 1, 'https://market.magnit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (136, 'МаксидоМ', 19, 'https://www.maksimodom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (149, 'Мир охоты', 9, 'https://www.mir-ohota.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (157, 'Московский ювелирный завод', 16, 'https://www.msk-zoloto.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (181, 'Пан Чемодан', 17, 'https://www.pan-chemodan.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (198, 'Почта Банк', 27, 'https://www.pochtabank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (213, 'Росбанк', 27, 'https://www.rosbank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (226, 'СБЕР МОБАЙЛ', 28, 'https://www.sberbank.ru/mobil/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (236, 'СИТИДРАЙВ', 12, 'https://www.citydrive.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (247, 'СТРОЙЛАНДИЯ', 19, 'https://www.stroylandia.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (263, 'Тинькофф', 27, 'https://www.tinkoff.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (275, 'Утконос', 7, 'https://www.utkonos.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (284, 'Хоум Банк', 27, 'https://www.homecredit.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (302, 'Якитория', 25, 'https://www.yakitoriya.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (314, 'Яндекс Путешествия', 17, 'https://travel.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (326, 'ACUVUE', 8, 'https://www.acuitybrands.com/brands/acuitybrands/acu-vu/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (355, 'Ausdom', 1, 'https://www.ausdom.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (364, 'aviasales', 17, 'https://www.aviasales.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (377, 'BelkaCar', 12, 'https://belkacar.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (388, 'Black Star Burger', 25, 'https://blackstarburger.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (400, 'Brainwavz Audio', 1, 'https://www.brainwavz.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (416, 'CDEK.Shopping', 71, 'https://www.cdek.ru/shopping/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (428, 'computeruniverse', 1, 'https://www.computeruniverse.net/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (434, 'Crocs', 95, 'https://www.crocs.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (441, 'DealeXtreme', 1, 'https://www.dealextreme.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (457, 'Dresslily', 2, 'https://www.dresslily.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (470, 'Emirates', 56, 'https://www.emirates.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (482, 'FIT Service', 1, 'https://www.fitservice.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (496, 'GamePark', 1, 'https://www.gamepark.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (509, 'GeForce Now', 1, 'https://www.geforcenow.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (522, 'Google Store', 1, 'https://www.google.com/store/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (535, 'Hearthstone', 23, 'https://www.hearthstone.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (548, 'HoYoverse', 1, 'https://www.hoyoverse.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (562, 'INSTANT GAMING', 1, 'https://www.instantgaming.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (576, 'KARCHER', 13, 'https://www.karcher.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (586, 'KINGUIN', 1, 'https://www.kinguin.net/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (601, 'LAPTOP.RU', 1, 'https://www.laptop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (613, 'Lingualeo', 1, 'https://www.lingualeo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (624, 'Mascotte', 2, 'https://www.mascotte.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (637, 'Microsoft Store', 1, 'https://www.microsoft.com/en-us/store/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (652, 'Mynamebook.ru', 3, 'https://www.mynamebook.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (670, 'NYX', 1, 'https://www.nyxcosmetics.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (685, 'Ostrovok.ru', 17, 'https://www.ostrovok.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (693, 'Panasonic', 1, 'https://www.panasonic.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (706, 'Play Today', 1, 'https://www.playtoday.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (723, 'Puzzle Movies', 30, 'https://puzzlemovies.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (734, 'Redmond', 1, 'https://www.redmond.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (746, 'Runtastic', 9, 'https://www.runtastic.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (762, 'Shell', 12, 'https://www.shell.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (829, 'travelata.ru', 17, NULL);
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (1, 'Авиакомпания Red Wings', 12, 'https://www.redwings.aero/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (35, 'Билайн', 28, 'https://www.beeline.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (50, 'ВкусМил от ВкусВилл', 7, 'https://vkusmil.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (78, 'Домотехника', 13, 'https://www.domotehnika.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (780, 'SONY Centre', 1, 'https://www.sonycentre.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (795, 'Sticky Password', 21, 'https://stickypassword.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (805, 'TanukiFamily', 1, 'https://www.tanukifamily.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (820, 'Thomas Munz', 1, 'https://www.thomasmunz.de/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (837, 'Umka Mall', 1, 'https://umkamall.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (848, 'video-shoper.ru', 1, 'https://www.video-shoper.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (864, 'Windscribe VPN', 21, 'https://www.windscribe.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (882, 'Zavvi', 1, 'https://www.zavvi.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (83, 'Европа Супермаркеты', 7, 'https://www.europasupermarket.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (114, 'Кораблик', 11, 'https://www.korablik.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (135, 'МАКСИ', 1, 'https://www.maximarket.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (150, 'Мир танков', 23, 'https://www.mir-tankov.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (165, 'Нетология', 22, 'https://education.yandex.ru/nebolshaya-shkola/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (194, 'Подружка', 8, 'https://www.podrygka.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (225, 'СБЕР', 27, 'https://www.sberbank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (237, 'Ситилинк', 1, 'https://citilink.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (254, 'Такси Максим', 60, 'https://taximaxim.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (271, 'УБРиР (Уральский банк реконструкции и развития)', 27, 'https://www.urbank.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (296, 'ЮMoney (бывший Яндекс.Деньги)', 27, 'https://money.yandex.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (333, 'AliExpress', 1, 'https://www.aliexpress.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (343, 'AppGallery', 1, 'https://www.huawei.com/ru/appgallery/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (359, 'Autodesk', 21, 'https://www.autodesk.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (372, 'Beauty Depot', 8, 'https://www.beautydepot.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (387, 'Bitdefender', 21, 'https://www.bitdefender.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (406, 'BURGER KING', 25, 'https://www.burgerking.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (420, 'Cirque du Soleil', 18, 'https://www.cirquedusoleil.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (442, 'DEEZER', 30, 'https://www.deezer.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (456, 'dressINN', 2, 'https://www.dressinn.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (468, 'Elementaree', 7, 'https://www.elementaree.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (483, 'FitStars', 9, 'https://fitstars.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (498, 'Games2Gether', 1, 'https://www.games2gether.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (515, 'Glarysoft', 21, 'https://www.glarysoft.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (534, 'Headspace', 1, 'https://www.headspace.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (547, 'House', 1, 'https://www.house.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (559, 'INDIEGOGO', 1, 'https://www.indiegogo.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (585, 'Kiko Milano', 8, 'https://www.kikomilano.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (600, 'LANCOME', 8, 'https://www.lancome-usa.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (612, 'LightInTheBox', 1, 'https://www.lightinthebox.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (634, 'Mi-Shop', 1, 'https://www.mi-shop.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (636, 'Microless', 1, 'https://www.microless.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (641, 'Modis', 1, 'https://www.modis.com.ua/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (656, 'Nespresso', 13, 'https://www.nespresso.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (668, 'Nordwind Airlines', 12, 'https://www.nordwindairlines.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (688, 'Overkill Software', 23, 'https://www.overkillsoftware.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (713, 'Postando', 1, 'https://www.postando.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (728, 'RALF RINGER', 2, 'https://www.ralf-ringer.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (741, 'Rich Family', 1, 'https://www.richfamily.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (752, 'Samsungstore', 1, 'https://www.samsungstore.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (768, 'Skechers', 95, 'https://www.skechers.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (783, 'SpeckyFourEyes', 1, 'https://www.speckyfoureyes.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (798, 'Streetball', 9, 'https://www.streetball.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (815, 'TempusShop.ru', 1, 'https://www.tempusshop.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (831, 'TVOЯ Pizza', 7, 'https://tvopizza.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (847, 'Victoira''s Secret', 2, 'https://www.victoriassecret.com/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (863, 'Wildberries', 1, 'https://www.wildberries.ru/');
INSERT INTO public.company (id, name, category_id, url) OVERRIDING SYSTEM VALUE VALUES (880, 'ZARA', 2, 'https://www.zara.com/');


--
-- Data for Name: execution; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: promo_code; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: raw_gpt_company; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: raw_video_data; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: youtube_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (1, '@KrayzmanOlga', 'UCYe1xFP0gW3xlHT6_lU6KOw');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (2, '@telektelek', 'UCkPoOrQ3fOpQnDIMkePbwXw');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (3, '@youtubenaya', 'UCxy9Nq_dYRXELPVlsjGXPAw');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (4, '@alinamuradimova', 'UCVALO-Jz4GponxZDbSqxvgg');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (5, '@lizashatilova', 'UC3TZnGuFJgCyDCzDC2h9GFA');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (6, '@sobchak', 'UCvQXaJTjA3jRucTKN4CGiwg');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (7, '@toplesofficial', 'UC2Ru64PHqW4FxoP0xhQRvJg');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (8, '@shklovsky', 'UCUmeLZofGMhO5lVOHUEUU2A');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (9, '@alinamuradimova', 'UCVALO-Jz4GponxZDbSqxvgg');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (10, '@UncleShurik', 'UCiYq2NfNeXLKOKmFzHGkYdA');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (11, '@hellyadore', 'UCunZW9B-RPs3_tXqV_dfWgA');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (12, '@johnnydetka', 'UCPQ7xu31PMF-4UsWuKBAf4Q');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (13, '@mariasilanteva', 'UCxFAd4euTwJyP4zHdVAVZMQ');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (14, '@NadinStrelets', 'UCF2E-9dtRrpl2aMv3i0_6BA');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (15, '@KatyaKonasova', 'UCh29SdTOPdjBb-n3Vop1lYg');
INSERT INTO public.youtube_channel (id, name, channel_id) OVERRIDING SYSTEM VALUE VALUES (16, '@MINAEVLIVE', 'UCeKCxQDv6lWDSzuqUXGtMRA');


--
-- Name: access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.access_token_id_seq', 10, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 100, true);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_id_seq', 885, true);


--
-- Name: execution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.execution_id_seq', 1, false);


--
-- Name: promo_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promo_code_id_seq', 1, false);


--
-- Name: promo_code_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promo_code_id_seq1', 1, false);


--
-- Name: raw_gpt_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raw_gpt_company_id_seq', 1, false);


--
-- Name: youtube_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.youtube_channel_id_seq', 16, true);


--
-- Name: access_token access_token_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_pk PRIMARY KEY (id);


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: company company_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pk PRIMARY KEY (id);


--
-- Name: execution execution_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.execution
    ADD CONSTRAINT execution_pk PRIMARY KEY (id);


--
-- Name: raw_video_data id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_video_data
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- Name: promo_code promo_code_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_code
    ADD CONSTRAINT promo_code_pk PRIMARY KEY (id);


--
-- Name: raw_gpt_company raw_gpt_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_gpt_company
    ADD CONSTRAINT raw_gpt_pk PRIMARY KEY (id);


--
-- Name: youtube_channel youtube_channel_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_channel
    ADD CONSTRAINT youtube_channel_pk PRIMARY KEY (id);


--
-- Name: company category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- PostgreSQL database dump complete
--

