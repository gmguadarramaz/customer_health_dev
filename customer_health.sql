WITH base AS (

  SELECT
    pli.product_line_instance_name AS account_name,
    pli.product_line,
    pli.curr_fy_cpq_arr_with_cuf_amt --# Annual Recurring Revenue
    pli.am_health_score AS am_pli_health,
    --# Health Score
    pli.curr_fy_rnwl_probability,
    pli.curr_fy_rnwl_notes,
    pli.next_fy_rnwl_probability,
    pli.next_fy_rnwl_notes,
    pli.champion_engagement_score,

  --# To be Introduced:
  --rev.usd_amt AS annual_recurring_revenue, 
  --subs.annual_recurr_rev_amt AS subscription_arr_amt,
  --pli.previous_fy_cpq_arr_amt,
  --pli.assurehire_arr_spent_amt,
  --rev.seg_end_date AS next_renewal_date, --# Next Renewal Date
  --pli.sbr_notes, --# When was the last SBR 
  --# Most Recent Quality Interaction
  --# Practice Director
  --pli.spend_vs_forecasted_pct,
  --# Number of Use Cases
  --# Solution is Working as Expected/Required

  FROM {{ ref('fact_curr_product_line_instances') }} AS pli

  --LEFT JOIN {{ ref('fact_curr_subscriptions') }} AS subs
  --ON
  --subs.company_fk = pli.company_fk
  --AND subs.product_line = pli.product_line

  --LEFT JOIN {{ ref('fact_recurring_revenue') }} AS rev
  --ON
  --rev.company_fk = pli.company_fk
  --AND rev.business_unit_code = pli.product_line
  --AND rev.recurr_rev_period = 'Annual'
  --AND rev.recurr_rev_type = 'Current'

)

SELECT *
FROM base
