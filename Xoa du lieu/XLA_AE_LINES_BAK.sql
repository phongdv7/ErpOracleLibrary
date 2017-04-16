-- Create table
create table backup.EVN_XLA_AE_LINES_BAK
(
  AE_HEADER_ID              NUMBER(15) not null,
  AE_LINE_NUM               NUMBER(15) not null,
  APPLICATION_ID            NUMBER(15) not null,
  CODE_COMBINATION_ID       NUMBER(15) not null,
  GL_TRANSFER_MODE_CODE     VARCHAR2(1),
  GL_SL_LINK_ID             NUMBER(15),
  ACCOUNTING_CLASS_CODE     VARCHAR2(30) not null,
  PARTY_ID                  NUMBER(15),
  PARTY_SITE_ID             NUMBER(15),
  PARTY_TYPE_CODE           VARCHAR2(1),
  ENTERED_DR                NUMBER,
  ENTERED_CR                NUMBER,
  ACCOUNTED_DR              NUMBER,
  ACCOUNTED_CR              NUMBER,
  DESCRIPTION               VARCHAR2(1996),
  STATISTICAL_AMOUNT        NUMBER,
  CURRENCY_CODE             VARCHAR2(15) not null,
  CURRENCY_CONVERSION_DATE  DATE,
  CURRENCY_CONVERSION_RATE  NUMBER,
  CURRENCY_CONVERSION_TYPE  VARCHAR2(30),
  USSGL_TRANSACTION_CODE    VARCHAR2(30),
  JGZZ_RECON_REF            VARCHAR2(240),
  CONTROL_BALANCE_FLAG      VARCHAR2(1),
  ANALYTICAL_BALANCE_FLAG   VARCHAR2(1),
  ATTRIBUTE_CATEGORY        VARCHAR2(30),
  ATTRIBUTE1                VARCHAR2(150),
  ATTRIBUTE2                VARCHAR2(150),
  ATTRIBUTE3                VARCHAR2(150),
  ATTRIBUTE4                VARCHAR2(150),
  ATTRIBUTE5                VARCHAR2(150),
  ATTRIBUTE6                VARCHAR2(150),
  ATTRIBUTE7                VARCHAR2(150),
  ATTRIBUTE8                VARCHAR2(150),
  ATTRIBUTE9                VARCHAR2(150),
  ATTRIBUTE10               VARCHAR2(150),
  ATTRIBUTE11               VARCHAR2(150),
  ATTRIBUTE12               VARCHAR2(150),
  ATTRIBUTE13               VARCHAR2(150),
  ATTRIBUTE14               VARCHAR2(150),
  ATTRIBUTE15               VARCHAR2(150),
  GL_SL_LINK_TABLE          VARCHAR2(30),
  DISPLAYED_LINE_NUMBER     NUMBER(15),
  CREATION_DATE             DATE not null,
  CREATED_BY                NUMBER(15) not null,
  LAST_UPDATE_DATE          DATE not null,
  LAST_UPDATED_BY           NUMBER(15) not null,
  LAST_UPDATE_LOGIN         NUMBER(15),
  PROGRAM_UPDATE_DATE       DATE,
  PROGRAM_APPLICATION_ID    NUMBER(15),
  PROGRAM_ID                NUMBER(15),
  REQUEST_ID                NUMBER(15),
  UPG_BATCH_ID              NUMBER(15),
  UPG_TAX_REFERENCE_ID1     NUMBER(15),
  UPG_TAX_REFERENCE_ID2     NUMBER(15),
  UPG_TAX_REFERENCE_ID3     NUMBER(15),
  UNROUNDED_ACCOUNTED_DR    NUMBER,
  UNROUNDED_ACCOUNTED_CR    NUMBER,
  GAIN_OR_LOSS_FLAG         VARCHAR2(1),
  UNROUNDED_ENTERED_DR      NUMBER,
  UNROUNDED_ENTERED_CR      NUMBER,
  SUBSTITUTED_CCID          NUMBER(15),
  BUSINESS_CLASS_CODE       VARCHAR2(30),
  MPA_ACCRUAL_ENTRY_FLAG    VARCHAR2(1),
  ENCUMBRANCE_TYPE_ID       NUMBER(15),
  FUNDS_STATUS_CODE         VARCHAR2(30),
  MERGE_CODE_COMBINATION_ID NUMBER(15),
  MERGE_PARTY_ID            NUMBER(15),
  MERGE_PARTY_SITE_ID       NUMBER(15),
  ACCOUNTING_DATE           DATE not null,
  LEDGER_ID                 NUMBER(15) not null,
  SOURCE_TABLE              VARCHAR2(30),
  SOURCE_ID                 NUMBER(15),
  ACCOUNT_OVERLAY_SOURCE_ID NUMBER(15)
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
