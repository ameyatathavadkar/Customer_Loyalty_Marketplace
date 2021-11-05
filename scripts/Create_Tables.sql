CREATE TABLE  "CUSTOMER"
   ( "CUSTOMERID" VARCHAR2(255),
"LASTNAME" VARCHAR2(255),
"FIRSTNAME" VARCHAR2(255),
"ADDRESS" VARCHAR2(255),
"PHONE" VARCHAR2(255),
"WALLETID" VARCHAR2(255)
   )
/
CREATE TABLE  "FREEPRODUCT"
   ( "REWARDID" VARCHAR2(255),
"PRODUCTNAME" VARCHAR2(255),
CONSTRAINT "FREEPRODUCT_PK" PRIMARY KEY ("REWARDID")
   )
/
CREATE TABLE  "GIFTCARD"
   ( "REWARDID" VARCHAR2(255),
"CARDAMOUNT" VARCHAR2(255),
"EXPIARYDATE" DATE,
CONSTRAINT "GIFTCARD_PK" PRIMARY KEY ("REWARDID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "LEAVEREVIEW"
   ( "REVIEWID" VARCHAR2(255),
"LOYALTYID" VARCHAR2(255),
"REVIEW" VARCHAR2(255),
"REVIEWDATE" DATE,
CONSTRAINT "LEAVEREVIEW_PK" PRIMARY KEY ("REVIEWID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "LOYALTYPROGRAM"
   ( "PROGARMID" VARCHAR2(255),
"ACTIVITYID" VARCHAR2(255),
"REWARDID" VARCHAR2(255),
"PROGRAMTYPE" VARCHAR2(255),
CONSTRAINT "LOYALTYPROGRAM_PK" PRIMARY KEY ("PROGARMID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PURCHASE"
   ( "PURCHASEID" VARCHAR2(255),
"ACTIVITYID" VARCHAR2(255),
"AMOUNT" NUMBER,
"GIFTCARDCODE" VARCHAR2(255),
CONSTRAINT "PURCHASE_PK" PRIMARY KEY ("PURCHASEID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "REFERFRIEND"
   ( "NEWCUSTOMERID" VARCHAR2(255),
"LOYALTYID" VARCHAR2(255),
"REFERDATE" DATE,
"CUSTOMERID" VARCHAR2(255),
CONSTRAINT "REFERFRIEND_PK" PRIMARY KEY ("NEWCUSTOMERID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "REGULAR_LOYALTYPROGRAM"
   ( "PROGARMID" VARCHAR2(255),
"LOYALTYPOINTS" VARCHAR2(255),
"RERULEID" VARCHAR2(255),
"RRRULEID" VARCHAR2(255),
CONSTRAINT "REGULAR_LOYALTYPROGRAM_PK" PRIMARY KEY ("PROGARMID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "REWARD"
   ( "REWARDID" VARCHAR2(255),
"REWARDNAME" VARCHAR2(255),
"CATEGORYCODE" VARCHAR2(255),
"BRANDINSTANCEIDENTIFIER" VARCHAR2(255),
"VALUE" VARCHAR2(255),
"REWARDTYPEID" NUMBER,
CONSTRAINT "REWARD_PK" PRIMARY KEY ("REWARDID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "REWARDMAPPING"
   ( "REWARDTYPEID" VARCHAR2(255),
"REWARDTYPENAME" VARCHAR2(255),
CONSTRAINT "REWARDMAPPING_PK" PRIMARY KEY ("REWARDTYPEID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "RE_RULE"
   ( "RULEID" VARCHAR2(255),
"POINTS" VARCHAR2(255),
"ACTIVITYID" VARCHAR2(255),
"REWARDID" VARCHAR2(255),
"VERSION" NUMBER,
CONSTRAINT "RE_RULE_PK" PRIMARY KEY ("RULEID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "RR_RULE"
   ( "RULEID" VARCHAR2(255),
"POINTS" VARCHAR2(255),
"REWARDID" VARCHAR2(255),
"ACTIVITYID" VARCHAR2(255),
"VERSION" NUMBER,
CONSTRAINT "RR_RULE_PK" PRIMARY KEY ("RULEID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "TIERED_LOYALTYPROGRAM"
   ( "PROGRAMID" VARCHAR2(255),
"TIERNAME" VARCHAR2(255),
"RERULEID" VARCHAR2(255),
"RRRULEID" VARCHAR2(255),
"LOYALTYPOINTS" VARCHAR2(255),
"TIERLEVEL" NUMBER,
PRIMARY KEY ("PROGRAMID", "TIERLEVEL")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "WALLET"
   ( "WALLETID" VARCHAR2(255) NOT NULL ENABLE,
"BALANCEID" VARCHAR2(255) NOT NULL ENABLE,
CONSTRAINT "WALLET_PK" PRIMARY KEY ("WALLETID")
  USING INDEX  ENABLE
   )

CREATE TABLE  "BRAND"
   ( 
    "BRANDID" VARCHAR2(255),
    "BRANDNAME" VARCHAR2(255),
    "ADDRESS" VARCHAR2(255),
    "PHONE" VARCHAR2(255),
    "JOIN_DATE" VARCHAR2(255),
    PRIMARY KEY (BRANDID)
   )
CREATE TABLE  "WALLET_TRANSACTIONS"
   ( "WALLETID" VARCHAR2(255),
    "LOYALTY_PROGRAM_ID" VARCHAR2(255),
    "ACTIVITY_ID" VARCHAR2(255),
    "ACTIVITY_DATE" VARCHAR2(255),
    "POINTS" VARCHAR2(255),
    "RE_RULE_CODE" VARCHAR2(255)
   )

   ALTER TABLE BRAND ADD LP_ID VARCHAR2(255);

   
   ALTER TABLE BRAND 
   ADD CONSTRAINT FK_LP_ID
   FOREIGN KEY(LP_ID) REFERENCES LOYALTYPROGRAM(PROGRAMID);

   CREATE TABLE  "REGULAR_LP_ACTIVITY"
   ( "PROGRAMID" VARCHAR2(255),
    "ACTIVITYID" VARCHAR2(255),
    "RERULEID" VARCHAR2(255),
     PRIMARY KEY ("PROGRAMID")
   )

   CREATE TABLE  "REGULAR_LP_REWARDS"
   ( "PROGRAMID" VARCHAR2(255),
    "REWARDID" VARCHAR2(255),
    "RRRULEID" VARCHAR2(255),
     PRIMARY KEY ("PROGRAMID")
   )

   CREATE TABLE  "TIER_LP_ACTIVITY"
   ( "PROGRAMID" VARCHAR2(255),
    "ACTIVITYID" VARCHAR2(255),
    "RERULEID" VARCHAR2(255),
     PRIMARY KEY ("PROGRAMID")
   )
   
   
   CREATE TABLE  "TIER_LP_REWARDS"
   ( "PROGRAMID" VARCHAR2(255),
    "REWARDID" VARCHAR2(255),
    "RRRULEID" VARCHAR2(255),
     PRIMARY KEY ("PROGRAMID")
   )
   
   CREATE TABLE  "LP_TIER_MAPPING"
   ( "LPID" VARCHAR2(255),
    "LP_TIER_ID" VARCHAR2(255),
    "MULTIPLIER" VARCHAR2(255),
    "BASE_POINTS" VARCHAR2(255),
    "TIER_NAME" VARCHAR2(255),
    "PREFERENCE" VARCHAR2(255),
     PRIMARY KEY ("LPID", "LP_TIER_ID")
   )




CREATE TABLE "ACTIVITY"
   ("ACTIVITY_CODE" VARCHAR(255),
   "ACTIVITY_NAME" VARCHAR(255)
   )
   ALTER TABLE LOYALTYPROGRAM ADD RULE_ID VARCHAR(255);
   
   ALTER TABLE LOYALTYPROGRAM
   ADD CONSTRAINT FK_RULE_ID FOREIGN KEY(RULE_ID)
   REFERENCES RE_RULE(RULEID);

SELECT ACTIVITY_NAME FROM ACTIVITY WHERE ACTIVITY_CODE=1

SELECT PROGRAMID FROM LP_ACTIVITY;

SELECT ACTIVITYID FROM LP_ACTIVITY WHERE PROGRAMID='LP1';


select * from ROOT.WALLET_TRANSACTIONS;

select * from ROOT.PURCHASE;

select * from ROOT.LEAVEREVIEW;

select * from ROOT.REFERFRIEND;


Insert into ROOT.LP_ACTIVITY (PROGRAMID, ACTIVITYID, RERULEID) values ('LP4','2',' ');

ALTER TABLE WALLET_TRANSACTIONS
ADD ACTIVITY_NAME varchar(255);

ALTER TABLE PURCHASE
DROP COLUMN ACTIVITYID;

ALTER TABLE PURCHASE
DROP COLUMN AMOUNT;

ALTER TABLE PURCHASE
ADD  LOYALTYID varchar(255);

ALTER TABLE PURCHASE
ADD  AMOUNT varchar(255);

ALTER TABLE PURCHASE
ADD PURCHASE_DATE varchar(255);


ALTER TABLE REFERFRIEND
DROP COLUMN CUSTOMERID;

ALTER TABLE REFERFRIEND
ADD REFERID varchar(255);


ALTER TABLE LOYALTYPROGRAM
DROP COLUMN ACTIVITYID;


ALTER TABLE LOYALTYPROGRAM
DROP COLUMN REWARDID;


ALTER TABLE LOYALTYPROGRAM
ADD LPFLAG varchar(255);


ALTER TABLE REWARD
DROP COLUMN CATEGORYCODE;


ALTER TABLE REWARD
DROP COLUMN BRANDINSTANCEIDENTIFIER;

ALTER TABLE REWARD
DROP COLUMN VALUE;

ALTER TABLE REWARD
DROP COLUMN REWARDTYPEID;


ALTER TABLE REGULAR_LP_REWARDS
ADD QUANTITY varchar(255);

CREATE TABLE  "CUSTOMER_LP_MASTER"
   ( "CUSTOMERID" VARCHAR2(255),
"LPID" VARCHAR2(255),
"TIERID" VARCHAR2(255)
   )
   

ALTER TABLE RE_RULE
DROP COLUMN ACTIVITYID;

ALTER TABLE RE_RULE
DROP COLUMN REWARDID;

ALTER TABLE RR_RULE
DROP COLUMN ACTIVITYID;

ALTER TABLE RR_RULE
DROP COLUMN REWARDID;