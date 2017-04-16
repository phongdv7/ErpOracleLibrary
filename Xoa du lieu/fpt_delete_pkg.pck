﻿create or replace package evn_delete_pkg is

  -- Author  : PhongDV2
  -- Created : 15/12/2016 1:46:48 PM
  -- Purpose : 

  /*
  1. Xoa AP Unvalidated Invoice
  + Chưa Validate (Status <> Validated)
  + Chưa hạch toán (Accounted = No)
  */
  procedure req_ap_del_unvalidated_invoice(errbuf         out nocopy varchar2,
                                           retcode        out nocopy varchar2,
                                           p_company_code varchar2,
                                           p_invoice_id   number);
  -- Xoa AP invoice cancelled --> Ham goi tren request
  ---------------------------------------
  procedure req_ap_cancelled_invoice(errbuf         out nocopy varchar2,
                                     retcode        out nocopy varchar2,
                                     p_company_code varchar2,
                                     p_invoice_id   number);
  -- Xoa AP Payment --> Ham goi tren request
  ---------------------------------------                           
  procedure req_ap_payment(errbuf         out nocopy varchar2,
                           retcode        out nocopy varchar2,
                           p_company_code varchar2,
                           p_check_id     number);
  --Xoa AR Transaction --> Ham goi tren request
  ---------------------------------------
  procedure req_ar_transaction(errbuf         out nocopy varchar2,
                               retcode        out nocopy varchar2,
                               p_company_code varchar2,
                               p_trx_id       number);
  --Xoa AR Receipt --> Ham goi tren request
  ---------------------------------------
  procedure req_ar_receipt(errbuf         out nocopy varchar2,
                           retcode        out nocopy varchar2,
                           p_company_code varchar2,
                           p_receipt_id   number);
  procedure one_invoice(p_invoice_id number);
  procedure one_payment(p_check_id number);
  procedure one_ar_trans(p_trx_id number);
  procedure one_ar_receipt(p_receipt_id number);
  function delete_xla(p_application_id number,
                      p_entity_code    varchar2,
                      p_transaction_id number) return boolean;
end evn_delete_pkg;
/
create or replace package body evn_delete_pkg is

  /*
  PhongDV2 - 1. Xoa AP Unvalidated Invoice --> Ham goi tren request
  + Chưa Validate (Status <> Validated)
  + Chưa hạch toán (Accounted = No)
  */
  ---------------------------------------
  procedure req_ap_del_unvalidated_invoice(errbuf         out nocopy varchar2,
                                           retcode        out nocopy varchar2,
                                           p_company_code varchar2,
                                           p_invoice_id   number) is
    v_count number;
    --Kiem Thanh: danh sach cac invoice can xoa                       
    cursor c_invoice is
      select v.invoice_id
        from evn_invoice_not_validated_v v
       where (v.parent_company_code = p_company_code or
             p_company_code is null)
         and (v.invoice_id = p_invoice_id or p_invoice_id is null);
  begin
    v_count := 0;
    -- xoa tung invoice
    for r in c_invoice loop
      one_invoice(r.invoice_id);
      v_count := v_count + 1;
    end loop;
    commit;
  
    if v_count = 0 and p_invoice_id is not null then
      write_output('Invoice khong duoc xoa');
    end if;
  exception
    when others then
      dbms_output.put_line('Error:' || sqlerrm);
      errbuf  := substr(sqlerrm, 2000);
      retcode := 2;
      rollback;
  end;

  -- Xoa AP Invoice cancelled --> Ham goi tren request
  -- PhongDv2 update 15/12/2016
  ---------------------------------------
  procedure req_ap_cancelled_invoice(errbuf         out nocopy varchar2,
                                     retcode        out nocopy varchar2,
                                     p_company_code varchar2,
                                     p_invoice_id   number) is
    --Kiem Thanh: danh sach cac invoice can xoa                       
    cursor c_invoice is
      select v.invoice_id
        from evn_cancelled_invoice_v v
       where (v.parent_company_code = p_company_code or
             p_company_code is null)
         and (v.invoice_id = p_invoice_id or p_invoice_id is null);
  begin
    -- xoa tung invoice
    for r in c_invoice loop
      one_invoice(r.invoice_id);
    end loop;
    commit;
  exception
    when others then
      dbms_output.put_line('Error:' || sqlerrm);
      errbuf  := substr(sqlerrm, 2000);
      retcode := 2;
      rollback;
  end;

  -- Kiem Thanh: Xoa AP Payment --> Ham goi tren request
  ---------------------------------------
  procedure req_ap_payment(errbuf         out nocopy varchar2,
                           retcode        out nocopy varchar2,
                           p_company_code varchar2,
                           p_check_id     number) is
    cursor c_check is
      select v.check_id
        from evn_payment_need_delete_v v
       where (v.parent_company_code = p_company_code or
             p_company_code is null)
         and (v.check_id = p_check_id or p_check_id is null);
  begin
    --xoa tung payment
    for r in c_check loop
      one_payment(r.check_id);
    end loop;
  
  exception
    when others then
      dbms_output.put_line('Error:' || sqlerrm);
      errbuf  := substr(sqlerrm, 2000);
      retcode := 2;
  end;

  -- Kiem Thanh: Xoa AR Transaction --> Ham goi tren request
  -- Chi cho phep xoa tung giao dich
  -- Phai check ky truoc khi xoa
  -- Chua phe duyet, phai go het app
  ---------------------------------------
  procedure req_ar_transaction(errbuf         out nocopy varchar2,
                               retcode        out nocopy varchar2,
                               p_company_code varchar2,
                               p_trx_id       number) is
    cursor c_trans is
      select v.customer_trx_id
        from evn_ar_draft_transaction v
       where (v.branch_code = p_company_code or
             p_company_code is null)
         and (v.customer_trx_id = p_trx_id or p_trx_id is null);
  begin
    --Xoa tung transaction
    for r in c_trans loop
      one_ar_trans(p_trx_id);
    end loop;
  exception
    when others then
      dbms_output.put_line('Error:' || sqlerrm);
      errbuf  := substr(sqlerrm, 2000);
      retcode := 2;
  end;

  -- Kiem Thanh: Xoa AR Receipt 
  --> Ham goi tren request
  ---------------------------------------
  procedure req_ar_receipt(errbuf         out nocopy varchar2,
                           retcode        out nocopy varchar2,
                           p_company_code varchar2,
                           p_receipt_id   number) is
    cursor c_receipt is
      select t.receipt_number, t.cash_receipt_id
        from evn_ar_receipt_delete_v t
       where (t.branch_code = p_company_code or p_company_code is null)
         and (t.cash_receipt_id = p_receipt_id or p_receipt_id is null);
  begin
    -->> xoa giao dich reversed , chua hach toan Final
    for rs in c_receipt loop
      one_ar_receipt(p_receipt_id => rs.cash_receipt_id);
    end loop;
  
  exception
    when others then
      dbms_output.put_line('Error:' || sqlerrm);
      errbuf  := substr(sqlerrm, 2000);
      retcode := 2;
  end;
  -- Delete one Invoice  
  --------------------------------------------
  procedure one_invoice(p_invoice_id number) is
    v_row_id      varchar2(250);
    v_invoice_num varchar2(250);
    v_flag        boolean;
  begin
    -- Lay thong tin Invoice
    begin
      select ai.rowid, ai.invoice_num
        into v_row_id, v_invoice_num
        from ap.ap_invoices_all ai
       where ai.invoice_id = p_invoice_id
         and rownum = 1;
    exception
      when others then
        write_log(v_invoice_num || ': Get ROWID fail.');
        return;
    end;
  
    v_flag := delete_xla(p_application_id => 200,
                         p_entity_code    => 'AP_INVOICES',
                         p_transaction_id => p_invoice_id);
    if not v_flag then
      write_log(v_invoice_num || ': Delete from XLA fail.');
    end if;
    /*Backup truoc khi xoa*/
    --ap_invoice_distributions_all +
    insert into backup.evn_ap_inv_distributions_all
      select *
        from ap_invoice_distributions_all aid
       where aid.invoice_id = p_invoice_id;
    --ap_invoice_lines_all +
    insert into backup.evn_ap_invoice_lines_all
      select *
        from ap_invoice_lines_all ail
       where ail.invoice_id = p_invoice_id;
    --ap_payment_schedules_all
    insert into backup.evn_ap_payment_schedules_all
      select *
        from ap_payment_schedules_all aps
       where aps.invoice_id = p_invoice_id;
    --ap_holds_all +
    insert into backup.evn_ap_holds_all
      select * from ap_holds_all ah where ah.invoice_id = p_invoice_id;
    -- ap_self_assessed_tax_dist_all
    insert into backup.evn_ap_self_assessed_tax_dist
      select *
        from ap_self_assessed_tax_dist_all
       where invoice_id = p_invoice_id;
    --ap_invoices_all +
    insert into backup.evn_ap_invoices_all
      select * from ap_invoices_all where rowid = v_row_id;
    --Ap_Invoice_Lines_Interface
    insert into backup.evn_ap_invoice_lines_interface
      select *
        from ap_invoice_lines_interface
       where invoice_id = p_invoice_id;
    --Ap_Allocation_Rule_Lines
    insert into backup.evn_ap_allocation_rule_lines
      select *
        from ap_allocation_rule_lines
       where invoice_id = p_invoice_id;
    --Ap_Allocation_Rules
    insert into backup.evn_ap_allocation_rules
      select * from ap_allocation_rules where invoice_id = p_invoice_id;
    --Zx_Lines
    insert into backup.evn_zx_lines
      select * from zx_lines where trx_id = p_invoice_id;
    --Zx_Lines_Summary
    insert into backup.evn_zx_lines_summary
      select * from zx_lines_summary where trx_id = p_invoice_id;
    --Zx_Rec_Nrec_Dist
    insert into backup.evn_zx_rec_nrec_dist
      select * from zx_rec_nrec_dist where trx_id = p_invoice_id;
    --Zx_Lines_Det_Factors
    insert into backup.evn_zx_lines_det_factors
      select * from zx_lines_det_factors where trx_id = p_invoice_id;
    --
  
    /* Xoa AP Invoice */
    ap_ai_table_handler_pkg.delete_row(v_row_id, 'APXINWKB');
  
    write_log(v_invoice_num || ': Delete successfully.');
  
  end one_invoice;

  -- Delete one Payment  
  --------------------------------------------
  procedure one_payment(p_check_id number) is
    v_flag         boolean;
    v_check_number varchar2(250);
  begin
  
    select ac.check_number
      into v_check_number
      from ap.ap_checks_all ac
     where ac.check_id = p_check_id;
  
    -- Xoa ben XLA    
    v_flag := delete_xla(p_application_id => 200,
                         p_entity_code    => 'AP_PAYMENTS',
                         p_transaction_id => p_check_id);
    if not v_flag then
      write_log(v_check_number || ': Delete from XLA fail.');
      rollback;
      return;
    end if;
  
    -- Invoice payment    
    insert into backup.evn_ap_invoice_payments_all
      select *
        from ap.ap_invoice_payments_all aip
       where aip.check_id = p_check_id;
  
    delete from ap.ap_invoice_payments_all aip
     where aip.check_id = p_check_id;
  
    -- Payment history distribution
    insert into backup.evn_ap_payment_hist_dists
      select *
        from ap.ap_payment_hist_dists phd
       where phd.payment_history_id in
             (select p.payment_history_id
                from ap.ap_payment_history_all p
               where p.check_id = p_check_id);
  
    delete ap.ap_payment_hist_dists phd
     where phd.payment_history_id in
           (select p.payment_history_id
              from ap.ap_payment_history_all p
             where p.check_id = p_check_id);
  
    -- Payment history
    insert into backup.evn_ap_payment_history_all
      select *
        from ap.ap_payment_history_all ph
       where ph.check_id = p_check_id;
  
    delete from ap.ap_payment_history_all ph
     where ph.check_id = p_check_id;
  
    -- Check 
    insert into backup.evn_ap_checks_all
      select * from ap.ap_checks_all ac where ac.check_id = p_check_id;
  
    delete from ap.ap_checks_all ac where ac.check_id = p_check_id;
  
    commit;
  
    write_log(v_check_number || ': Delete successfully.');
  
  end one_payment;

  -- Delete one AR transaction  
  --------------------------------------------
  procedure one_ar_trans(p_trx_id number) is
    v_flag boolean;
  begin
  
    --xoa XLA
    v_flag := delete_xla(p_application_id => 222,
                         p_entity_code    => 'TRANSACTIONS',
                         p_transaction_id => p_trx_id);
  
    if not v_flag then
      rollback;
      write_output('Delete XLA failure.');
      return;
    end if;
  
    -----------------------------------------------------
    -- BACKUP
    -----------------------------------------------------     
  
    insert into backup.evn_ar_payment_schedules_b3
      select *
        from ar_payment_schedules_all psa
       where psa.customer_trx_id = p_trx_id;
  
    insert into backup.evn_ra_cust_trx_line_gl_b3
      select *
        from ra_cust_trx_line_gl_dist_all tld
       where tld.customer_trx_id = p_trx_id;
  
    insert into backup.evn_ra_cust_trx_line_all_b3
      select *
        from ra_customer_trx_lines_all tl
       where tl.customer_trx_id = p_trx_id;
  
    insert into backup.evn_ra_cust_trx_line_sale_b3
      select *
        from ra_cust_trx_line_salesreps
       where customer_trx_id = p_trx_id;
  
    --select * from AR_ADJUSTMENTS_ALL
  
    insert into backup.evn_ra_customer_trx_all_b3
      select *
        from ra_customer_trx_all t
       where t.customer_trx_id = p_trx_id;
  
    -----------------------------------------------------
    -- DELETE
    -----------------------------------------------------    
  
    delete from ar_payment_schedules_all psa
     where psa.customer_trx_id = p_trx_id;
  
    execute immediate 'alter trigger ra_cust_trx_line_gl_dist_bri disable';
  
    delete from ra_cust_trx_line_gl_dist_all tld
     where tld.customer_trx_id = p_trx_id;
  
    execute immediate 'alter trigger ra_cust_trx_line_gl_dist_bri enable';
  
    delete from ar.ar_credit_memo_amounts cma
     where cma.customer_trx_line_id in
           (select tl.customer_trx_line_id
              from ra_customer_trx_lines_all tl
             where tl.customer_trx_id = p_trx_id);
  
    delete from ra_customer_trx_lines_all tl
     where tl.customer_trx_id = p_trx_id;
  
    delete from ra_cust_trx_line_salesreps
     where customer_trx_id = p_trx_id;
  
    delete from ra_customer_trx_all t where t.customer_trx_id = p_trx_id;
  
    commit;
  
  end;

  -- Delete one AR transaction  
  --------------------------------------------
  procedure one_ar_receipt(p_receipt_id number) is
    v_flag boolean;
  begin
  
    -- XLA 
    v_flag := delete_xla(p_application_id => 222,
                         p_entity_code    => 'RECEIPTS',
                         p_transaction_id => p_receipt_id);
  
    if not v_flag then
      write_output('Delete XML failure.');
      rollback;
      return;
    end if;
  
    --------------------------- BACKUP ------------------------------
  
    insert into backup.evn_ar_distributions_all_b3
      select *
        from ar.ar_distributions_all t
       where t.source_table = 'CRH'
         and t.source_id in
             (select cash_receipt_history_id
                from ar_cash_receipt_history_all
               where cash_receipt_id = p_receipt_id);
  
    insert into backup.evn_ar_cash_receipt_history_b3
      select *
        from ar_cash_receipt_history_all crh
       where crh.cash_receipt_id = p_receipt_id;
  
    insert into backup.evn_ar_misc_cash_dist_b3
      select *
        from ar_misc_cash_distributions_all cd
       where cd.cash_receipt_id = p_receipt_id;
  
    insert into backup.evn_ar_cash_receipts_b3
      select *
        from ar_cash_receipts_all r
       where r.cash_receipt_id = p_receipt_id;
  
    ------------------------ DELETE --------------------------    
  
    delete from ar.ar_distributions_all t
     where t.source_table = 'CRH'
       and t.source_id in
           (select cash_receipt_history_id
              from ar_cash_receipt_history_all
             where cash_receipt_id = p_receipt_id);
  
    delete from ar_cash_receipt_history_all crh
     where crh.cash_receipt_id = p_receipt_id;
  
    delete from ar_misc_cash_distributions_all cd
     where cd.cash_receipt_id = p_receipt_id;
  
    delete from ar_cash_receipts_all r
     where r.cash_receipt_id = p_receipt_id;
  
    commit;
  
  end;

  --- Delete XLA
  ------------------------
  function delete_xla(p_application_id number,
                      p_entity_code    varchar2,
                      p_transaction_id number) return boolean is
    -- Cursor Entity
    cursor c_entity is
      select xte.entity_id
        from xla.xla_transaction_entities xte
       where xte.source_id_int_1 = p_transaction_id
         and xte.entity_code = p_entity_code
         and xte.application_id = p_application_id;
    -- Curosr Event
    cursor c_event(p_entity_id number) is
      select xe.event_id
        from xla.xla_events xe
       where xe.entity_id = p_entity_id
         and xe.application_id = p_application_id;
    -- Cursor Header
    cursor c_header(p_entity_id number, p_event_id number) is
      select xh.ae_header_id
        from xla.xla_ae_headers xh
       where xh.entity_id = p_entity_id
         and xh.event_id = p_event_id
         and xh.application_id = p_application_id;
  begin
    /* Xoa XLA */
    for r_entity in c_entity loop
    
      for r_event in c_event(r_entity.entity_id) loop
      
        for r_header in c_header(r_entity.entity_id, r_event.event_id) loop
          -- Xoa Distribution Link
          insert into backup.evn_xla_distribution_links_bak
            select *
              from xla.xla_distribution_links xdl
             where xdl.ae_header_id = r_header.ae_header_id;
        
          delete xla.xla_distribution_links xdl
           where xdl.ae_header_id = r_header.ae_header_id;
        
          -- Xoa Line
          insert into backup.evn_xla_ae_lines_bak
            select *
              from xla.xla_ae_lines xl
             where xl.ae_header_id = r_header.ae_header_id;
        
          delete xla.xla_ae_lines xl
           where xl.ae_header_id = r_header.ae_header_id;
        
          -- Xoa Header 
          insert into backup.evn_xla_ae_headers_bak
            select *
              from xla.xla_ae_headers xh
             where xh.ae_header_id = r_header.ae_header_id;
        
          delete xla.xla_ae_headers xh
           where xh.ae_header_id = r_header.ae_header_id;
        
        end loop;
      
        -- Xoa Event
        insert into backup.evn_xla_events_bak
          select *
            from xla.xla_events xe
           where xe.event_id = r_event.event_id;
      
        delete xla.xla_events xe where xe.event_id = r_event.event_id;
      
      end loop;
    
      -- Xoa Transaction Entity
      insert into backup.evn_xla_transaction_entities
        select *
          from xla.xla_transaction_entities xte
         where xte.entity_id = r_entity.entity_id;
    
      delete xla.xla_transaction_entities xte
       where xte.entity_id = r_entity.entity_id;
    
    end loop;
  
    return true;
  
  exception
    when others then
      return false;
    
  end delete_xla;

end evn_delete_pkg;
/
