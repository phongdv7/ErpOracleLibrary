-- Create table
--drop table BACKUP.EVN_AR_CASH_RECEIPTS_B3
create table BACKUP.EVN_AR_CASH_RECEIPTS_B3
(
  CASH_RECEIPT_ID                NUMBER(15) not null,
  LAST_UPDATED_BY                NUMBER(15) not null,
  LAST_UPDATE_DATE               DATE not null,
  LAST_UPDATE_LOGIN              NUMBER(15),
  CREATED_BY                     NUMBER(15) not null,
  CREATION_DATE                  DATE not null,
  AMOUNT                         NUMBER not null,
  SET_OF_BOOKS_ID                NUMBER(15) not null,
  CURRENCY_CODE                  VARCHAR2(15) not null,
  RECEIVABLES_TRX_ID             NUMBER(15),
  PAY_FROM_CUSTOMER              NUMBER(15),
  STATUS                         VARCHAR2(30),
  TYPE                           VARCHAR2(20),
  RECEIPT_NUMBER                 VARCHAR2(30),
  RECEIPT_DATE                   DATE not null,
  MISC_PAYMENT_SOURCE            VARCHAR2(30),
  COMMENTS                       VARCHAR2(2000),
  DISTRIBUTION_SET_ID            NUMBER(15),
  REVERSAL_DATE                  DATE,
  REVERSAL_CATEGORY              VARCHAR2(20),
  REVERSAL_REASON_CODE           VARCHAR2(30),
  REVERSAL_COMMENTS              VARCHAR2(240),
  EXCHANGE_RATE_TYPE             VARCHAR2(30),
  EXCHANGE_RATE                  NUMBER,
  EXCHANGE_DATE                  DATE,
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
  REMITTANCE_BANK_ACCOUNT_ID     NUMBER(15),
  ATTRIBUTE11                    VARCHAR2(150),
  ATTRIBUTE12                    VARCHAR2(150),
  ATTRIBUTE13                    VARCHAR2(150),
  ATTRIBUTE14                    VARCHAR2(150),
  ATTRIBUTE15                    VARCHAR2(150),
  CONFIRMED_FLAG                 VARCHAR2(1),
  CUSTOMER_BANK_ACCOUNT_ID       NUMBER(15),
  CUSTOMER_SITE_USE_ID           NUMBER(15),
  DEPOSIT_DATE                   DATE,
  PROGRAM_APPLICATION_ID         NUMBER(15),
  PROGRAM_ID                     NUMBER(15),
  PROGRAM_UPDATE_DATE            DATE,
  RECEIPT_METHOD_ID              NUMBER(15) not null,
  REQUEST_ID                     NUMBER(15),
  SELECTED_FOR_FACTORING_FLAG    VARCHAR2(1),
  SELECTED_REMITTANCE_BATCH_ID   NUMBER(15),
  FACTOR_DISCOUNT_AMOUNT         NUMBER,
  USSGL_TRANSACTION_CODE         VARCHAR2(30),
  USSGL_TRANSACTION_CODE_CONTEXT VARCHAR2(30),
  DOC_SEQUENCE_VALUE             NUMBER(15),
  DOC_SEQUENCE_ID                NUMBER(15),
  VAT_TAX_ID                     NUMBER(15),
  REFERENCE_TYPE                 VARCHAR2(30),
  REFERENCE_ID                   NUMBER(15),
  CUSTOMER_RECEIPT_REFERENCE     VARCHAR2(30),
  OVERRIDE_REMIT_ACCOUNT_FLAG    VARCHAR2(1),
  ORG_ID                         NUMBER(15),
  ANTICIPATED_CLEARING_DATE      DATE,
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
  ISSUER_NAME                    VARCHAR2(50),
  ISSUE_DATE                     DATE,
  ISSUER_BANK_BRANCH_ID          NUMBER(15),
  CUSTOMER_BANK_BRANCH_ID        NUMBER(15),
  MRC_EXCHANGE_RATE_TYPE         VARCHAR2(2000),
  MRC_EXCHANGE_RATE              VARCHAR2(2000),
  MRC_EXCHANGE_DATE              VARCHAR2(2000),
  PAYMENT_SERVER_ORDER_NUM       VARCHAR2(80),
  APPROVAL_CODE                  VARCHAR2(80),
  ADDRESS_VERIFICATION_CODE      VARCHAR2(80),
  TAX_RATE                       NUMBER,
  ACTUAL_VALUE_DATE              DATE,
  POSTMARK_DATE                  DATE,
  APPLICATION_NOTES              VARCHAR2(2000),
  UNIQUE_REFERENCE               VARCHAR2(32),
  PROMISE_SOURCE                 VARCHAR2(30),
  REC_VERSION_NUMBER             NUMBER(15),
  CC_ERROR_CODE                  VARCHAR2(80),
  CC_ERROR_TEXT                  VARCHAR2(255),
  CC_ERROR_FLAG                  VARCHAR2(1),
  REMIT_BANK_ACCT_USE_ID         NUMBER(15),
  OLD_CUSTOMER_BANK_BRANCH_ID    NUMBER(15),
  OLD_ISSUER_BANK_BRANCH_ID      NUMBER(15),
  LEGAL_ENTITY_ID                NUMBER(15),
  PAYMENT_TRXN_EXTENSION_ID      NUMBER(15),
  AX_ACCOUNTED_FLAG              VARCHAR2(1),
  OLD_CUSTOMER_BANK_ACCOUNT_ID   NUMBER(15),
  CASH_APPLN_OWNER_ID            NUMBER(15),
  WORK_ITEM_ASSIGNMENT_DATE      DATE,
  WORK_ITEM_REVIEW_DATE          DATE,
  WORK_ITEM_STATUS_CODE          VARCHAR2(30),
  WORK_ITEM_REVIEW_NOTE          VARCHAR2(2000),
  PREV_PAY_FROM_CUSTOMER         NUMBER(15),
  PREV_CUSTOMER_SITE_USE_ID      NUMBER(15),
  WORK_ITEM_EXCEPTION_REASON     VARCHAR2(30),
  AUTOMATCH_SET_ID               NUMBER(15),
  AUTOAPPLY_FLAG                 VARCHAR2(1),
  SEQ_TYPE_LAST                  VARCHAR2(1)
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
