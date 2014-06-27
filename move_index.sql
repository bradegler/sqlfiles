alter index TREXONE_DATA.XIF18RX rebuild tablespace TRXB_INDX01 initrans 16 pctfree 5 compute statistics parallel (degree 16);
alter index TREXONE_DATA.XIF18RX no parallel;