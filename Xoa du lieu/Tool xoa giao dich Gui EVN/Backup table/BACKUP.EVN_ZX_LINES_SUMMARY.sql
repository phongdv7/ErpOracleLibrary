-- Create table
create table BACKUP.EVN_ZX_LINES_SUMMARY
(
  summary_tax_line_id            NUMBER(15) not null,
  internal_organization_id       NUMBER not null,
  application_id                 NUMBER not null,
  entity_code                    VARCHAR2(30) not null,
  event_class_code               VARCHAR2(30) not null,
  trx_id                         NUMBER not null,
  trx_number                     VARCHAR2(150),
  applied_from_application_id    NUMBER,
  applied_from_event_class_code  VARCHAR2(30),
  applied_from_entity_code       VARCHAR2(30),
  applied_from_trx_id            NUMBER,
  adjusted_doc_application_id    NUMBER,
  adjusted_doc_entity_code       VARCHAR2(30),
  adjusted_doc_event_class_code  VARCHAR2(30),
  adjusted_doc_trx_id            NUMBER,
  summary_tax_line_number        NUMBER not null,
  content_owner_id               NUMBER(15),
  tax_regime_code                VARCHAR2(30),
  tax                            VARCHAR2(30),
  tax_status_code                VARCHAR2(30),
  tax_rate_id                    NUMBER(15),
  tax_rate_code                  VARCHAR2(150),
  tax_rate                       NUMBER,
  tax_amt                        NUMBER,
  tax_amt_tax_curr               NUMBER,
  tax_amt_funcl_curr             NUMBER,
  tax_jurisdiction_code          VARCHAR2(30),
  total_rec_tax_amt              NUMBER,
  total_rec_tax_amt_funcl_curr   NUMBER,
  total_nrec_tax_amt             NUMBER,
  total_nrec_tax_amt_funcl_curr  NUMBER,
  ledger_id                      NUMBER(15),
  legal_entity_id                NUMBER,
  establishment_id               NUMBER,
  currency_conversion_date       DATE,
  currency_conversion_type       VARCHAR2(30),
  currency_conversion_rate       NUMBER,
  summarization_template_id      NUMBER(15),
  taxable_basis_formula          VARCHAR2(30),
  tax_calculation_formula        VARCHAR2(30),
  historical_flag                VARCHAR2(1),
  cancel_flag                    VARCHAR2(1),
  delete_flag                    VARCHAR2(1),
  tax_amt_included_flag          VARCHAR2(1),
  compounding_tax_flag           VARCHAR2(1),
  self_assessed_flag             VARCHAR2(1),
  overridden_flag                VARCHAR2(1),
  reporting_only_flag            VARCHAR2(1),
  associated_child_frozen_flag   VARCHAR2(1),
  copied_from_other_doc_flag     VARCHAR2(1),
  manually_entered_flag          VARCHAR2(1),
  last_manual_entry              VARCHAR2(30),
  record_type_code               VARCHAR2(30),
  tax_provider_id                NUMBER,
  tax_only_line_flag             VARCHAR2(1),
  created_by                     NUMBER(15) not null,
  creation_date                  DATE not null,
  last_updated_by                NUMBER(15) not null,
  last_update_date               DATE not null,
  last_update_login              NUMBER(15),
  attribute_category             VARCHAR2(150),
  attribute1                     VARCHAR2(150),
  attribute2                     VARCHAR2(150),
  attribute3                     VARCHAR2(150),
  attribute4                     VARCHAR2(150),
  attribute5                     VARCHAR2(150),
  attribute6                     VARCHAR2(150),
  attribute7                     VARCHAR2(150),
  attribute8                     VARCHAR2(150),
  attribute9                     VARCHAR2(150),
  attribute10                    VARCHAR2(150),
  attribute11                    VARCHAR2(150),
  attribute12                    VARCHAR2(150),
  attribute13                    VARCHAR2(150),
  attribute14                    VARCHAR2(150),
  attribute15                    VARCHAR2(150),
  applied_from_line_id           NUMBER,
  app_from_lin_trx_user_key1     VARCHAR2(150),
  app_from_lin_trx_user_key2     VARCHAR2(150),
  app_from_lin_trx_user_key3     VARCHAR2(150),
  app_from_lin_trx_user_key4     VARCHAR2(150),
  app_from_lin_trx_user_key5     VARCHAR2(150),
  app_from_lin_trx_user_key6     VARCHAR2(150),
  adj_doc_hdr_trx_user_key1      VARCHAR2(150),
  adj_doc_hdr_trx_user_key2      VARCHAR2(150),
  adj_doc_hdr_trx_user_key3      VARCHAR2(150),
  adj_doc_hdr_trx_user_key4      VARCHAR2(150),
  adj_doc_hdr_trx_user_key5      VARCHAR2(150),
  adj_doc_hdr_trx_user_key6      VARCHAR2(150),
  applied_to_application_id      NUMBER,
  applied_to_event_class_code    VARCHAR2(30),
  applied_to_entity_code         VARCHAR2(30),
  applied_to_trx_id              NUMBER,
  app_to_hdr_trx_user_key1       VARCHAR2(150),
  app_to_hdr_trx_user_key2       VARCHAR2(150),
  app_to_hdr_trx_user_key3       VARCHAR2(150),
  app_to_hdr_trx_user_key4       VARCHAR2(150),
  app_to_hdr_trx_user_key5       VARCHAR2(150),
  app_to_hdr_trx_user_key6       VARCHAR2(150),
  applied_to_line_id             NUMBER,
  app_to_lin_trx_user_key1       VARCHAR2(150),
  app_to_lin_trx_user_key2       VARCHAR2(150),
  app_to_lin_trx_user_key3       VARCHAR2(150),
  app_to_lin_trx_user_key4       VARCHAR2(150),
  app_to_lin_trx_user_key5       VARCHAR2(150),
  app_to_lin_trx_user_key6       VARCHAR2(150),
  tax_exemption_id               NUMBER,
  tax_rate_before_exemption      NUMBER,
  tax_rate_name_before_exemption VARCHAR2(80),
  exempt_rate_modifier           NUMBER,
  exempt_certificate_number      VARCHAR2(80),
  exempt_reason                  VARCHAR2(240),
  exempt_reason_code             VARCHAR2(30),
  tax_rate_before_exception      NUMBER,
  tax_rate_name_before_exception VARCHAR2(80),
  tax_exception_id               NUMBER,
  exception_rate                 NUMBER,
  total_rec_tax_amt_tax_curr     NUMBER,
  total_nrec_tax_amt_tax_curr    NUMBER,
  mrc_tax_line_flag              VARCHAR2(1),
  global_attribute_category      VARCHAR2(150),
  global_attribute1              VARCHAR2(150),
  global_attribute2              VARCHAR2(150),
  global_attribute3              VARCHAR2(150),
  global_attribute4              VARCHAR2(150),
  global_attribute5              VARCHAR2(150),
  global_attribute6              VARCHAR2(150),
  global_attribute7              VARCHAR2(150),
  global_attribute8              VARCHAR2(150),
  global_attribute9              VARCHAR2(150),
  global_attribute10             VARCHAR2(150),
  global_attribute11             VARCHAR2(150),
  global_attribute12             VARCHAR2(150),
  global_attribute13             VARCHAR2(150),
  global_attribute14             VARCHAR2(150),
  global_attribute15             VARCHAR2(150),
  global_attribute16             VARCHAR2(150),
  global_attribute17             VARCHAR2(150),
  global_attribute18             VARCHAR2(150),
  global_attribute19             VARCHAR2(150),
  global_attribute20             VARCHAR2(150),
  applied_from_trx_level_type    VARCHAR2(30),
  adjusted_doc_trx_level_type    VARCHAR2(30),
  applied_to_trx_level_type      VARCHAR2(30),
  trx_level_type                 VARCHAR2(30),
  adjust_tax_amt_flag            VARCHAR2(1),
  object_version_number          NUMBER not null
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
