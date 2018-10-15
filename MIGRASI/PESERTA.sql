UPSERT TSPNMIG.PESERTA
SELECT  A.KDHUBKEL,  A.NOTAS,  A.NIP,  A.NO_KPE,  A.NAMA,  A.JNSKEL,  A.TGLLHR,  A.TMT_KERJA,  A.TMT_TASPEN,  A.TGLWAFAT,  A.TGLPMK,  COALESCE(A.KDKELOMPOK,22) KDKELOMPOK,  COALESCE(A.KDJNSPEG,'99') KDJENPEG,  COALESCE(A.KDPANGKAT,'VA') KDPANGKAT,  COALESCE(A.MASKER,0) MASKER,  COALESCE(A.KDKEDUDUKAN,999) KDKEDUDUKAN,  A.BUP,  COALESCE(A.GAPOK,0) GAPOK,  COALESCE(A.GAPOK_97,0) GAPOK97,  COALESCE(A.KDSTAPEG,23) KDSTAPEG,  COALESCE(A.PERSENGAPOK,100) PERSENGAPOK,  A.TMT_GAPOK,  A.TMT_GAPOK_TBL,  A.KDJIWA_AKTIF,  A.NILAI_THP,  CASE  WHEN A.KDSTAPEG <= 20  AND   A.KDKELOMPOK IN (1,2,3,27) THEN  ROUND(A.GAPOK_97 +(A.GAPOK_97 * ISTRI * 0.10) +(GAPOK_97 * ANAK * 0.02),0)   ELSE ROUND(A.NILAI_THP_97,0)        END NILAI_THP_97,  A.BLTHGAJI,  A.KDREG,  A.TGLREG,  A.NOREG,  A.KDSATKER,  A.ALAMAT,  A.LOKASI_ALAMAT,  A.NOCROSSDEF,  A.JNSUZUR,  A.NIK,  A.NPWP,  COALESCE(A.KDDOKUMEN,0) KDDOKUMEN,  A.KETERANGAN,  A.KDCABANG,  COALESCE(A.INPUTER,'MIGRASI NCB') INPUTER,  A.UPDSTAMP,0 IURAN_THT,0 IURAN_PENSIUN,0 IURAN_JKK,0 IURAN_JKM,0 FLAG_IURAN,0 GAPOK_2015,0 NILAI_THP_2015
FROM 
	(
		SELECT  '00' KDHUBKEL, NOTAS, A.NIP, A.NO_KPE, A.NAMA, A.JNSKEL, A.TGLLHR, A.TMT_KERJA, A.TMT_TASPEN, A.TGLWAFAT, A.TGLPMK, A.KDKELOMPOK, A.KDJNSPEG, A.KDPANGKAT, A.MASKER, A.KDKEDUDUKAN, A.BUP, A.GAPOK, 
		CASE  WHEN KDSTAPEG > 20 THEN (SELECT MAX(Z.GAPOK97) FROM  TSPNMIG.PERHITUNGAN_THT Z WHERE Z.NOTAS=A.NOTAS )   
		ELSE   (SELECT MIN(B.NILAI_BAWAH) FROM  MIG_ACB.GAPOK_TBL B WHERE B.TMT_GAPOK='1997-01-01'    AND B.KDPANGKAT=A.KDPANGKAT AND B.MASKER=A.MASKER )  END GAPOK_97,A.KDSTAPEG, A.PERSENGAPOK, A.TMT_GAPOK, (SELECT MAX(B.TMT_GAPOK) FROM  MIG_ACB.GAPOK_TBL B WHERE B.KDKELOMPOK=A.KDKELOMPOK) TMT_GAPOK_TBL, A.KDJIWA_AKTIF, A.NILAI_THP, 
		CASE  WHEN KDSTAPEG > 20 THEN (SELECT MAX(Z.THP2) FROM  TSPNMIG.PERHITUNGAN_THT Z WHERE Z.NOTAS=A.NOTAS  ) 
		ELSE 0    END NILAI_THP_97, A.BLTHGAJI, A.KDREG, A.TGLREG, A.NOREG, A.KDSATKER, A.ALAMAT, A.LOKASI_ALAMAT, A.NOCROSSDEF, A.JNSUZUR, A.NIK, A.NPWP, A.KDDOKUMEN, A.KETERANGAN, A.KDCABANG, A.INPUTER, A.UPDSTAMP, SUBSTR(A.KDJIWA_AKTIF,2,1) ISTRI, SUBSTR(A.KDJIWA_AKTIF,4,1) ANAK
        --,ROW_NUMBER() OVER ( PARTITION BY A.NOTAS ORDER BY A.UPDSTAMP DESC)AS RN
		FROM  
			(
				SELECT 
				A.NOTAS
				,A.NIP
				,A.NO_KPE
				,(SELECT REPLACE(REPLACE(TRIM(CHAR(160) FROM NMKEL),'\T',''),'N','')  FROM  TSPNMIG.KELUARGA Z WHERE Z.NOTAS=TRIM(A.NOTAS) AND Z.KDHUBKEL='00') NAMA
				,(SELECT Z.JNSKEL FROM  TSPNMIG.KELUARGA Z WHERE Z.NOTAS=TRIM(A.NOTAS) AND Z.KDHUBKEL='00') JNSKEL
				,(SELECT Z.TGLLHR FROM  TSPNMIG.KELUARGA Z WHERE Z.NOTAS=TRIM(A.NOTAS) AND Z.KDHUBKEL='00') TGLLHR
				,A.TMT_KERJA
				,A.TMT_TASPEN
				,(SELECT Z.TGLWAFAT         FROM  TSPNMIG.KELUARGA Z WHERE Z.NOTAS=TRIM(A.NOTAS) AND Z.KDHUBKEL='00') TGLWAFAT
				,A.TGLPMK
				,(SELECT W.KDKELOMPOK       FROM  MIG_ACB.MUTASI_HIST W 		WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) KDKELOMPOK
				,(SELECT W.KDJENPEG         FROM  MIG_ACB.MUTASI_HIST W			WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) KDJNSPEG
				,(SELECT W.KDPANGKAT        FROM  MIG_ACB.MUTASI_HIST W			WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) KDPANGKAT
				,(SELECT W.MASKER 	        FROM  MIG_ACB.MUTASI_HIST W			WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) MASKER
				,(SELECT W.KDDUDUKAN        FROM  MIG_ACB.MUTASI_HIST W			WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) KDKEDUDUKAN
				,(SELECT N.BUP_MAX          FROM  MIG_ACB.KEDUDUKAN_TBL N 	WHERE N.KDDUDUKAN=(SELECT W.KDDUDUKAN FROM  MIG_ACB.MUTASI_HIST W WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS ))) BUP
				,(SELECT W.GAPOK 			FROM  MIG_ACB.MUTASI_HIST W 			WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) GAPOK
				,NULL GAPOK97
				,(SELECT W.KDSTAPEG 		FROM  MIG_ACB.MUTASI_HIST W 		WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) KDSTAPEG
				,(SELECT W.PERSENGAPOK 	    FROM  MIG_ACB.MUTASI_HIST W 		WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) PERSENGAPOK
				,(SELECT W.TMT_GAPOK 		FROM  MIG_ACB.MUTASI_HIST W 		WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) TMT_GAPOK
				,NULL TMT_GAPOK_TBL
				,(SELECT P.KDJIWA 			FROM  MIG_ACB.THP_HIST P 				WHERE P.NOTAS=A.NOTAS AND P.TMT_THP= (SELECT MAX(Y.TMT_THP)  FROM  MIG_ACB.THP_HIST Y WHERE Y.NOTAS=P.NOTAS)) KDJIWA_AKTIF
				,(SELECT P.NILAI_THP 		FROM  MIG_ACB.THP_HIST P 				WHERE P.NOTAS=A.NOTAS AND P.TMT_THP= (SELECT MAX(Y.TMT_THP)  FROM  MIG_ACB.THP_HIST Y WHERE Y.NOTAS=P.NOTAS))NILAI_THP
				,NULL NILAI_THP_97
				,A.BLTHGAJI
				,(SELECT MAX(Q.KDREG) 		FROM  MIG_ACB.REGISTRASI Q 			WHERE Q.NOTAS=A.NOTAS AND Q.KDHUBKEL='00' AND Q.TGLREG =(SELECT MAX(U.TGLREG) FROM MIG_ACB.REGISTRASI U WHERE U.NOTAS=Q.NOTAS)) KDREG
				,(SELECT MAX(Q.TGLREG) 		FROM  MIG_ACB.REGISTRASI Q 			WHERE Q.NOTAS=A.NOTAS AND Q.KDHUBKEL='00' AND Q.TGLREG =(SELECT MAX(U.TGLREG) FROM MIG_ACB.REGISTRASI U WHERE U.NOTAS=Q.NOTAS)) TGLREG
				,(SELECT MAX(Q.NOREG)  		FROM  MIG_ACB.REGISTRASI Q 			WHERE Q.NOTAS=A.NOTAS AND Q.KDHUBKEL='00' AND Q.TGLREG =(SELECT MAX(U.TGLREG) FROM MIG_ACB.REGISTRASI U WHERE U.NOTAS=Q.NOTAS)) NOREG
				,(SELECT W.KDSATKER 		FROM  MIG_ACB.MUTASI_HIST W 		WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) KDSATKER
				,(SELECT R.ALM_PESERTA 		FROM  MIG_ACB.ALAMAT_HIST R 		WHERE R.NOTAS=A.NOTAS AND R.KDHUBKEL='00' AND R.TMT_ALM=(SELECT MAX(N.TMT_ALM) FROM MIG_ACB.ALAMAT_HIST N WHERE N.NOTAS=R.NOTAS)) ALAMAT
				,(SELECT MAX(R.KDDATI1||R.KDDATI2||R.KDDATI3||R.KDDATI4)  
				                            FROM  MIG_ACB.ALAMAT_HIST R         WHERE R.NOTAS=A.NOTAS AND R.KDHUBKEL='00' AND  R.TMT_ALM=(SELECT MAX(N.TMT_ALM) FROM MIG_ACB.ALAMAT_HIST N WHERE N.NOTAS=R.NOTAS)) LOKASI_ALAMAT
				,(SELECT MAX(T.NOCROSSDEF)  FROM  MIG_ACB.CROSSDEFAULT T 	WHERE T.NOTAS=A.NOTAS  AND T.UPDSTAMP=(SELECT MAX(J.UPDSTAMP) FROM MIG_ACB.CROSSDEFAULT J WHERE J.NOTAS=T.NOTAS)) NOCROSSDEF
				,(SELECT MAX(U.JNSUZUR) 	FROM  MIG_ACB.HAK_UZUR U 		WHERE U.NOTAS=A.NOTAS AND U.KDHUBKEL='00' AND U.UPDSTAMP=(SELECT MAX(J.UPDSTAMP) FROM MIG_ACB.CROSSDEFAULT J WHERE J.NOTAS=U.NOTAS) ) JNSUZUR
				,(SELECT TRIM(Z.KTPNO) 		FROM  TSPNMIG.KELUARGA Z  		WHERE Z.NOTAS=TRIM(A.NOTAS) AND Z.KDHUBKEL='00')NIK
				,A.NPWP
				,(SELECT W.KDDOKUMEN 		FROM  MIG_ACB.MUTASI_HIST W		WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) KDDOKUMEN
				,(SELECT W.KETERANGAN 		FROM  MIG_ACB.MUTASI_HIST W		WHERE W.NOTAS=A.NOTAS  AND W.TMT_MUTASI =(SELECT MAX(G.TMT_MUTASI)FROM MIG_ACB.MUTASI_HIST G WHERE G.NOTAS=W.NOTAS )) KETERANGAN
				,A.KDCABANGO KDCABANG
				,A.INPUTER,
				A.UPDSTAMP
			--	,ROW_NUMBER() OVER ( PARTITION BY A.NOTAS ORDER BY A.UPDSTAMP DESC)AS RN
				FROM  MIG_ACB.PESERTA A 
			) A --WHERE RN =1
	) A
	, TSPNMIG.KELUARGA V WHERE 
	 RN =1 AND 
	A.NOTAS=V.NOTAS AND A.KDHUBKEL=V.KDHUBKEL AND V.KDHUBKEL='00' ;
	
--	WHERE 
--	RN =1 AND 
--	EXISTS (SELECT * FROM TSPNMIG.KELUARGA V WHERE A.NOTAS=V.NOTAS AND A.KDHUBKEL=V.KDHUBKEL AND V.KDHUBKEL='00');