
WITH base AS (

  SELECT
    pli.product_line_instance_name AS account_name,
    pli.product_line,
    pli.curr_fy_cpq_arr_with_cuf_amt,
    pli.am_health_score AS am_pli_health,
    pli.curr_fy_rnwl_probability,
    pli.curr_fy_rnwl_notes,
    pli.next_fy_rnwl_probability,
    pli.next_fy_rnwl_notes,
    pli.champion_engagement_score

  FROM {{ ref('fact_curr_product_line_instances') }} AS pli

)

SELECT *
FROM base
