-- COPY DATA 1
UPSERT TSPNMIG.REF_ASUMSI SELECT * FROM MIGACB.REF_ASUMSI;
UPSERT TSPNMIG.REF_CASE SELECT * FROM MIGACB.REF_CASE;
UPSERT TSPNMIG.REF_FAKTOR_AKTUARIA SELECT * FROM MIGACB.REF_FAKTOR_AKTUARIA;
UPSERT TSPNMIG.REF_JENIS_HAK SELECT * FROM MIGACB.REF_JENIS_HAK;
UPSERT TSPNMIG.REF_JENIS_PENERIMA_DAPEM SELECT * FROM MIGACB.REF_JENIS_PENERIMA_DAPEM;
UPSERT TSPNMIG.REF_JNSGAJI_IURAN SELECT * FROM MIGACB.REF_JNSGAJI_IURAN;
UPSERT TSPNMIG.REF_JNSKEL(KDJNSKEL, KDSEX, NMJNSKEL, USERIN, TIMESTMP, ISDELETE) SELECT KDJNSKEL, KDSEX, NMJNSKEL, USERIN, TIMESTMP, ISDELETE FROM MIGACB.REF_JNSKEL;
UPSERT TSPNMIG.REF_JNSPREMI SELECT * FROM MIGACB.REF_JNSPREMI;
UPSERT TSPNMIG.REF_JNSSURAT SELECT * FROM MIGACB.REF_JNSSURAT;
UPSERT TSPNMIG.REF_JNSTRANS_DAPEM SELECT * FROM MIGACB.REF_JNSTRANS_DAPEM;
UPSERT TSPNMIG.REF_JNSUZUR SELECT * FROM MIGACB.REF_JNSUZUR;
UPSERT TSPNMIG.REF_JNS_TAGIHAN SELECT * FROM MIGACB.REF_JNS_TAGIHAN;
UPSERT TSPNMIG.REF_MASTER_IURAN SELECT * FROM MIGACB.REF_MASTER_IURAN;
UPSERT TSPNMIG.REF_MSG SELECT * FROM MIGACB.REF_MSG;
UPSERT TSPNMIG.REF_PARAM SELECT * FROM MIGACB.REF_PARAM;
UPSERT TSPNMIG.REF_PERGURUAN_TINGGI SELECT * FROM MIGACB.REF_PERGURUAN_TINGGI;
UPSERT TSPNMIG.REF_PRODI SELECT * FROM MIGACB.REF_PRODI;
UPSERT TSPNMIG.REF_STATUS_WALI SELECT * FROM MIGACB.REF_STATUS_WALI;
UPSERT TSPNMIG.REF_SUMBERCICILAN SELECT * FROM MIGACB.REF_SUMBERCICILAN;
UPSERT TSPNMIG.REF_SUMBERHUTANG SELECT * FROM MIGACB.REF_SUMBERHUTANG;
UPSERT TSPNMIG.REF_MORTALITY SELECT * FROM MIGACB.REF_MORTALITY;
UPSERT TSPNMIG.REF_KPRFEE SELECT * FROM MIGACB.REF_KPRFEE;
UPSERT TSPNMIG.REF_JNSMUTASI SELECT * FROM MIGACB.REF_JNSMUTASI; 

-- ADA DATA DOUBLE
UPSERT TSPNMIG.REF_FORMKLIM(KDPRODUK, KDKLAIM, URAIAN, NORUT, UPDSTAMP, INPUTER, ISMANDATORY) SELECT KDPRODUK, KDKLAIM, URAIAN, NORUT, CURRENT_DATE,'MIGRASI NCB',TRUE FROM MIG_ACB.FORMKLIM;
UPSERT TSPNMIG.REF_SKEP(NOSKEP, TGLSKEP, STSSKEP, KDSKPO, TMTSKEP, TMTREKAM, KDJNSSKEP, KDPENSKEP, TGLTERIMA, UPDSTAMP, INPUTER) SELECT NOSKEP, TGLSKEP, STSSKEP, KDSKPO, TMTSKEP, TMTREKAM, KDJNSSKEP, KDPENSKEP, TGLTERIMA, UPDSTAMP, INPUTER FROM MIG_ACB.SKEP;


    -- INSERT LVL 1 
-- butuh update INSERT INTO TSPNMIG.REF_THP(KDPRODUK, TMT_THPTBL, KDKELOMPOK, PERSEN_PREMI, UPDSTAMP) SELECT JNSPREMI, TMT_THPTBL, KDKELOMPOK, PERSEN_PREMI, UPDSTAMP,'migrasi NCB' FROM MIG_ACB.THP_TBL;

      
      
INSERT INTO TSPNMIG.REF_RETSPTB(KDRETSPTB, NMRETSPTB, UPDSTAMP, INPUTER) SELECT KDRETSPTB, NMRETSPTB, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.RETSPTB_TBL;
INSERT INTO TSPNMIG.REF_SANTUNAN_CACAT(KDCACAT, DESCRIPTION, PROSENTASE, JNSCACAT, UPDSTAMP, INPUTER) SELECT KDCACAT, DESCRIPTION, PROSENTASE, JNSCACAT,CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.SANTUNAN_CACAT;
INSERT INTO TSPNMIG.JENIS_MORTALITA(JNS_MORTALITA, NM_MORTALITA, UPDSTAMP) SELECT JNS_MORTALITA, NM_MORTALITA, UPDSTAMP FROM MIG_ACB.JENIS_MORTALITA;
INSERT INTO TSPNMIG.JENIS_TRANS_KIPI(JNS_TRANS, NM_JNSTRANS) SELECT JNS_TRANS, NM_JNSTRANS FROM MIG_ACB.JENIS_TRANS_KIPI;
INSERT INTO TSPNMIG.MONITOR_KPR(KDKELBAYAR, TGLIMPORT, NMFILE, UPDSTAMP, INPUTER) SELECT KDKELBAYAR, TGLIMPORT, NMFILE, UPDSTAMP, TRIM(INPUTER) FROM MIG_ACB.MONITOR_KPR;
INSERT INTO TSPNMIG.REF_JENIS_KIPI(JENIS, NM_JENIS) SELECT JENIS, NM_JENIS FROM MIG_ACB.JENIS_KI_PI;
INSERT INTO TSPNMIG.REF_AGAMA(KDAGAMA, NMAGAMA, UPDSTAMP) SELECT KDAGAMA, NMAGAMA, UPDSTAMP FROM MIG_ACB.AGAMA_TBL;
INSERT INTO TSPNMIG.ANTARA_TBL(KDHUBKEL, NOTAS, KDANTARA, NIPANTARA, NMTASPEN, NMANTARA, NIPTASPEN, KDCABANG, KDSATKER, UPDSTAMP, KDSSBP, KELSSBP) SELECT KDHUBKEL, NOTAS, KDANTARA, NIPANTARA, NMTASPEN, NMANTARA, NIPTASPEN, KDCABANG, KDSATKER, UPDSTAMP, KDSSBP, KELSSBP FROM MIG_ACB.ANTARA_TBL;
INSERT INTO TSPNMIG.REF_APLIKASI(KDAPL, NMAPL, INPUTER, UPDSTAMP) SELECT KDAPL, NMAPL,'MIGRASI NCB',CURRENT_DATE FROM MIG_ACB.APLIKASI;
UPSERT TSPNMIG.REF_FUNGSI(KDFUNGSI, KDAPL, NMFUNGSI, UPDSTAMP, INPUTER) SELECT KDFUNGSI, KDAPL, NMFUNGSI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.FUNGSI;
INSERT INTO TSPNMIG.REF_ANUITAS(TGLBERLAKU, KDKELOMPOK, KDKLAIM, KDSTRUKTUR, MASAIUR, NILAI, UPDSTAMP, INPUTER) SELECT TGLBERLAKU, KDKELOMPOK, KDKLAIM, KDSTRUKTUR, MASAIUR, NILAI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.ANUITAS_TBL;
INSERT INTO TSPNMIG.REF_ASSIGN_JABATAN(TMT_JABATAN, KODE_KEDUDUKAN, KODE_FUNGSIONAL, BUP, NAMA_FUNGSIONAL, TUNJANGAN_FUNGSIONAL, KODE_FUNGSI, UPDSTAMP, INPUTER) SELECT TMT_JABATAN, KODE_KEDUDUKAN, KODE_FUNGSIONAL, BUP, NAMA_FUNGSIONAL, TUNJANGAN_FUNGSIONAL, KODE_FUNGSI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.ASSIGN_JABATAN;
INSERT INTO TSPNMIG.REF_BAGIAN(KDBAG, KDBIRO, KDDIRJEN, KDINSTANSI, NMBAG, UPDSTAMP, INPUTER) SELECT KDBAG, KDBIRO, KDDIRJEN, KDINSTANSI, NMBAG, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.BAGIAN_TBL;
INSERT INTO TSPNMIG.REF_BENDAHARA(KDBENDAHARA, KDCABANG, NMBENDAHARA, UPDSTAMP, INPUTER) SELECT KDBENDAHARA, KDCABANG, NMBENDAHARA, UPDSTAMP, INPUTER FROM MIG_ACB.BENDAHARA;
INSERT INTO TSPNMIG.REF_BIAYA(TMT_BIAYA, PERSENTASE_BIAYA, UPDSTAMP, INPUTER) SELECT TMT_BIAYA, PERSENTASE_BIAYA, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.BIAYA;
INSERT INTO TSPNMIG .REF_BIRO(KDBIRO, KDDIRJEN, KDINSTANSI, NMBIRO, UPDSTAMP, INPUTER) SELECT KDBIRO, KDDIRJEN, KDINSTANSI, NMBIRO, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.BIRO_TBL;
INSERT INTO TSPNMIG.REF_BUNGA(TMT_BUNGA, TINGKAT_BUNGA, NILAI_BUNGA, BUNGA_KONV_BULANAN, UPDSTAMP, INPUTER) SELECT TMT_BUNGA, TINGKAT_BUNGA, NILAI_BUNGA, BUNGA_KONV_BULANAN, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.BUNGA;
INSERT INTO TSPNMIG.REF_CABANG (KDCABANG, NMCABANG, NICKCABANG, ALMTCABANG, KOTA, KODEPOS, TELEPON, LBLSURAT, JMLRUANG, JMLLAJUR, JMLLEMARI, JMLRAK, JMLBOX, KDWILAYAH, KDCABANGTP, KDDATI1, KDDATI2,NOSURAT, NOSKPP, NOSPR, NMKAS, NOGIRO_THT, NOGIRO_PENS, NOLIMPAH, NOJMN, NPWP, HOST_RFC, KDREFORMASI, HOST_ELO, COSTCENTRE, UPDSTAMP, INPUTER, HOST_ANTRI) SELECT KDCABANG, NMCABANG, NICKCABANG, ALMTCABANG, KOTA, KODEPOS, TELEPON, LBLSURAT, JMLRUANG, JMLLAJUR, JMLLEMARI, JMLRAK, JMLBOX, KDWILAYAH, KDCABANGTP, KDDATI1, KDDATI2,NOSURAT, NOSKPP, NOSPR,  NMKAS, NOGIRO_THT, NOGIRO_PENS, NOLIMPAH,NOJMN, NPWP, HOST_RFC, KDREFORMASI, HOST_ELO, COSTCENTRE,  UPDSTAMP,USER, NULL FROM MIG_ACB.CABANG_TBL;
INSERT INTO TSPNMIG.REF_CABANG_TP(KDCABANGTP, NMCABANGTP, UPDSTAMP, INPUTER) SELECT KDCABANGTP, NMCABANGTP, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.CABANG_TP;
INSERT INTO TSPNMIG.REF_DASARBAYAR(KDSURAT, DESKRIPSI, F1, G1, G2, G3, G4, H1, J1, UPDSTAMP, INPUTER) SELECT KDSURAT, DESKRIPSI, F1, G1, G2, G3, G4, H1, J1, UPDSTAMP, INPUTER FROM MIG_ACB.DASARBAYAR_TBL;
INSERT INTO TSPNMIG.REF_DATI1(KDDATI1, NMDATI1, KTDATI1, TKD, KDTKD, UPDSTAMP) SELECT KDDATI1, NMDATI1, KTDATI1, TKD, KDTKD, UPDSTAMP FROM MIG_ACB.DATI1_TBL;
INSERT INTO TSPNMIG.REF_DATI2(KDDATI2, KDDATI1, NMDATI2, KTDATI2, UPDSTAMP) SELECT KDDATI2, KDDATI1, NMDATI2, KTDATI2, UPDSTAMP FROM MIG_ACB.DATI2_TBL;
INSERT INTO TSPNMIG.REF_DATI3(KDDATI3, KDDATI2, KDDATI1, NMDATI3, KTDATI3, UPDSTAMP) SELECT KDDATI3, KDDATI2, KDDATI1, NMDATI3, KTDATI3, UPDSTAMP FROM MIG_ACB.DATI3_TBL;
INSERT INTO TSPNMIG.REF_DIRJEN(KDDIRJEN, KDINSTANSI, NMDIRJEN, UPDSTAMP, INPUTER) SELECT KDDIRJEN, KDINSTANSI, NMDIRJEN, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.DIRJEN_TBL;
INSERT INTO TSPNMIG.REF_DOKUMEN_TP(KDDOKUMEN, NMDOKUMEN, UPDSTAMP) SELECT KDDOKUMEN, NMDOKUMEN, UPDSTAMP FROM MIG_ACB.DOKUMEN_TP;
INSERT INTO TSPNMIG.REF_ESELON(ECH_ECHCOD, ECH_ECHNAM, ECH_RNKMIN, UPDSTAMP, INPUTER) SELECT ECH_ECHCOD, ECH_ECHNAM, ECH_RNKMIN, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.ESELON;
INSERT INTO TSPNMIG.REF_FAKTOR_PIPNS(TMT_FAKTOR, KDKELOMPOK, MI, NILAI, UPDSTAMP, INPUTER) SELECT TMT_FAKTOR, KDKELOMPOK, MI, NILAI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.FAKTOR_PIPNS;
INSERT INTO TSPNMIG.REF_GROUP_BAYAR(KDGROUP, KDBENDAHARA, KDCABANG, NMGROUP, FAX, ALM_GROUP, KOTA, KODEPOS, TELEPON, UPDSTAMP, INPUTER, NOURUT) SELECT KDGROUP, KDBENDAHARA, KDCABANG, NMGROUP, FAX, ALM_GROUP, KOTA, KODEPOS, TELEPON, UPDSTAMP, INPUTER, NOURUT FROM MIG_ACB.GROUP_BAYAR;
INSERT INTO TSPNMIG.REF_GROUP(KDCABANG, KDBENDAHARA, KDGROUP, KDKELBAYAR, NMGROUPTBL, UPDSTAMP, INPUTER) SELECT KDCABANG, KDBENDAHARA, KDGROUP, KDKELBAYAR, NMGROUPTBL, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.GROUP_TBL;
INSERT INTO TSPNMIG.REF_HITTRANS(TMTHIT, KDHIT, TMT_TRANS, KDTRANS, KETERANGAN_HIT, KODEX, UPDSTAMP, INPUTER) SELECT TMTHIT, KDHIT, TMT_TRANS, KDTRANS, KETERANGAN_HIT, KODEX, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.HITTRANS_TBL;
INSERT INTO TSPNMIG.REF_HITUNG(KDHIT, NMHIT, UPDSTAMP, INPUTER) SELECT KDHIT, NMHIT, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.HITUNG_TBL;
INSERT INTO TSPNMIG.REF_HOLIDAY(TGLHOLIDAY, JNSHOLIDAY, KETERANGAN, UPDSTAMP, INPUTER) SELECT TGLHOLIDAY, JNSHOLIDAY, KETERANGAN, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.HOLIDAY_TBL;
INSERT INTO TSPNMIG.REF_HUBKEL(KDHUBKEL, NMHUBKEL, UPDSTAMP, INPUTER) SELECT KDHUBKEL, NMHUBKEL, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.HUBKEL_TBL;
INSERT INTO TSPNMIG.REF_INFOMITRA(KDSTATUS, KETERANGAN, UPDSTAMP, INPUTER) SELECT KDSTATUS, KETERANGAN, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.INFOMITRA;
INSERT INTO TSPNMIG.REF_INSTANSI(KDINSTANSI, KDINSTANSITP, NMINSTANSI, UPDSTAMP, INPUTER) SELECT KDINSTANSI, KDINSTANSITP, NMINSTANSI, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.INSTANSI;
INSERT INTO TSPNMIG.REF_INSTANSI_BKN(INS_INSKOD, INS_NAMINS, INS_NEWKOD, KODE_LAMA, JENIS, LOKASI, LOKER, INS_KANREG, INS_NAMINSBR, UPDSTAMP, INPUTER) SELECT INS_INSKOD, INS_NAMINS, INS_NEWKOD, KODE_LAMA, JENIS, LOKASI, LOKER, INS_KANREG, INS_NAMINSBR, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.INSTANSI_BKN;
INSERT INTO TSPNMIG.REF_INSTANSI_TP(KDINSTANSITP, NMINSTANSITP, UPDSTAMP, INPUTER) SELECT KDINSTANSITP, NMINSTANSITP, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.INSTANSI_TP;
INSERT INTO TSPNMIG.REF_INTERNAL_ORDER(KDPRODUK, KDKELOMPOK, KDGSBER, NAMA_ORDER) SELECT KDPRODUK, KDKELOMPOK, KDGSBER, NAMA_ORDER FROM MIG_ACB.INTERNAL_ORDER;
INSERT INTO TSPNMIG.REF_JNSPEG(KDJNSPEG, NMJENPEG, KODE, UPDSTAMP, INPUTER) SELECT KDJENPEG, NMJENPEG,1, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.JENPEG_TBL;
INSERT INTO TSPNMIG.REF_JNS_PENERIMA(KDJNSPENERIMA, NMJNSPENERIMA, HAKPEN, UPDSTAMP, INPUTER) SELECT KDJNSPENERIMA, NMJNSPENERIMA, HAKPEN,UPDSTAMP,  'MIGRASI NCB' FROM MIG_ACB.JNS_PENERIMA;
INSERT INTO TSPNMIG.REF_JNS_SKEP(KDJNSSKEP, NMJNSSKEP, UPDSTAMP, INPUTER) SELECT KDJNSSKEP, NMJNSSKEP, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.JNS_SKEP;
INSERT INTO TSPNMIG.REF_JNSBAYAR(JNSBAYAR, KDGROUP, KDBENDAHARA, KDCABANG, NMJNSBAYAR, UPDSTAMP, INPUTER) SELECT JNSBAYAR, KDGROUP, KDBENDAHARA, KDCABANG, NMJNSBAYAR, UPDSTAMP, INPUTER FROM MIG_ACB.JNSBAYAR_TBL;
INSERT INTO TSPNMIG.REF_JNSDAPEM(KDJNSDAPEM, NMJENDAPEM, UPDSTAMP, INPUTER) SELECT KDJNSDAPEM, NMJENDAPEM, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.JNSDAPEM;
INSERT INTO TSPNMIG.REF_JNSHUTANG(KDHUTANG, NMHUTANG, RUTIN, KDTRANS, UPDSTAMP, INPUTER) SELECT KDHUTANG, NMHUTANG, RUTIN, KDTRANS, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.JNSHUTANG;
INSERT INTO TSPNMIG.REF_JNSTRANS(KDJNSTRANS, KDPRODUK, KDKELOMPOK, NMJNSTRANS, UPDSTAMP, INPUTER) SELECT KDJNSTRANS, KDPRODUK, KDKELOMPOK, NMJNSTRANS, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.JNSTRANS;
INSERT INTO TSPNMIG.REF_KASIVA(KDKASIVA, NMKASIVA, KDDATI1) SELECT KDKASIVA, NMKASIVA, KDDATI1 FROM MIG_ACB.KASIVA_TBL;
INSERT INTO TSPNMIG.REF_KASUS(KDKASUS, NMKASUS, UPDSTAMP, INPUTER) SELECT KDKASUS, NMKASUS, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.KASUS_TBL;
INSERT INTO TSPNMIG.REF_KD_TRANSAKSI(KDSTATUS, DESKRISP, UPDSTAMP, INPUTER) SELECT KDSTATUS, DESKRISP, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.KD_TRANSAKSI;
INSERT INTO TSPNMIG.REF_KEJADIAN(KDYMKKEJADIAN, NMKEJADIAN, UPDSTAMP, INPUTER) SELECT KDKEJADIAN, NMKEJADIAN, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.KEJADIAN_TBL;
INSERT INTO TSPNMIG.REF_KEL_KEJADIAN(KDKELJADIAN, NMKELKEJADIAN, UPDSTAMP, INPUTER) SELECT KDKELJADIAN, NMKELKEJADIAN, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.KEL_KEJADIAN;
INSERT INTO TSPNMIG.REF_KELOMPOK_BAYAR(KDKELBAYAR, NMKELBAYAR, UPDSTAMP, HOSTFTP, FOLDER, FDRDOWNLOAD, FDRUPLOAD, F_EDAPEM, TMT_EDAPEM, TMT_LPJ, TMT_UDW, KDVENDOR, OTENTIKASI, F_LPJ, F_UPD_CABANG, TGLPOSTING, DESKRIPSI_EDAPEM, F_PENYALURAN_DAPEM, INPUTER) SELECT KDKELBAYAR, NMKELBAYAR, UPDSTAMP, HOSTFTP, FOLDER, FDRDOWNLOAD, FDRUPLOAD, F_EDAPEM, TMT_EDAPEM, TMT_LPJ, TMT_UDW, KDVENDOR, OTENTIKASI, F_LPJ, F_UPD_CABANG, TGLPOSTING, DESKRIPSI_EDAPEM, 1,'MIGRASI NCB' FROM MIG_ACB.KELOMPOK_BAYAR;
INSERT INTO TSPNMIG.REF_KELOMPOK_GAJI(KDKELOMPOK, NMKELOMPOK, MIN_USIA_MASUK, MAX_USIA_MASUK, TERUSAN, UPDSTAMP, KDNIP, UDW, KDJI, NORUT, TMT_GAPOK1, TMT_GAPOK2, TGLRENBAYAR, TMT_GAPOK3, TGLRENBAYAR3, TMT_PENPOK, TMT_PENPOK1, TMTBYR_PENS, TMTBYR_DPM, INPUTER) SELECT KDKELOMPOK, NMKELOMPOK, MIN_USIA_MASUK, MAX_USIA_MASUK, TERUSAN, UPDSTAMP, KDNIP, UDW, KDJI, NORUT, TMT_GAPOK1, TMT_GAPOK2, TGLRENBAYAR, TMT_GAPOK3, TGLRENBAYAR3, TMT_PENPOK, TMT_PENPOK1, TMTBYR_PENS, TMTBYR_DPM, 'MIGRASI NCB' FROM MIG_ACB.KELOMPOK_GAJI;
INSERT INTO TSPNMIG.REF_TPP_TKD(KDPRODUK, KDKELOMPOK, TMT_TRANS, KDTRANS, PCTSAL, NOMSAL, UPDSTAMP, INPUTER) SELECT KDPRODUK, KDKELOMPOK, TMT_TRANS, KDTRANS, PCTSAL, NOMSAL, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.KELOMPOK_TUN;
INSERT INTO TSPNMIG.REF_KELPENSIUN(KDKELPENSIUN, NMKELPENSIUN, UPDSTAMP, MAK, INPUTER) SELECT KDKELPENSIUN, NMKELPENSIUN, UPDSTAMP, MAK, 'MIGRASI NCB' FROM MIG_ACB.KELPENSIUN_TBL;
INSERT INTO TSPNMIG.REF_KENAIKAN_GAPOK(TMT_BERLAKU, KENAIKAN, UPDSTAMP, INPUTER) SELECT TMT_BERLAKU, KENAIKAN, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.KENAIKAN_GAPOK;
INSERT INTO TSPNMIG.REF_KLAIM(KDKLAIM, KDJNSTRANS, KDPRODUK, KDKELOMPOK, NMKLAIM, NMSHORT, UPDSTAMP, INPUTER) SELECT KDKLAIM, KDJNSTRANS, KDPRODUK, KDKELOMPOK, NMKLAIM, NMSHORT, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.KLAIM;
INSERT INTO TSPNMIG.REF_KLAIM_PERSYARATAN(KDKLAIM, KDJNSTRANS, KDPRODUK, NMKLAIM, NMSHORT, UPDSTAMP, INPUTER) SELECT KDKLAIM, KDJNSTRANS, KDPRODUK, NMKLAIM, NMSHORT, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.KLAIM_PERSYARATAN;
INSERT INTO TSPNMIG.REF_KODEPOS(KODEPOS, NOURUT, NMKODEPOS, UPDSTAMP, INPUTER) SELECT KODEPOS, NOURUT, NMKODEPOS, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.KODEPOS_TBL;
INSERT INTO TSPNMIG.REF_KONSTANTA(NOMOR, KONSTANTA, DESCRIPTION, TMT_JABATAN, MAX, NOURUT, UPDSTAMP, INPUTER) SELECT NOMOR, KONSTANTA, DESCRIPTION, TMT_JABATAN, MAX, NOURUT, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.KONSTANTA_TBL;
INSERT INTO TSPNMIG.REF_KONV_DAPEM(KDJNSDAPEM, KDJNSPENSIUN, KETERANGAN, UPDSTAMP, INPUTER) SELECT KDJNSDAPEM, KDJNSPENSIUN, KETERANGAN, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.KONV_DAPEM;
INSERT INTO TSPNMIG.REF_KPKN(KDKPKN, KDKPPN, NMKPKN, ALM_KPKN, KOTA, KODEPOS, TELEPON, NOREK, JENIS, KDKASIVA, UPDSTAMP, BANK, KDCABANG, INPUTER) SELECT KDKPKN, KDKPPN, NMKPKN, ALM_KPKN, KOTA, KODEPOS, TELEPON, NOREK, JENIS, KDKASIVA, UPDSTAMP, BANK, KDCABANG, 'MIGRASI NCB' FROM MIG_ACB.KPKN_TBL;
INSERT INTO TSPNMIG.REF_LAMPIRAN_SK(NMLAMPIRAN, KDJNSTRANS, KDPRODUK, KDKELOMPOK, KDKLAIM, MANDATORI, ASLI, LEMBAR, UPDSTAMP, INPUTER) SELECT NMLAMPIRAN, KDJNSTRANS, KDPRODUK, KDKELOMPOK, KDKLAIM, MANDATORI, ASLI, LEMBAR, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.LAMPIRAN_SK;
INSERT INTO TSPNMIG.REF_LAMPIRANFORMULIR(KDLAMPIRAN, NMLAMPIRAN, UPDSTAMP, INPUTER) SELECT KDLAMPIRAN, NMLAMPIRAN, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.LAMPIRANFORMULIR;
INSERT INTO TSPNMIG.REF_LAMPIRAN_SPP(TGLKLAIM, KDHUBKEL, NOTAS, KDJNSTRANS, KDPRODUK, KDKELOMPOK, KDLAMPIRAN, UPDSTAMP, INPUTER) SELECT TGLKLAIM, KDHUBKEL, NOTAS, KDJNSTRANS, KDPRODUK, KDKELOMPOK, KDLAMPIRAN, UPDSTAMP, INPUTER FROM MIG_ACB.LAMPIRANSPP;
INSERT INTO TSPNMIG.REF_MAP_PAJAK(MAP, DESKIRPSI, UPDSTAMP, INPUTER) SELECT MAP, DESKIRPSI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.MAP_PAJAK;
INSERT INTO TSPNMIG.REF_MAP(KDMAP, JNS_MAP, URAIAN, UPDSTAMP, INPUTER) SELECT KDMAKP, JNS_MAKP, URAIAN, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.MAP_TBL;
INSERT INTO TSPNMIG.REF_MEMFILE(KDCABANG, KDPRODUK, TAHUN, NOVOUCHER, NOCEKPOS, UPDSTAMP, INPUTER) SELECT KDCABANG, KDPRODUK, TAHUN, NOVOUCHER, NOCEKPOS, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.MEMFILE;
INSERT INTO TSPNMIG.REF_MISC(UPDDATE, JABPCT, JABMAX, PSNPCT, PSNMAX,  SELF, COUPLE, DEPEND, DEPENDMAX, SHF11, SHF12, SHF13, SHF21, SHF22, SHF23, SHF31, SHF32, SHF33, VACBON, THRBON, REMOTE_1, REMOTE_2, REMOTE_3, STBYN, STBYS, STBYH, ASTEK, ASTEK_COY, WHR_MONTH, DAY_MONTH, OVTWKD, OVTNWKD, OVTNWKD7, INSURANCE, THT, THT_COY, PHT, PHT_COY, AKTK, AKTK_COY, BC, BC_COY, KDUPD, TGLINP, USERINP, TGLOTO, USEROTO, OVT1, OVT2, OVT3, GANTI, PTKPT, TAXSUB, TAXMAX, OPTSHIFT, UPDSTAMP, INPUTER) SELECT UPDDATE, JABPCT, JABMAX, PSNPCT, PSNMAX, SELF, COUPLE, DEPEND, DEPENDMAX, SHF11, SHF12, SHF13, SHF21, SHF22, SHF23, SHF31, SHF32, SHF33, VACBON, THRBON, REMOTE_1, REMOTE_2, REMOTE_3, STBYN, STBYS, STBYH, ASTEK, ASTEK_COY, WHR_MONTH, DAY_MONTH, OVTWKD, OVTNWKD, OVTNWKD7, INSURANCE, THT, THT_COY, PHT, PHT_COY, AKTK, AKTK_COY, BC, BC_COY, KDUPD, TGLINP, USERINP, TGLOTO, USEROTO, OVT1, OVT2, OVT3, GANTI, PTKPT, TAXSUB, TAXMAX, OPTSHIFT, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.MISC_TBL;
INSERT INTO TSPNMIG.REF_NODOSIR_PUNAH(KDCABANG, KDPRODUK, NODOSIR, UPDSTAMP, NODOSIR_B, INPUTER) SELECT KDCABANG, KDPRODUK, NODOSIR, UPDSTAMP, NODOSIR_B,'MIGRASI NCB' FROM MIG_ACB.NODOSIR_PUNAH;
INSERT INTO TSPNMIG.REF_NODOSIR(KDCABANG, KDPRODUK, NODOSIR, UPDSTAMP, INPUTER) SELECT KDCABANG, KDPRODUK, NODOSIR, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.NODOSIR_TBL;
INSERT INTO TSPNMIG.REF_PENERBIT_SKEP(KDPENSKEP, ALM_PNBTSKEP, KOTA, KODEPOS, TELEPON, KEPADA_AJUAN, UPDSTAMP, INPUTER) SELECT KDPENSKEP, ALM_PNBTSKEP, KOTA, KODEPOS, TELEPON, KEPADA_AJUAN, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.PENERBIT_SKEP;
INSERT INTO TSPNMIG.REF_POS(KODEPOS, NOURUT, NMKODEPOS, UPDSTAMP, INPUTER) SELECT KODEPOS, NOURUT, NMKODEPOS, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.POS_TBL;
INSERT INTO TSPNMIG.REF_PRODUK(KDPRODUK, NMPRODUK, TMTPRODUK, UPDSTAMP, TYPE_VOUCHER, DAPEM, INPUTER) SELECT KDPRODUK, NMPRODUK, TMTPRODUK, UPDSTAMP, KDPROGRAM, DAPEM,'MIGRASI NCB' FROM MIG_ACB.PRODUK;
INSERT INTO TSPNMIG.REF_PROGRAM(KODE_AREA, NMPROGRAM, TYPE_VOUCHER, NMPRODUK, TMTPROGRAM, UPDSTAMP, INPUTER) SELECT KDPROGRAM, NMPROGRAM, TYPE_VOUCHER, NMPRODUK, TMTPROGRAM, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.PROGRAM;
INSERT INTO TSPNMIG.REF_SANTUNAN_STOP(KDSTOP, NMSTOP, UPDSTAMP, INPUTER) SELECT KDSTOP, NMSTOP, UPDSTAMP, INPUTER FROM MIG_ACB.SANTUNAN_STOP;
INSERT INTO TSPNMIG.REF_SATKER_HUTANG(KDKEMENTRIAN, NMKEMENTRIAN, KD_ESELON, KD_SATKER, NM_SATKER, KDINST, NMINSTANSI, UPDSTAMP, INPUTER) SELECT KDKEMEN, NAMA_KEMENTRIAN, KD_ESELON, KD_SATKER, NM_SATKER, KDINST, NMINSTANSI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.SATKER_HUTANG;
INSERT INTO TSPNMIG.REF_SETORAN_KASNEG(KODE_SATKER, NAMA_SATKER, NAMA_KEMENTRIAN, KDMAP, NTPN, NO_SETOR, TGL_SETOR, NOMINAL, KDCABANG, JNS_SETOR, UPDSTAMP, INPUTER) SELECT KODE_SATKER, NAMA_SATKER, NAMA_KEMENTRIAN, KDMAP, NTPN, NO_SETOR, TGL_SETOR, NOMINAL, KDCAB, JNS_SETOR, UPDSTAMP, INPUTER FROM MIG_ACB.SETORAN_KASNEG;
INSERT INTO TSPNMIG.REF_SIFAT_POKOK(KDSIFATPOK, NMSIFATPOK, UPDSTAMP) SELECT KDSIFATPOK, NMSIFATPOK, UPDSTAMP FROM MIG_ACB.SIFAT_POKOK;
INSERT INTO TSPNMIG.REF_SIMGAJI(KDCABANG, KDDATI1, KDDATI2, NMDATI2, SOSIALISASI, WORKSHOP, PARALEL, IMPLEMENTASI, PKS, KETERANGAN, INTEGRASI, UPDSTAMP, INPUTER) SELECT KDCABANG, KDDATI1, KDDATI2, NMDATI2, SOSIALISASI, WORKSHOP, PARALEL, IMPLEMENTASI, PKS, KETERANGAN, INTEGRASI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.SIMGAJI;
INSERT INTO TSPNMIG.REF_STAPEG(KDSTAPEG, NMSTAPEG, UPDSTAMP, INPUTER) SELECT KDSTAPEG, NMSTAPEG, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.STAPEG_TBL;
INSERT INTO TSPNMIG.REF_STAWIN(KDSTAWIN, NMSTAWIN, UPDSTAMP) SELECT KDSTAWIN, NMSTAWIN, UPDSTAMP FROM MIG_ACB.STAWIN_TBL;
INSERT INTO TSPNMIG.REF_STS_DAMU(KDSTSDAMU, NMSTSDAMU, UPDSTAMP, INPUTER) SELECT KDSTSDAMU, NMSTSDAMU, UPDSTAMP, INPUTER FROM MIG_ACB.STS_DAMU;
INSERT INTO TSPNMIG.REF_STS_STOP(KDSTOP, NMSTOP, UPDSTAMP, INPUTER) SELECT KDSTOP, NMSTOP, UPDSTAMP, INPUTER FROM MIG_ACB.STS_STOP;
INSERT INTO TSPNMIG.REF_SUMBER_SPP(KD_SUMBER_SPP, NM_SUMBER_SPP) SELECT KD_SUMBER_SPP, NM_SUMBER_SPP FROM MIG_ACB.SUMBER_SPP;
INSERT INTO TSPNMIG.SURAT_PENGANTAR(NOSURANTAR, TGLSURATANTAR, KDCABANG, KDPENSKEP, UPDSTAMP, INPUTER) SELECT NOSURANTAR, TGLSURATANTAR, KDCABANG, KDPENSKEP, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.SURAT_PENGANTAR;
INSERT INTO TSPNMIG.REF_SYARATKLIM(KDPRODUK, KDKELOMPOK, KDJNSTRANS, KDKLAIM, KDLAMPIRAN, MANDATORI) SELECT KDPRODUK, KDKELOMPOK, KDJNSTRANS, KDKLAIM, KDLAMPIRAN, MANDATORI FROM MIG_ACB.SYARATKLIM;
INSERT INTO TSPNMIG.REF_TANDAJASA(KDTNDJASA, NMTNDJASA, TERUSAN, UPDSTAMP, INPUTER) SELECT KDTNDJASA, NMTNDJASA, TERUSAN, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.TANDAJASA_TBL;
INSERT INTO TSPNMIG.REF_TANGGAL_LKO(TMT_AWAL, TAT_AKHIR, TGLRENCANA_BAYAR) SELECT TMT_AWAL, TAT_AKHIR, TGLRENCANA_BAYAR FROM MIG_ACB.TANGGAL_LKO;
INSERT INTO TSPNMIG.REF_TAX(TMTBERLAKU, TAXSEQ, INCOME_LIMIT, TAXLIMIT, PERCENT, INCOME_MIN, KDUPD, TGLINP, USERINP, TGLOTO, USEROTO, TAXSLIMIT, PERCENTS, INCOME_MINS, UPDSTAMP, INPUTER) SELECT TMTBERLAKU, TAXSEQ, INCOME_LIMIT, TAXLIMIT, PERCENT, INCOME_MIN, KDUPD, TGLINP, USERINP, TGLOTO, USEROTO, TAXSLIMIT, PERCENTS, INCOME_MINS, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.TAX_TBL;
INSERT INTO TSPNMIG.REF_TBL_BUNGA(TMT_BERLAKU, NILAI, NILAI1, BUNGA) SELECT TMT_BERLAKU, NILAI, NILAI1, BUNGA FROM MIG_ACB.TBL_BUNGA;
INSERT INTO TSPNMIG.REF_THP_KLAIM(TMT_THPKLAIM, KDKELOMPOK, RGAPOK, RINSTRI, RANAK, RPERUS, RSTRUK, UPDSTAMP) SELECT TMT_THPKLAIM, KDKELOMPOK, RGAPOK, RINSTRI, RANAK, RPERUS, RSTRUK, UPDSTAMP FROM MIG_ACB.THP_KLAIM;
INSERT INTO TSPNMIG.REF_TRANS(TMT_TRANS, KDTRANS, NMTRANS, DKTRANS, KDPRODUK, TRRUTIN, REFSAL, INSCALC, UDW, NOMINAL, UPDSTAMP, NORUT, REFINS, TMT_EFEKTIF, TMT_DAPEM, INPUTER) SELECT TMT_TRANS, KDTRANS, NMTRANS, DKTRANS, KDPRODUK, TRRUTIN, REFSAL, INSCALC, UDW, NOMINAL, UPDSTAMP, NORUT, REFINS, TMT_EFEKTIF, TMT_DAPEM, 'MIGRASI NCB' FROM MIG_ACB.TRANS_TBL;
INSERT INTO TSPNMIG.REF_TRANS_JKKJKM(TMT_TRANS, KDTRANS, NMTRANS, DKTRANS, KDPRODUK, KDJNSTRANS, PROSENTASE, PENGALI, TARIF, MAKSIMAL, TARIFSD, TARIFSMP, TARIFSMA, TARIFMAHASISWA, BERKALA, BLNBERKALA, TMT_EFEKTIF, TMT_DAPEM, NORUT, UPDSTAMP, INPUTER, ANGKUTDARAT, ANGKUTLAUT, ANGKUTUDARA) SELECT TMT_TRANS, KDTRANS, NMTRANS, DKTRANS, KDPRODUK, KDJNSTRANS, PROSENTASE, PENGALI, TARIF, MAKSIMAL, TARIFSD, TARIFSMP, TARIFSMA, TARIFMAHASISWA, BERKALA, BLNBERKALA, TMT_EFEKTIF, TMT_DAPEM, NORUT, UPDSTAMP, INPUTER, ANGKUTDARAT, ANGKUTLAUT, ANGKUTUDARA FROM MIG_ACB.TRANSTBL_JKKJKM;
INSERT INTO TSPNMIG.REF_TUNJANGAN_CACAT(KDCACAT, DESCRIPTION, PROSENTASE, UPDSTAMP, INPUTER) SELECT KDCACAT, DESCRIPTION, PROSENTASE, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.TUNJANGAN_CACAT;
INSERT INTO TSPNMIG.REF_UKP(KDUKP, NMUKP) SELECT KD_UKP, NM_UKP FROM MIG_ACB.UKP_TBL;
INSERT INTO TSPNMIG.REF_VACUM(KDVACUM, NMVAKUM, UPDSTAMP, INPUTER) SELECT KDVACUM, NMVAKUM, UPDSTAMP, INPUTER FROM MIG_ACB.VACUM_TBL;
INSERT INTO TSPNMIG.REF_WLY_KERJA(KDCABANG, KDDATI1, KDDATI2, NMDATI2, UPDSTAMP, INPUTER) SELECT KDCABANG, KDDATI1, KDDATI2, NMDATI2, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.WILAYAH_KERJA;
INSERT INTO TSPNMIG.REF_WILAYAH(KDWILAYAH, NMWILAYAH) SELECT KDWILAYAH, NMWILAYAH FROM MIG_ACB.WILAYAH_TBL;
INSERT INTO TSPNMIG.REF_WORKFLOW(KDFLOW, NMFLOW, KETERANGAN, UPDSTAMP, INPUTER) SELECT KDFLOW,  NMFLOW, KETERANGAN, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.WORKFLOW_TBL;

--- LEVEL 2
INSERT INTO TSPNMIG.REF_RUMAH_SAKIT SELECT * FROM MIGACB.REF_RUMAH_SAKIT;
INSERT INTO TSPNMIG.REF_FAKTOR(TMT_FAKTOR, TAHUN_MI, KDKELOMPOK, MASAIURAN, NILAI, NILAI1, UPDSTAMP, KDPRODUK, NILAI2, INPUTER) SELECT TMT_FAKTOR, TAHUN_MI, KDKELOMPOK, MASAIURAN, NILAI, NILAI1, UPDSTAMP, KDPRODUK, NILAI2, 'MIGRASI NCB' FROM MIG_ACB.FAKTOR_TBL;
INSERT INTO TSPNMIG.REF_FORMULAKLIM(TMT_FORMULA, KDYMKKEJADIAN, KDKELJADIAN, KDKLAIM, KDPRODUK, KDKELOMPOK, KOOFISIEN1, KOOFISIEN2, ASKEM, FAKTOR1, FAKTOR2, MANFAAT_MINIMAL, ASKEM_MINIMAL, URAIAN_FORMULA, KETERANGAN, UPDSTAMP, INPUTER) SELECT TMT_FORMULA, KDKEJADIAN, KDKELJADIAN, KDKLAIM, KDPRODUK, KDKELOMPOK, KOOFISIEN1, KOOFISIEN2, ASKEM, FAKTOR1, FAKTOR2, MANFAAT_MINIMAL, ASKEM_MINIMAL, URAIAN_FORMULA, KETERANGAN, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.FORMULA_KLIM;
INSERT INTO TSPNMIG.REF_HAKUDW(TMT_HAKUDW, KDJNSPENERIMA, KDKELOMPOK, NILAI_UDW, UPDSTAMP, INPUTER) SELECT TMT_HAKUDW, KDJNSPENERIMA, KDKELOMPOK, NILAI_UDW, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.HAKUDW_TBL;
INSERT INTO TSPNMIG.REF_JNSSETORPAJAK(MAP, JENIS_SETORAN, JNS_PAJAK, DESKRIPSI, UPDSTAMP, INPUTER) SELECT MAP, JENIS_SETORAN, JNS_PAJAK, DESKRIPSI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.JNS_SETOR_PAJAK;
INSERT INTO TSPNMIG.REF_JURU_BAYAR(KDKANBYR, JNSBAYAR, KDGROUP, KDBENDAHARA, KDCABANG, NMKANBYR, ALM_JRBYR, KODEPOS, TELEPON, KDDATI2, KDDATI1, UPDSTAMP, INPUTER, NOURUT, KDBACKUPDPM, KDCEKPOS, KDKELBAYAR, KODE, KDJURUBAYAR, KDKPKN, STATUS) SELECT KDKANBYR, JNSBAYAR, KDGROUP, KDBENDAHARA, KDCABANG, NMKANBYR, ALM_JRBYR, KODEPOS, TELEPON, KDDATI2, KDDATI1, UPDSTAMP, INPUTER, NOURUT, KDBACKUPDPM, KDCEKPOS, KDKELBAYAR, KODE, KDJURUBAYAR, KDKPKN, STATUS FROM MIG_ACB.JURU_BAYAR;
INSERT INTO TSPNMIG.REF_KONV_PENSIUN(KDJNSPENSIUN, KETERANGAN, KDJNSHAK, KDKELOMPOK, KDSUBKELPOK, KDKELPENSIUN, KDJNSPENERIMA, SHARINGDANA, UPDSTAMP, KDPTKAI, INPUTER) SELECT KDJNSPENSIUN, KETERANGAN, KDJNSHAK, KDKELOMPOK, KDSUBKELPOK, KDKELPENSIUN, KDJNSPENERIMA, SHARINGDANA, UPDSTAMP, KDPTKAI, 'MIGRASI NCB' FROM MIG_ACB.KONV_PENSIUN;
INSERT INTO TSPNMIG.REF_KTRBYR_SETOR(NOKTRSETOR, TGLKTRSETOR, KDKANBYR, JNSBAYAR, KDGROUP, KDBENDAHARA, KDCABANG, UPDSTAMP, INPUTER) SELECT NOKTRSETOR, TGLKTRSETOR, KDKANBYR, JNSBAYAR, KDGROUP, KDBENDAHARA, KDCABANG, UPDSTAMP, INPUTER FROM MIG_ACB.KTRBYR_SETOR;
INSERT INTO TSPNMIG.REF_MINIMAL_HAK(KDKELOMPOK, KDPRODUK, KDKLAIM, TMT_BERLAKU, NILAI, UPDSTAMP, INPUTER) SELECT KDKELOMPOK, KDPRODUK, KDKLAIM, TMT_BERLAKU, NILAI, CURRENT_DATE,'MIGRASI NCB' FROM MIG_ACB.MINIMAL_HAK;
INSERT INTO TSPNMIG.REF_PANGKAT(KDPANGKAT, KDKELOMPOK, NMPANGKAT, NMSHORT, KDKONV, UPDSTAMP, INPUTER) SELECT KDPANGKAT, KDKELOMPOK, NMPANGKAT, NMSHORT, KDKONV, UPDSTAMP,'MIGRASI NCB' FROM MIG_ACB.PANGKAT_TBL;
INSERT INTO TSPNMIG.REF_PENPOK(MASKER, JMLANAK, TMT_PENPOK, KDJNSPENERIMA, KDPANGKAT, KDKELOMPOK, KDSIFATPOK, PENPOK, UPDSTAMP, MASKER_LAST, INPUTER) SELECT MASKER, JMLANAK, TMT_PENPOK, KDJNSPENERIMA, KDPANGKAT, KDKELOMPOK, KDSIFATPOK, PENPOK, UPDSTAMP, MASKER_LAST, 'MIGRASI NCB' FROM MIG_ACB.PENPOK_TBL;
INSERT INTO TSPNMIG.REF_SSBP(KDCABANG, KELSSBP, KDKPKN, KDSSBP, NMSSBP, KDDATI1, KDDATI2, KDKELOMPOK, NEWCUST, OLDCUST_ASS, OLDCUST_PENS, ID_ASS, ID_PENS, FLAG, TMTBERLAKU, ID_JKK, ID_JKM, UPDSTAMP, INPUTER) SELECT KDCABANG, KELSSBP, KDKPKN, KDSSBP, NMSSBP, KDDATI1, KDDATI2, KDKELOMPOK, NEWCUST, OLDCUST_ASS, OLDCUST_PENS, ID_ASS, ID_PENS, FLAG, TMTBERLAKU, ID_JKK, ID_JKM, UPDSTAMP, INPUTER FROM MIG_ACB.SSBP_TBL WHERE NMSSBP IS NOT NULL;
INSERT INTO TSPNMIG.REF_GAPOK(MASKER, TMT_GAPOK, KDPANGKAT, KDKELOMPOK, NILAI_BAWAH, NILAI_ATAS, UPDSTAMP, INPUTER) SELECT MASKER, TMT_GAPOK, KDPANGKAT, KDKELOMPOK, NILAI_BAWAH, NILAI_ATAS, UPDSTAMP, 'MIGRASI NCB' FROM MIG_ACB.GAPOK_TBL;

-- INNER JOIN
INSERT INTO      TSPNMIG.REF_SKPD(KDCABANG, KDSSBP, KDSKPD, NMSKPD, UPDSTAMP, INPUTER, KELSSBP) SELECT A.KDCABANG, A.KDSSBP, A.KDSKPD, A.NMSKPD, A.UPDSTAMP, A.INPUTER, A.KELSSBP FROM MIG_ACB.SKPD_TBL  A inner join TSPNMIG.REF_SSBP b on a.KDCABANG = b.KDCABANG and a.KELSSBP = b.KELSSBP and a.KDSSBP = b.KDSSBP;
INSERT INTO      TSPNMIG.REF_SATKER(KDSATKER, KDBAG, KDBIRO, KDDIRJEN, KDINSTANSI, KDDATI4, KDDATI3, KDDATI2, KDDATI1, NMSATKER, KDKPKN, ALAMAT, NOTELP, UPDSTAMP, KDCABANG, INPUTER, KDSKPD, KDSSBP, SATKERPEMDA, KELSSBP) SELECT KDSATKER, KDBAG, KDBIRO, KDDIRJEN, KDINSTANSI, KDDATI4, KDDATI3, KDDATI2, KDDATI1, NMSATKER, KDKPKN, ALAMAT, NOTELP, A.UPDSTAMP, A.KDCABANG, A.INPUTER, A.KDSKPD, A.KDSSBP, A.SATKERPEMDA, A.KELSSBP FROM MIG_ACB.SATKER_TBL as A INNER JOIN TSPNMIG.REF_SKPD B ON
A.KDCABANG = B.KDCABANG AND A.KDSSBP   = B.KDSSBP   AND A.KDSKPD   = B.KDSKPD   AND A.KELSSBP  = B.KELSSBP ;

INSERT INTO TSPNMIG.REF_DATI4 (KDDATI4, KDDATI3, KDDATI2, KDDATI1, NMDATI4, UPDSTAMP)
SELECT KDDATI4, KDDATI3, KDDATI2, KDDATI1, NMDATI4, UPDSTAMP FROM
    (SELECT KDDATI4, A.KDDATI3, A.KDDATI2, A.KDDATI1, NMDATI4, A.UPDSTAMP, ROW_NUMBER() OVER (PARTITION BY KDDATI4, A.KDDATI3, A.KDDATI2, A.KDDATI1 ORDER BY A.UPDSTAMP DESC) AS row_num FROM MIG_ACB.DATI4_TBL A INNER JOIN REF_DATI3 B ON A.KDDATI3 = B.KDDATI3 AND A.KDDATI2 = B.KDDATI2 AND A.KDDATI1 = B.KDDATI1 )
WHERE ROW_NUM =1;

INSERT INTO TSPNMIG.REF_DANA(KDCABANG, KDPRODUK, KDVOUCHER, KDDANA, NMDANA, STATUS, UPDSTAMP, INPUTER)
SELECT KDCABANG, KDPRODUK, KDVOUCHER, KDDANA, NMDANA, STATUS, UPDSTAMP, 'migrasi NCB' FROM 
    ( SELECT KDCABANG, KDPRODUK, KDVOUCHER, KDDANA, NMDANA, STATUS, UPDSTAMP,ROW_NUMBER() OVER (PARTITION BY KDCABANG, KDPRODUK, KDVOUCHER, KDDANA ORDER BY UPDSTAMP DESC) AS row_num FROM MIG_ACB.DANA_TBL ) 
WHERE row_num =1;





