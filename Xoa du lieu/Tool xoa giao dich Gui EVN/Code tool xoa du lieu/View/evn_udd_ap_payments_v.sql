create view evn_udd_ap_payments_v as
select ac.check_id,
       ac.check_number,
       ac.description,
       ap_checks_pkg.get_posting_status(ac.check_id) as posting_status,
       ac.check_date,
       c.branch_code
  from ap.ap_checks_all ac, FPT_branches_v c
 where ac.org_id = c.org_id 
   and ap_checks_pkg.get_posting_status(ac.check_id) <> 'Y';
