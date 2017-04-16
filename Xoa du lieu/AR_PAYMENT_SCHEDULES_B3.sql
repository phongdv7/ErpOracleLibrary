-- Create table
create table backup.EVN_AR_PAYMENT_SCHEDULES_B3
(
  PAYMENT_SCHEDULE_ID            NUMBER(15) not null,
  STAGED_DUNNING_LEVEL           NUMBER(2),
  DUNNING_LEVEL_OVERRIDE_DATE    DATE,
  LAST_UPDATE_DATE               DATE not null,
  LAST_UPDATED_BY                NUMBER(15) not null,
  CREATION_DATE                  DATE not null,
  CREATED_BY                     NUMBER(15) not null,
  LAST_UPDATE_LOGIN              NUMBER(15),
  DUE_DATE                       DATE not null,
  AMOUNT_DUE_ORIGINAL            NUMBER not null,
  AMOUNT_DUE_REMAINING           NUMBER not null,
  NUMBER_OF_DUE_DATES            NUMBER(15) not null,
  STATUS                         VARCHAR2(30) not null,
  INVOICE_CURRENCY_CODE          VARCHAR2(15) not null,
  CLASS                          VARCHAR2(20) not null,
  CUST_TRX_TYPE_ID               NUMBER(15),
  CUSTOMER_ID                    NUMBER(15),
  CUSTOMER_SITE_USE_ID           NUMBER(15),
  CUSTOMER_TRX_ID                NUMBER(15),
  CASH_RECEIPT_ID                NUMBER(15),
  ASSOCIATED_CASH_RECEIPT_ID     NUMBER(15),
  TERM_ID                        NUMBER(15),
  TERMS_SEQUENCE_NUMBER          NUMBER(15),
  GL_DATE_CLOSED                 DATE not null,
  ACTUAL_DATE_CLOSED             DATE not null,
  DISCOUNT_DATE                  DATE,
  AMOUNT_LINE_ITEMS_ORIGINAL     NUMBER,
  AMOUNT_LINE_ITEMS_REMAINING    NUMBER,
  AMOUNT_APPLIED                 NUMBER,
  AMOUNT_ADJUSTED                NUMBER,
  AMOUNT_IN_DISPUTE              NUMBER,
  AMOUNT_CREDITED                NUMBER,
  RECEIVABLES_CHARGES_CHARGED    NUMBER,
  RECEIVABLES_CHARGES_REMAINING  NUMBER,
  FREIGHT_ORIGINAL               NUMBER,
  FREIGHT_REMAINING              NUMBER,
  TAX_ORIGINAL                   NUMBER,
  TAX_REMAINING                  NUMBER,
  DISCOUNT_ORIGINAL              NUMBER,
  DISCOUNT_REMAINING             NUMBER,
  DISCOUNT_TAKEN_EARNED          NUMBER,
  DISCOUNT_TAKEN_UNEARNED        NUMBER,
  IN_COLLECTION                  VARCHAR2(1),
  CASH_APPLIED_ID_LAST           NUMBER,
  CASH_APPLIED_DATE_LAST         DATE,
  CASH_APPLIED_AMOUNT_LAST       NUMBER,
  CASH_APPLIED_STATUS_LAST       VARCHAR2(30),
  CASH_GL_DATE_LAST              DATE,
  CASH_RECEIPT_ID_LAST           NUMBER(15),
  CASH_RECEIPT_DATE_LAST         DATE,
  CASH_RECEIPT_AMOUNT_LAST       NUMBER,
  CASH_RECEIPT_STATUS_LAST       VARCHAR2(30),
  EXCHANGE_RATE_TYPE             VARCHAR2(30),
  EXCHANGE_DATE                  DATE,
  EXCHANGE_RATE                  NUMBER,
  ADJUSTMENT_ID_LAST             NUMBER(15),
  ADJUSTMENT_DATE_LAST           DATE,
  ADJUSTMENT_GL_DATE_LAST        DATE,
  ADJUSTMENT_AMOUNT_LAST         NUMBER,
  FOLLOW_UP_DATE_LAST            DATE,
  FOLLOW_UP_CODE_LAST            VARCHAR2(30),
  PROMISE_DATE_LAST              DATE,
  PROMISE_AMOUNT_LAST            NUMBER,
  COLLECTOR_LAST                 NUMBER(15),
  CALL_DATE_LAST                 DATE,
  TRX_NUMBER                     VARCHAR2(30),
  TRX_DATE                       DATE,
  ATTRIBUTE_CATEGORY             VARCHAR2(30),
  ATTRIBUTE1                     VARCHAR2(150),
  ATTRIBUTE2                     VARCHAR2(150),
  ATTRIBUTE3                     VARCHAR2(150),
  ATTRIBUTE4                     VARCHAR2(150),
  ATTRIBUTE5                     VARCHAR2(150),
  ATTRIBUTE6                     VARCHAR2(150),
  ATTRIBUTE7                     VARCHAR2(150),
  ATTRIBUTE8                     VARCHAR2(150),
  ATTRIBUTE9                     VARCHAR2(150),
  ATTRIBUTE10                    VARCHAR2(150),
  REVERSED_CASH_RECEIPT_ID       NUMBER(15),
  AMOUNT_ADJUSTED_PENDING        NUMBER,
  ATTRIBUTE11                    VARCHAR2(150),
  ATTRIBUTE12                    VARCHAR2(150),
  ATTRIBUTE13                    VARCHAR2(150),
  ATTRIBUTE14                    VARCHAR2(150),
  ATTRIBUTE15                    VARCHAR2(150),
  GL_DATE                        DATE not null,
  ACCTD_AMOUNT_DUE_REMAINING     NUMBER not null,
  PROGRAM_APPLICATION_ID         NUMBER(15),
  PROGRAM_ID                     NUMBER(15),
  PROGRAM_UPDATE_DATE            DATE,
  RECEIPT_CONFIRMED_FLAG         VARCHAR2(1),
  REQUEST_ID                     NUMBER(15),
  SELECTED_FOR_RECEIPT_BATCH_ID  NUMBER(15),
  LAST_CHARGE_DATE               DATE,
  SECOND_LAST_CHARGE_DATE        DATE,
  DISPUTE_DATE                   DATE,
  ORG_ID                         NUMBER(15),
  GLOBAL_ATTRIBUTE1              VARCHAR2(150),
  GLOBAL_ATTRIBUTE2              VARCHAR2(150),
  GLOBAL_ATTRIBUTE3              VARCHAR2(150),
  GLOBAL_ATTRIBUTE4              VARCHAR2(150),
  GLOBAL_ATTRIBUTE5              VARCHAR2(150),
  GLOBAL_ATTRIBUTE6              VARCHAR2(150),
  GLOBAL_ATTRIBUTE7              VARCHAR2(150),
  GLOBAL_ATTRIBUTE8              VARCHAR2(150),
  GLOBAL_ATTRIBUTE9              VARCHAR2(150),
  GLOBAL_ATTRIBUTE10             VARCHAR2(150),
  GLOBAL_ATTRIBUTE11             VARCHAR2(150),
  GLOBAL_ATTRIBUTE12             VARCHAR2(150),
  GLOBAL_ATTRIBUTE13             VARCHAR2(150),
  GLOBAL_ATTRIBUTE14             VARCHAR2(150),
  GLOBAL_ATTRIBUTE15             VARCHAR2(150),
  GLOBAL_ATTRIBUTE16             VARCHAR2(150),
  GLOBAL_ATTRIBUTE17             VARCHAR2(150),
  GLOBAL_ATTRIBUTE18             VARCHAR2(150),
  GLOBAL_ATTRIBUTE19             VARCHAR2(150),
  GLOBAL_ATTRIBUTE20             VARCHAR2(150),
  GLOBAL_ATTRIBUTE_CATEGORY      VARCHAR2(30),
  CONS_INV_ID                    NUMBER(15),
  CONS_INV_ID_REV                NUMBER(15),
  EXCLUDE_FROM_DUNNING_FLAG      VARCHAR2(1),
  MRC_CUSTOMER_TRX_ID            VARCHAR2(2000),
  MRC_EXCHANGE_RATE_TYPE         VARCHAR2(2000),
  MRC_EXCHANGE_DATE              VARCHAR2(2000),
  MRC_EXCHANGE_RATE              VARCHAR2(2000),
  MRC_ACCTD_AMOUNT_DUE_REMAINING VARCHAR2(2000),
  BR_AMOUNT_ASSIGNED             NUMBER,
  RESERVED_TYPE                  VARCHAR2(30),
  RESERVED_VALUE                 NUMBER(15),
  ACTIVE_CLAIM_FLAG              VARCHAR2(1),
  EXCLUDE_FROM_CONS_BILL_FLAG    VARCHAR2(1),
  PAYMENT_APPROVAL               VARCHAR2(30)
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
