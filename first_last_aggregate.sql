-- Create a function that always returns the first non-NULL item
CREATE OR REPLACE FUNCTION public.first_agg ( anyelement, anyelement )
    RETURNS anyelement LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS $$
SELECT $1;
$$;

-- And then wrap an aggregate around it
CREATE AGGREGATE public.first(anyelement) (
    sfunc = public.first_agg,
    stype = anyelement,
    parallel = SAFE
);

-- Create a function that always returns the last non-NULL item
CREATE OR REPLACE FUNCTION public.last_agg ( anyelement, anyelement )
    RETURNS anyelement LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS $$
SELECT $2;
$$;

-- And then wrap an aggregate around it
CREATE AGGREGATE public.last (anyelement) (
    sfunc    = public.last_agg,
    stype    = anyelement,
    parallel = safe
);
