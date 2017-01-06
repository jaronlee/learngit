-----------------------------------------------------------------------------------
-- $Header: JEI_XXWIP_JOBS_DATA_LOAD.ctl V1.2 2016/06/28 Awin cw Wei $
-- $Header: Bug fixing as per PC & CNS Barcode project $
--
--  Filename     :   jei_xxwip_discrete_jobs.ctl
--
--  Description :  This SQL*Loader file loads the discrete jobs from .csv flat file
--		           into table xxwip_discrete_jobs table.
--
--  Modification Log:
--
--  Author                 Date                Version          Changes
--  -----------------     -----------          ----------       ---------------------------------------------
--  Wei Li                07-Jul-2006           1.0              Created
--  Awin cw Wei           24-Aug-2012           1.1              Added SART_DATE column as per Parlex project 
--  Awin cw Wei           28-Jun-2016           1.2              Added below New columns As PC & CNS Barcode Project - 
--                                                               Sequence,Capacity,Machine, Mould,Tap,JE GD Flag & Remark
--  Hand                  23-Dec-2016           1.3              Fix Bug for Chinese can not display 
-----------------------------------------------------------------------------------
OPTIONS(
ERRORS=5000
)
LOAD DATA
-- Added by hand for PC & CNS Project@2016-12-23 Begin
CHARACTERSET ZHS16GBK
-- Added by hand for PC & CNS Project@2016-12-23 End
TRUNCATE
INTO TABLE XXWIP.XXWIP_DISCRETE_JOBS
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(ITEM_CODE 		 		  "TRIM(:ITEM_CODE)",
START_QUANTITY		  FLOAT EXTERNAL,
COMPLETION_DATE 	  DATE "YYYY/MM/DD",
COMPLETION_SUBINV	  "REPLACE(TRIM(:COMPLETION_SUBINV),CHR(13),'')",
START_DATE			    "TO_DATE(REPLACE(TRIM(:START_DATE),CHR(13),''),'YYYY/MM/DD')" ,
SEQUENCE            FLOAT EXTERNAL "TRIM( chr(10) from (TRIM(chr(13) from TRIM(:SEQUENCE))))",
CAPACITY            CHAR "TRIM( chr(10) from (TRIM(chr(13) from TRIM(:CAPACITY))))",
MACHINE             CHAR "TRIM( chr(10) from (TRIM(chr(13) from TRIM(:MACHINE))))",
MOULD               CHAR "TRIM( chr(10) from (TRIM(chr(13) from TRIM(:MOULD))))",
TAP                 CHAR "TRIM( chr(10) from (TRIM(chr(13) from TRIM(:TAP))))",
REMARK              CHAR "TRIM( chr(10) from (TRIM(chr(13) from TRIM(:REMARK))))"
)
