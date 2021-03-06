create or replace view evn_cancelled_invoice_v as
select ai.invoice_id,
       ai.invoice_num,
       ai.description as invoice_desc,
       ai.org_id,
       v.branch_code as parent_company_code,
       v.branch_name
  from ap.ap_invoices_all ai, fpt_branches_v v
 where ai.org_id = v.org_id
   and ai.cancelled_date is not null
   and apps.ap_invoices_pkg.get_posting_status(ai.invoice_id) not in
       ('P', 'Y');
