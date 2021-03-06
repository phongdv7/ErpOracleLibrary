-- Create table
create table BACKUP.EVN_AP_INV_DISTRIBUTIONS_ALL
(
  accounting_date               DATE not null,
  accrual_posted_flag           VARCHAR2(1),
  assets_addition_flag          VARCHAR2(1) not null,
  assets_tracking_flag          VARCHAR2(1) not null,
  cash_posted_flag              VARCHAR2(1),
  distribution_line_number      NUMBER(15) not null,
  dist_code_combination_id      NUMBER(15) not null,
  invoice_id                    NUMBER(15) not null,
  last_updated_by               NUMBER(15) not null,
  last_update_date              DATE not null,
  line_type_lookup_code         VARCHAR2(25) not null,
  period_name                   VARCHAR2(15) not null,
  set_of_books_id               NUMBER(15) not null,
  accts_pay_code_combination_id NUMBER(15),
  amount                        NUMBER,
  base_amount                   NUMBER,
  base_invoice_price_variance   NUMBER,
  batch_id                      NUMBER(15),
  created_by                    NUMBER(15),
  creation_date                 DATE,
  description                   VARCHAR2(240),
  exchange_rate_variance        NUMBER,
  final_match_flag              VARCHAR2(1),
  income_tax_region             VARCHAR2(10),
  invoice_price_variance        NUMBER,
  last_update_login             NUMBER(15),
  match_status_flag             VARCHAR2(1),
  posted_flag                   VARCHAR2(1),
  po_distribution_id            NUMBER(15),
  program_application_id        NUMBER(15),
  program_id                    NUMBER(15),
  program_update_date           DATE,
  quantity_invoiced             NUMBER,
  rate_var_code_combination_id  NUMBER(15),
  request_id                    NUMBER(15),
  reversal_flag                 VARCHAR2(1),
  type_1099                     VARCHAR2(10),
  unit_price                    NUMBER,
  amount_encumbered             NUMBER,
  base_amount_encumbered        NUMBER,
  encumbered_flag               VARCHAR2(1),
  exchange_date                 DATE,
  exchange_rate                 NUMBER,
  exchange_rate_type            VARCHAR2(30),
  price_adjustment_flag         VARCHAR2(1),
  price_var_code_combination_id NUMBER(15),
  quantity_unencumbered         NUMBER,
  stat_amount                   NUMBER,
  amount_to_post                NUMBER,
  attribute1                    VARCHAR2(150),
  attribute10                   VARCHAR2(150),
  attribute11                   VARCHAR2(150),
  attribute12                   VARCHAR2(150),
  attribute13                   VARCHAR2(150),
  attribute14                   VARCHAR2(150),
  attribute15                   VARCHAR2(150),
  attribute2                    VARCHAR2(150),
  attribute3                    VARCHAR2(150),
  attribute4                    VARCHAR2(150),
  attribute5                    VARCHAR2(150),
  attribute6                    VARCHAR2(150),
  attribute7                    VARCHAR2(150),
  attribute8                    VARCHAR2(150),
  attribute9                    VARCHAR2(150),
  attribute_category            VARCHAR2(150),
  base_amount_to_post           NUMBER,
  cash_je_batch_id              NUMBER(15),
  expenditure_item_date         DATE,
  expenditure_organization_id   NUMBER(15),
  expenditure_type              VARCHAR2(30),
  je_batch_id                   NUMBER(15),
  parent_invoice_id             NUMBER(15),
  pa_addition_flag              VARCHAR2(1),
  pa_quantity                   NUMBER(22,5),
  posted_amount                 NUMBER,
  posted_base_amount            NUMBER,
  prepay_amount_remaining       NUMBER,
  project_accounting_context    VARCHAR2(30),
  project_id                    NUMBER(15),
  task_id                       NUMBER(15),
  ussgl_transaction_code        VARCHAR2(30),
  ussgl_trx_code_context        VARCHAR2(30),
  earliest_settlement_date      DATE,
  req_distribution_id           NUMBER(15),
  quantity_variance             NUMBER,
  base_quantity_variance        NUMBER,
  packet_id                     NUMBER(15),
  awt_flag                      VARCHAR2(1),
  awt_group_id                  NUMBER(15),
  awt_tax_rate_id               NUMBER(15),
  awt_gross_amount              NUMBER,
  awt_invoice_id                NUMBER(15),
  awt_origin_group_id           NUMBER(15),
  reference_1                   VARCHAR2(30),
  reference_2                   VARCHAR2(30),
  org_id                        NUMBER(15),
  other_invoice_id              NUMBER(15),
  awt_invoice_payment_id        NUMBER(15),
  global_attribute_category     VARCHAR2(150),
  global_attribute1             VARCHAR2(150),
  global_attribute2             VARCHAR2(150),
  global_attribute3             VARCHAR2(150),
  global_attribute4             VARCHAR2(150),
  global_attribute5             VARCHAR2(150),
  global_attribute6             VARCHAR2(150),
  global_attribute7             VARCHAR2(150),
  global_attribute8             VARCHAR2(150),
  global_attribute9             VARCHAR2(150),
  global_attribute10            VARCHAR2(150),
  global_attribute11            VARCHAR2(150),
  global_attribute12            VARCHAR2(150),
  global_attribute13            VARCHAR2(150),
  global_attribute14            VARCHAR2(150),
  global_attribute15            VARCHAR2(150),
  global_attribute16            VARCHAR2(150),
  global_attribute17            VARCHAR2(150),
  global_attribute18            VARCHAR2(150),
  global_attribute19            VARCHAR2(150),
  global_attribute20            VARCHAR2(150),
  line_group_number             NUMBER(15),
  receipt_verified_flag         VARCHAR2(1),
  receipt_required_flag         VARCHAR2(1),
  receipt_missing_flag          VARCHAR2(1),
  justification                 VARCHAR2(240),
  expense_group                 VARCHAR2(80),
  start_expense_date            DATE,
  end_expense_date              DATE,
  receipt_currency_code         VARCHAR2(15),
  receipt_conversion_rate       NUMBER,
  receipt_currency_amount       NUMBER,
  daily_amount                  NUMBER,
  web_parameter_id              NUMBER,
  adjustment_reason             VARCHAR2(240),
  award_id                      NUMBER(15),
  mrc_accrual_posted_flag       VARCHAR2(2000),
  mrc_cash_posted_flag          VARCHAR2(2000),
  mrc_dist_code_combination_id  VARCHAR2(2000),
  mrc_amount                    VARCHAR2(2000),
  mrc_base_amount               VARCHAR2(2000),
  mrc_base_inv_price_variance   VARCHAR2(2000),
  mrc_exchange_rate_variance    VARCHAR2(2000),
  mrc_posted_flag               VARCHAR2(2000),
  mrc_program_application_id    VARCHAR2(2000),
  mrc_program_id                VARCHAR2(2000),
  mrc_program_update_date       VARCHAR2(2000),
  mrc_rate_var_ccid             VARCHAR2(2000),
  mrc_request_id                VARCHAR2(2000),
  mrc_exchange_date             VARCHAR2(2000),
  mrc_exchange_rate             VARCHAR2(2000),
  mrc_exchange_rate_type        VARCHAR2(2000),
  mrc_amount_to_post            VARCHAR2(2000),
  mrc_base_amount_to_post       VARCHAR2(2000),
  mrc_cash_je_batch_id          VARCHAR2(2000),
  mrc_je_batch_id               VARCHAR2(2000),
  mrc_posted_amount             VARCHAR2(2000),
  mrc_posted_base_amount        VARCHAR2(2000),
  mrc_receipt_conversion_rate   VARCHAR2(2000),
  credit_card_trx_id            NUMBER(15),
  dist_match_type               VARCHAR2(25),
  rcv_transaction_id            NUMBER(15),
  invoice_distribution_id       NUMBER(15) not null,
  parent_reversal_id            NUMBER(15),
  tax_recoverable_flag          VARCHAR2(1),
  pa_cc_ar_invoice_id           NUMBER(15),
  pa_cc_ar_invoice_line_num     NUMBER(15),
  pa_cc_processed_code          VARCHAR2(1),
  merchant_document_number      VARCHAR2(80),
  merchant_name                 VARCHAR2(80),
  merchant_reference            VARCHAR2(240),
  merchant_tax_reg_number       VARCHAR2(80),
  merchant_taxpayer_id          VARCHAR2(80),
  country_of_supply             VARCHAR2(5),
  matched_uom_lookup_code       VARCHAR2(25),
  gms_burdenable_raw_cost       NUMBER(22,5),
  accounting_event_id           NUMBER(15),
  prepay_distribution_id        NUMBER(15),
  upgrade_posted_amt            NUMBER,
  upgrade_base_posted_amt       NUMBER,
  inventory_transfer_status     VARCHAR2(1),
  company_prepaid_invoice_id    NUMBER(15),
  cc_reversal_flag              VARCHAR2(1),
  awt_withheld_amt              NUMBER,
  invoice_includes_prepay_flag  VARCHAR2(1),
  price_correct_inv_id          NUMBER(15),
  price_correct_qty             NUMBER,
  pa_cmt_xface_flag             VARCHAR2(1),
  cancellation_flag             VARCHAR2(1),
  invoice_line_number           NUMBER,
  corrected_invoice_dist_id     NUMBER(15),
  rounding_amt                  NUMBER,
  charge_applicable_to_dist_id  NUMBER(15),
  corrected_quantity            NUMBER,
  related_id                    NUMBER(15),
  asset_book_type_code          VARCHAR2(15),
  asset_category_id             NUMBER(15),
  distribution_class            VARCHAR2(30),
  final_payment_rounding        NUMBER,
  final_application_rounding    NUMBER,
  amount_at_prepay_xrate        NUMBER,
  cash_basis_final_app_rounding NUMBER,
  amount_at_prepay_pay_xrate    NUMBER,
  intended_use                  VARCHAR2(30),
  detail_tax_dist_id            NUMBER,
  rec_nrec_rate                 NUMBER,
  recovery_rate_id              NUMBER,
  recovery_rate_name            VARCHAR2(150),
  recovery_type_code            VARCHAR2(30),
  recovery_rate_code            VARCHAR2(30),
  withholding_tax_code_id       NUMBER(15),
  tax_already_distributed_flag  VARCHAR2(1),
  summary_tax_line_id           NUMBER,
  taxable_amount                NUMBER,
  taxable_base_amount           NUMBER,
  extra_po_erv                  NUMBER,
  prepay_tax_diff_amount        NUMBER,
  tax_code_id                   NUMBER(15),
  vat_code                      VARCHAR2(15),
  amount_includes_tax_flag      VARCHAR2(1),
  tax_calculated_flag           VARCHAR2(1),
  tax_recovery_rate             NUMBER,
  tax_recovery_override_flag    VARCHAR2(1),
  tax_code_override_flag        VARCHAR2(1),
  total_dist_amount             NUMBER,
  total_dist_base_amount        NUMBER,
  prepay_tax_parent_id          NUMBER(15),
  cancelled_flag                VARCHAR2(1),
  old_distribution_id           NUMBER(15),
  old_dist_line_number          NUMBER(15),
  amount_variance               NUMBER,
  base_amount_variance          NUMBER,
  historical_flag               VARCHAR2(1),
  rcv_charge_addition_flag      VARCHAR2(1),
  awt_related_id                NUMBER(15),
  related_retainage_dist_id     NUMBER(15),
  retained_amount_remaining     NUMBER,
  bc_event_id                   NUMBER,
  retained_invoice_dist_id      NUMBER(15),
  final_release_rounding        NUMBER,
  fully_paid_acctd_flag         VARCHAR2(1),
  root_distribution_id          NUMBER(15),
  xinv_parent_reversal_id       NUMBER(15),
  recurring_payment_id          NUMBER(15),
  release_inv_dist_derived_from NUMBER(15),
  pay_awt_group_id              NUMBER(15)
)
tablespace APPS_TS_TX_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
