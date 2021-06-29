

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.categories DISABLE TRIGGER ALL;

INSERT INTO public.categories (id, title) VALUES ('547b5e31-931e-4cd8-a84c-29579ec9690f', 'Cars');


ALTER TABLE public.categories ENABLE TRIGGER ALL;


ALTER TABLE public.questions DISABLE TRIGGER ALL;

INSERT INTO public.questions (id, title, description, category_id) VALUES ('d30f0845-0fdb-413a-8b69-395e64b42fff', 'Tire Size', 'What Is The Size Of The BMW I8 Tire?', '547b5e31-931e-4cd8-a84c-29579ec9690f');


ALTER TABLE public.questions ENABLE TRIGGER ALL;


