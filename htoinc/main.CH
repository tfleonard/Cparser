# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"


# 1 "./include/qtypes.h" 1
# 84 "./include/qtypes.h"
typedef unsigned int uint32;
# 104 "./include/qtypes.h"
typedef unsigned long long U64;
typedef unsigned long U32;
typedef unsigned short U16;
typedef unsigned char U8;
# 4 "main.c" 2


# 1 "./include/hardware.h" 1
# 7 "main.c" 2
# 1 "sp.h" 1




# 1 "./include/ql_structs.h" 1
# 62 "./include/ql_structs.h"
typedef struct {
 unsigned long addr_lo;
 unsigned long addr_hi;
 unsigned long length;
} dseg_struct;




typedef struct {
 unsigned long ref_tag;
 union {
  unsigned long rep_ref_tag;
  unsigned long ref_mask;
 };
 union {
  unsigned short rep_app_tag;
  unsigned short app_mask;
 };
 unsigned short app_tag;
} skp_msk_tag_struct;


typedef struct {
 skp_msk_tag_struct tag;
 dseg_struct dsd;
} skp_msk_dsd_struct;



typedef struct {
 union {
  unsigned long full_adr;
  struct {
   unsigned long blk_id: 20,
     mem_rgn: 6,
     flags: 6;
  };
 };
} mim_adr_struct;
enum { ql_struct_assert_line_102 = (!(sizeof(mim_adr_struct) != 4)) };
# 113 "./include/ql_structs.h"
typedef struct {
 mim_adr_struct nxt_crp_adr;
 unsigned short nxt_crp_ofst;
 unsigned char nxt_dsd_rel_idx;
 unsigned char rsvd0;
 dseg_struct cur_dsd;
 unsigned short rem_dsd_cnt;
 unsigned short rsvd1;
 unsigned long cur_dsd_rist;
 unsigned long tot_ofst;
} alcb_struct;
enum { ql_struct_assert_line_124 = (!(sizeof(alcb_struct) != 32)) };
# 6 "sp.h" 2
# 1 "./include/ql_drp.h" 1



# 1 "./include/ql_structs.h" 1
# 5 "./include/ql_drp.h" 2
# 1 "./include/fc_iocb.h" 1
# 156 "./include/fc_iocb.h"
typedef struct fc_iocb_hdr_s {
 union {
  struct {
   unsigned char iocb_type;
   unsigned char iocb_count;
  };
  unsigned short iocb_cnt_typ;
 };
 unsigned char iocb_sysdef_1;
 unsigned char iocb_status;
} fc_iocb_hdr_struct;
enum { fciocb_assert_line_167 = (!(sizeof(fc_iocb_hdr_struct) != (4/4))) };





typedef struct cont1_s {
 dseg_struct cont_dataseg[5];
} cont1_struct;
enum { fciocb_assert_line_176 = (!(sizeof(cont1_struct) != ((64/4)-(4/4)))) };


typedef struct cont_crc1_s {
 unsigned short guard_seed;
 unsigned short prot_opts;
 unsigned short block_sz;
 unsigned short runt_guard;

 union {
  struct {
   unsigned long ndb_tot_pxc;
   dseg_struct dataseg[4];
  } non_db;
  struct {
   unsigned long db_data_pxc;
   unsigned long db_dif_pxc;
   unsigned short rsvd_1;
   unsigned short blk_dsd_cnt;
   unsigned long rsvd_2;
   dseg_struct dataseg[3];
  } db;
 };
} cont_crc1_struct;
enum { fciocb_assert_line_200 = (!(sizeof(cont_crc1_struct) != ((64/4)-(4/4)))) };



typedef struct cmnd7_s {
 unsigned long cmnd_handle;
 unsigned short cmnd_target;
 unsigned short cmnd_timeout;
 unsigned short cmnd_seg_cnt;
 unsigned short cmnd_rsvd_0;
 unsigned long cmnd_lun_l;
 unsigned long cmnd_lun_h;
 union {
  struct {
   unsigned short cmnd_tm;
   unsigned short cmnd_crn;
  };
  unsigned long cmnd_cntl;
 };
 unsigned long cmnd_cdb0;
 unsigned long cmnd_cdb1;
 unsigned long cmnd_cdb2;
 unsigned long cmnd_cdb3;
 unsigned long cmnd_byte_cnt;
 unsigned long cmnd_target_id:24,
   cmnd_vp_index:8;
 dseg_struct cmnd_dataseg0;

} cmnd7_struct;
enum { fciocb_assert_line_229 = (!(sizeof(cmnd7_struct) != ((64/4)-(4/4)))) };


typedef struct cmnd6_s {
 unsigned long cmnd_handle;
 unsigned short cmnd_target;
 unsigned short cmnd_timeout;
 unsigned short cmnd_seg_cnt;
 unsigned short cmnd_fcprsp_len;
 unsigned long cmnd_lun_l;
 unsigned long cmnd_lun_h;
 unsigned short cmnd_cntl;
 unsigned short cmnd_fcpcmd_len;
 unsigned long cmnd_fcpcmd_adr_lo;
 unsigned long cmnd_fcpcmd_adr_hi;
 unsigned long cmnd_fcprsp_adr_lo;
 unsigned long cmnd_fcprsp_adr_hi;
 unsigned long cmnd_byte_cnt;
 unsigned long cmnd_target_id:24,
   cmnd_vp_index:8;
 dseg_struct cmnd_dataseg0;

} cmnd6_struct;
enum { fciocb_assert_line_252 = (!(sizeof(cmnd6_struct) != ((64/4)-(4/4)))) };


typedef struct cmnd_crc1_s {
 unsigned long cmnd_handle;
 unsigned short cmnd_target;
 unsigned short cmnd_timeout;
 unsigned short cmnd_seg_cnt;
 union {
  unsigned short cmnd_crc1_rsvd_0;
  unsigned short cmnd_crc3_opts;
 };
 unsigned long cmnd_lun_l;
 unsigned long cmnd_lun_h;
 union {
  struct {
   unsigned short cmnd_tm;
   unsigned short cmnd_crn;
  };
  unsigned long cmnd_cntl;
 };
 unsigned long cmnd_cdb0;
 unsigned long cmnd_cdb1;
 unsigned long cmnd_cdb2;
 unsigned long cmnd_cdb3;
 unsigned long cmnd_byte_cnt;
 unsigned long cmnd_target_id:24,
   cmnd_vp_index:8;
 unsigned long cmnd_ref_tag;
 unsigned short cmnd_app_tag;
 unsigned short cmnd_ref_mask_l;
 unsigned short cmnd_ref_mask_h;
 unsigned short cmnd_app_mask;
} cmnd_crc1_struct;
enum { fciocb_assert_line_286 = (!(sizeof(cmnd_crc1_struct) != ((64/4)-(4/4)))) };


typedef struct cmnd_crc2_s {
 unsigned long cmnd_handle;
 unsigned short cmnd_target;
 unsigned short cmnd_timeout;
 unsigned short cmnd_seg_cnt;
 unsigned short cmnd_fcprsp_len;
 unsigned long cmnd_lun_l;
 unsigned long cmnd_lun_h;
 unsigned short cmnd_cntl;
 unsigned short cmnd_fcpcmd_len;
 unsigned long cmnd_fcpcmd_adr_l;
 unsigned long cmnd_fcpcmd_adr_h;
 unsigned long cmnd_fcprsp_adr_l;
 unsigned long cmnd_fcprsp_adr_h;
 unsigned long cmnd_byte_cnt;
 unsigned long cmnd_target_id:24,
   cmnd_vp_index:8;
 dseg_struct cmnd_crc_ctx_dsd;
} cmnd_crc2_struct;
enum { fciocb_assert_line_308 = (!(sizeof(cmnd_crc2_struct) != ((64/4)-(4/4)))) };


typedef struct cmnd_crc3_s {
 unsigned long cmnd_handle;
 unsigned short cmnd_target;
 unsigned short cmnd_timeout;
 unsigned short cmnd_seg_cnt;
 unsigned short cmnd_crc3_opts;
 unsigned long cmnd_lun_l;
 unsigned long cmnd_lun_h;
 union {
  struct {
   unsigned short cmnd_tm;
   unsigned short cmnd_crn;
  };
  unsigned long cmnd_cntl;
 };
 unsigned long cmnd_cdb0;
 unsigned long cmnd_cdb1;
 unsigned long cmnd_cdb2;
 unsigned long cmnd_cdb3;
 unsigned long cmnd_byte_cnt;
 unsigned long cmnd_target_id:24,
   cmnd_vp_index:8;
 unsigned long cmnd_ref_tag0;
 unsigned short cmnd_app_tag0;
 union {
  struct {
   unsigned short cmnd_rep_ref_tag0_l;
   unsigned short cmnd_rep_ref_tag0_h;
   unsigned short cmnd_rep_app_tag0;
  } vr;
  struct {
   unsigned short cmnd_ref_mask0_l;
   unsigned short cmnd_ref_mask0_h;
   unsigned short cmnd_app_mask0;
  } nvr;
 };

} cmnd_crc3_struct;
enum { fciocb_assert_line_349 = (!(sizeof(cmnd_crc3_struct) != ((64/4)-(4/4)))) };



typedef struct sts0_iocb_s {
 unsigned long sts_handle;
 unsigned short sts_status;
 unsigned short sts_oxid;
 unsigned long sts_fw_resid;
 union {
  unsigned short sts_status_flags;
  unsigned short sts_fcp_rsp_pyld_len;
 };
 unsigned short sts_state_flags;
 unsigned short sts_retry_delay_timer;
 unsigned short sts_scsi_status;
 unsigned long sts_scsi_resid;
 unsigned long sts_sens_len;
 unsigned long sts_rsp_len;
 union {
  unsigned long sts_rsp_sns_info[7];
  struct {
   unsigned long sts_rsvd_0[3];
   unsigned long sts_act_dif[2];
   unsigned long sts_exp_dif[2];
  };
 };





} sts0_iocb_struct;
enum { fciocb_assert_line_382 = (!(sizeof(sts0_iocb_struct) != ((64/4)-(4/4)))) };



typedef struct tm_iocb_s {
 unsigned long scsi_tm_handle;
 unsigned short scsi_tm_target;
 unsigned short scsi_tm_rsvd_0;
 unsigned short scsi_tm_delay;
 unsigned short scsi_tm_timeout;
 unsigned long scsi_tm_lun_l;
 unsigned long scsi_tm_lun_h;
 unsigned long scsi_tm_flags;
 unsigned long scsi_tm_rsvd_1[5];
 unsigned long scsi_tm_target_id:24,
   cmnd_vp_index:8;
 unsigned short scsi_tm_xvp_index;
 unsigned short scsi_tm_rsvd_2;
 unsigned long scsi_tm_rsvd_3[2];
} tm_iocb_struct;
enum { fciocb_assert_line_402 = (!(sizeof(tm_iocb_struct) != ((64/4)-(4/4)))) };



typedef struct marker_s {
 unsigned long mrkr_handle;
 unsigned short mrkr_target;
 unsigned char mrkr_modfr;
 unsigned char mrkr_rsvd_0;
 unsigned short mrkr_vp_index;
 unsigned short mrkr_rsvd_1;
 unsigned long mrkr_lun_l;
 unsigned long mrkr_lun_h;
 unsigned long mrkr_rsvd_2[10];
} marker_struct;
enum { fciocb_assert_line_417 = (!(sizeof(marker_struct) != ((64/4)-(4/4)))) };



typedef struct ctio7_s {
 unsigned long ctio_handle;
 union {
  unsigned short ctio_target;
  unsigned short ctio_status;
 };
 unsigned short ctio_timeout;
 unsigned short ctio_seg_cnt;
 unsigned char ctio_vp_index;
 unsigned char ctio_add_flags;
 unsigned long ctio_init_id:24,
   ctio_rsvd_0:8;
 mim_adr_struct rcv_xchg_adr;
 union {
  struct {
   unsigned short ctio_rsvd_1;
   unsigned short ctio_flags;
   unsigned long ctio_rsvd_2;
   unsigned short ctio_oxid;
   unsigned short ctio_rsvd_3;
   unsigned long ctio_ro;
   unsigned long ctio_rsvd_4;
   unsigned long ctio_byte_cnt;
   unsigned long ctio_rsvd_5;
   dseg_struct ctio_dataseg0;
  } mode0;
  struct {
   unsigned short ctio_sns_len;
   unsigned short ctio_flags;
   unsigned long ctio_resid_len;
   unsigned short ctio_oxid;
   unsigned short ctio_scsi_sts;
   unsigned short ctio_rsp_len;
   unsigned short ctio_rsvd_3;
   unsigned char ctio_rsp_sns_info[24];
  } mode1;
  struct {
   unsigned short ctio_rsvd_1;
   unsigned short ctio_flags;
   unsigned long ctio_resid_len;
   unsigned short ctio_oxid;
   unsigned char ctio_rsvd_2[10];
   unsigned long ctio_byte_cnt;
   unsigned long ctio_rsvd_3;
   dseg_struct ctio_dataseg0;
  } mode2;
 };
} ctio7_struct;
enum { fciocb_assert_line_469 = (!(sizeof(ctio7_struct) != ((64/4)-(4/4)))) };


typedef struct ctio_crc1_s {
 unsigned long ctio_handle;
 union {
  unsigned short ctio_target;
  unsigned short ctio_status;
 };
 unsigned short ctio_timeout;
 unsigned short ctio_seg_cnt;
 unsigned char ctio_vp_index;
 unsigned char ctio_add_flags;
 unsigned long ctio_init_id:24,
   ctio_rsvd_0:8;
 mim_adr_struct rcv_xchg_adr;

 unsigned short ctio_rsvd_1;
 unsigned short ctio_flags;
 unsigned long ctio_rsvd_2;
 unsigned short ctio_oxid;
 unsigned short ctio_rsvd_3;
 unsigned long ctio_ro;
 unsigned long ctio_rsvd_4;
 unsigned long ctio_byte_cnt;
 unsigned long ctio_rsvd_5;

 unsigned long cmnd_ref_tag;
 unsigned short cmnd_app_tag;
 unsigned short cmnd_ref_mask_l;
 unsigned short cmnd_ref_mask_h;
 unsigned short cmnd_app_mask;

} ctio_crc1_struct;
enum { fciocb_assert_line_503 = (!(sizeof(ctio_crc1_struct) != ((64/4)-(4/4)))) };


typedef struct ctio_crc2_s {
 unsigned long ctio_handle;
 union {
  unsigned short ctio_target;
  unsigned short ctio_status;
 };
 unsigned short ctio_timeout;
 unsigned short ctio_seg_cnt;
 unsigned char ctio_vp_index;
 unsigned char ctio_add_flags;
 unsigned long ctio_init_id:24,
   ctio_rsvd_0:8;
 mim_adr_struct rcv_xchg_adr;

 unsigned short ctio_rsvd_1;
 unsigned short ctio_flags;
 unsigned long ctio_rsvd_2;
 unsigned short ctio_oxid;
 unsigned short ctio_rsvd_3;
 unsigned long ctio_ro;
 unsigned long ctio_rsvd_4;
 unsigned long ctio_byte_cnt;
 unsigned long ctio_rsvd_5;

 dseg_struct ctio_crc_ctx_dsd;

} ctio_crc2_struct;
enum { fciocb_assert_line_533 = (!(sizeof(ctio_crc2_struct) != ((64/4)-(4/4)))) };



typedef struct ctio_crc3_s {
 unsigned long ctio_handle;
 union {
  unsigned short ctio_target;
  unsigned short ctio_status;
 };
 unsigned short ctio_timeout;
 unsigned short ctio_seg_cnt;
 unsigned char ctio_vp_index;
 unsigned char ctio_add_flags;
 unsigned long ctio_init_id:24,
   ctio_rsvd_0:8;
 mim_adr_struct rcv_xchg_adr;

 unsigned short ctio_rsvd_1;
 unsigned short ctio_flags;
 unsigned long ctio_rsvd_2;
 unsigned short ctio_oxid;
 unsigned short ctio_rsvd_3;
 unsigned long ctio_ro;
 unsigned long ctio_rsvd_4;
 unsigned long ctio_byte_cnt;
 unsigned long ctio_rsvd_5;
 unsigned long ctio_ref_tag0;
 unsigned short ctio_app_tag0;

 union {
  struct {
   unsigned short ctio_rep_ref_tag0_l;
   unsigned short ctio_rep_ref_tag0_h;
   unsigned short ctio_rep_app_tag0;
  } vr;
  struct {
   unsigned short ctio_ref_mask0_l;
   unsigned short ctio_ref_mask0_h;
   unsigned short ctio_app_mask0;
  } nvr;
 };

} ctio_crc3_struct;
enum { fciocb_assert_line_577 = (!(sizeof(ctio_crc3_struct) != ((64/4)-(4/4)))) };


typedef struct ctio_crc4_s {
 unsigned long ctio_handle;
 union {
  unsigned short ctio_target;
  unsigned short ctio_status;
 };
 unsigned short ctio_timeout;
 unsigned short ctio_seg_cnt;
 unsigned char ctio_vp_index;
 unsigned char ctio_add_flags;
 unsigned long ctio_init_id:24,
   ctio_rsvd_0:8;
 mim_adr_struct rcv_xchg_adr;

 unsigned short ctio_app_tag0;
 unsigned short ctio_flags;
 unsigned long ctio_ref_tag0;
 unsigned short ctio_oxid;
 unsigned short ctio_prot_opts;
 unsigned long ctio_ro;
 unsigned short ctio_guard_seed;
 unsigned short ctio_rsvd_4;
 unsigned long ctio_byte_cnt;
 unsigned long ctio_tot_ptc;

 dseg_struct ctio_dataseg0;

} ctio_crc4_struct;
enum { fciocb_assert_line_608 = (!(sizeof(ctio_crc4_struct) != ((64/4)-(4/4)))) };




typedef struct fc_iocb_s {
 fc_iocb_hdr_struct hdr;
 union {
  cont1_struct cont1;
  cont_crc1_struct cont_crc1;
  cmnd7_struct cmnd7;
  cmnd6_struct cmnd6;
  cmnd_crc1_struct cmnd_crc1;
  cmnd_crc2_struct cmnd_crc2;
  cmnd_crc3_struct cmnd_crc3;
  sts0_iocb_struct status0;
  tm_iocb_struct tskmgt;
  marker_struct marker;
  ctio7_struct ctio7;
  ctio_crc1_struct ctio_crc1;
  ctio_crc2_struct ctio_crc2;
  ctio_crc3_struct ctio_crc3;
  ctio_crc4_struct ctio_crc4;
 };
} fc_iocb_struct;


typedef struct atio_s {
 union {
  struct {
   unsigned char iocb_type;
   unsigned char iocb_count;
  };
  unsigned short iocb_cnt_typ;
 };
 unsigned short atio_cmnd_len:12,
   atio_attr:4;
 mim_adr_struct rcv_xchg_adr;
 unsigned long atio_frame_hdr[6];
 unsigned long atio_payload[8];
} atio_struct;
enum { fciocb_assert_line_649 = (!(sizeof(atio_struct) != (64/4))) };



typedef struct fc_fw_def_s {
 union {
  unsigned long tbd_scratch[16];
  struct {
   mim_adr_struct t10_crc_cntxt;
   unsigned long rsvd[15];
  };

 };



} fc_fw_def_struct;
enum { fciocb_assert_line_666 = (!(sizeof(fc_fw_def_struct) != 64)) };


typedef struct disk_crc_ctxt_s {
 unsigned long io_handle;
 unsigned long ref_tag;
 unsigned short app_tag;
 unsigned short ref_mask_l;

 unsigned short ref_mask_h;
 unsigned short app_mask;

 unsigned short guard_seed;
 unsigned short prot_opts;

 unsigned short block_sz;
 unsigned short runt_guard;

 union {
  struct {
   unsigned long ndb_tot_pxc;
   unsigned long rsvd_0;
   unsigned long rsvd_1;
   unsigned long rsvd_2;
   dseg_struct data_dsd;
   unsigned long rsvd_3[3];
  } non_db;
  struct {
   unsigned long db_data_pxc;
   unsigned long db_dif_pxc;
   unsigned short rsvd_1;
   unsigned short blk_dsd_cnt;
   unsigned long rsvd_2;
   dseg_struct data_dsd;
   dseg_struct dif_dsd;
  } db;
 };
} dcrc_ctxt_struct;
# 6 "./include/ql_drp.h" 2
# 50 "./include/ql_drp.h"
#pragma pack(push,4)

typedef struct {
 union {
  unsigned long gen_iocb[16];
  fc_iocb_struct fc_iocb;


 };
 union {
  unsigned long gen_def[16];
  fc_fw_def_struct fc_fw_def;

 };


 union {

  struct {
   alcb_struct lo_alcb;
   alcb_struct hi_alcb;
   unsigned long hdr_digest;
   unsigned long data_digest;
   mim_adr_struct t10_ctx;
   union {
    dseg_struct dsd[4];
    skp_msk_dsd_struct sm_dsd[2];
    unsigned long fill[12];
   };
   mim_adr_struct nxt_crp_adr;
  };
  unsigned long misc_data[32];
  unsigned char scratch[128];
 };
} drp_struct;
#pragma pack(pop)

enum { fciocb_assert_line_87 = (!(sizeof(drp_struct) != (256/4))) };




#pragma pack(push,4)
typedef struct {
 unsigned long vld_flags_9To0;
 dseg_struct dsd_list_0[10];
 unsigned long rsvd1;
 unsigned long vld_flags_19to10;
 dseg_struct dsd_list_1[10];
 mim_adr_struct nxt_crp_ptr;
} crp_struct;
#pragma pack(pop)

enum { fciocb_assert_line_103 = (!(sizeof(crp_struct) != (256/4))) };
# 7 "sp.h" 2


typedef enum _dmaType {
 DMA_TYPE_MIM,
 DMA_TYPE_MQS,
 DMA_TYPE_DSD,
 DMA_TYPE_CRC_CNTXT,
 DMA_TYPE_SWQE,
 DMA_TYPE_ROCE_CONTEXT
} dmaType;

typedef enum _protType {
 PROT_HQP,
 PROT_ROCE
} protType;
# 92 "sp.h"
struct _dmaQue;
struct _hqpCb;



typedef struct _dmaCB {
 struct _dmaCB *next;

 dmaType type;
 protType protocol;
 unsigned long hqpId;
 unsigned long hdwReg;
 unsigned long adrh;
 unsigned long adrl;
 unsigned long region;
 unsigned long length;
 void * spBufAdr;
 unsigned long result;
}dmaCb;





typedef struct _dmaQue {
 dmaCb *head;
 dmaCb *tail;
}dmaQue;





typedef struct _Qobj {
 struct _Qobj *next;
}Qobj;





typedef struct _Que {
 Qobj *head;
 Qobj *tail;
}Que;





typedef enum _hqpState {
 HQP_STATE_INACTIVE,
 HQP_STATE_SLOW_PATH_REQ,
 HQP_STATE_WAIT_HQP_CNTXT_DMA,
 HQP_STATE_WAIT_DRPCRP_DESC,
 HQP_STATE_WAIT_DMACB,
 HQP_STATE_WAIT_SQ_CNTXT_DMA,
 HQP_STATE_WAIT_IOCB_BLK,
 HQP_STATE_WAIT_FOR_DSD_DMA,
 HQP_STATE_WAIT_FOR_DSD_LPTR_DMA,
 HQP_STATE_WAIT_FOR_MIM_BLK_ALLOC,
 HQP_STATE_WAIT_FOR_MIM_DMA,
 HQP_STATE_WAIT_FOR_MQS_DMA,
 HQP_STATE_WAIT_FOR_CRC_CNTXT_DMA,
 HQP_STATE_WAIT_FOR_CRC_DIF_DMA,
 HQP_STATE_WAIT_FOR_DIF_LPTR_DMA,
 HQP_STATE_PROC_IOCB
}hqpState;





struct _bufDesc;






struct _hqpCb {
 struct _hqpCb *next;

 struct _bufDesc *pIocbBlkChain;
 dmaCb *pDmaCb;
 struct _bufDesc *pDrp;
 struct _bufDesc *pCrp;
 struct _bufDesc *pT10Cntxt;
 fc_iocb_struct *pCurIocb;
 void *pBuf;

 hqpState state;
 unsigned long numIocbProcessed;


 unsigned short dsdIndxInBuf;

 unsigned char dsdIndxInDrpCrp;
 unsigned char iocbIndx;
 unsigned short flags;
 unsigned char rsvd;
 unsigned char iocbCount;
 unsigned short dsdCount;
}__attribute__ ((packed));

typedef struct _hqpCb hqpCb;
# 229 "sp.h"
typedef struct _hqpQue {
 hqpCb *head;
 hqpCb *tail;
} hqpQue;






struct _hqpCntxtEntry {
 union {
  unsigned long hqpCntxtW1;
  struct {
 unsigned long vpid:10,
    port:2,
    type:4,
    iocbRegion:6,
    cntxtRegion:6,
    cntxtSize:3,
    valid:1;
  };
 };
 unsigned short mqsL1q;
} __attribute__ ((packed));


typedef struct _hqpCntxtEntry hqpCntxtEntry;
# 278 "sp.h"
struct _hqmHqpCntxt {


 union {
  unsigned long hqpCntxtRq0;
  struct {
   unsigned long vpid:10,
     rq0rsvd0:2,
     dici:1,
     port:2,
     rq0rsvd:1,
     duci:1,
     rq0rsvd2:1,
     type:4,
     iocbRegion:6,
     state:4;
  };
 };
 union {
  unsigned long hqpCntxtRq1;
  struct {
   unsigned long mqsL1Que:16,
     cntxtRegion:6,
     cntxtSize:3,
     rq1rsvd0:7;
  };
 };
 unsigned short hqpCntxtRqConsIndxBits;
 unsigned short hqpCntxtRqBaseAddrBits;
 unsigned long hqpCntxtRqConsIndxAdrl;
 unsigned long hqpCntxtRqConsIndxAdrh;
 unsigned long hqpCntxtRqBaseAdrl;
 unsigned long hqpCntxtRqBaseAdrh;
 union {
  unsigned long hqpCntxtRq7;
  struct {
   unsigned long rqQueLength:16,
    rqes:3,
    hostPageSize:3,
    rmc:2,
    rq7rsvd0:8;
  };
 };


 unsigned long hqpCntxtRp00;
 unsigned long hqpCntxtRp01;
 unsigned short hqpCntxtRp0ConsIndxBits;
 unsigned short hqpCntxtRp0BaseAddrBits;
 unsigned long hqpCntxtRp0ConsIndxAdrl;
 unsigned long hqpCntxtRp0ConsIndxAdrh;
 unsigned long hqpCntxtRp0BaseAdrl;
 unsigned long hqpCntxtRp0BaseAdrh;
 union {
  unsigned long hqpCntxtRp07;
  struct {
   unsigned long rp0QueLength:16,
    rpe0:3,
    rp0hostPageSize:3,
    rp0rmc:2,
    rp0rsvd1:8;
  };
 };


 unsigned long hqpCntxtRp10;
 unsigned long hqpCntxtRp11;
 unsigned short hqpCntxtRp1ConsIndxBits;
 unsigned short hqpCntxtRp1BaseAddrBits;
 unsigned long hqpCntxtRp1ConsIndxAdrl;
 unsigned long hqpCntxtRp1ConsIndxAdrh;
 unsigned long hqpCntxtRp1BaseAdrl;
 unsigned long hqpCntxtRp1BaseAdrh;
 union {
  unsigned long hqpCntxtRp17;
  struct {
   unsigned long rp1QueLength:16,
    rpe1:3,
    rp1hostPageSize:3,
    rp1rmc:2,
    rp1rsvd1:8;
  };
 };

 unsigned long anonBuf[8];

}__attribute__ ((packed)) ;

typedef struct _hqmHqpCntxt hqmHqpCntxt;
# 376 "sp.h"
struct _sqCntxtEntry {
 unsigned long queAdrl;
 unsigned long queAdrh;
 unsigned short queLength;
 unsigned short hqpid;
 union {
  unsigned long sqCntxt3;
  struct {
   unsigned long en:1,
     sw:1,
     rsvd1:1,
     rmc:2,
     qes:3,
     swqeRegion:6,
     rsvd2:2,
     nxtSeqNum:4,
     hostPageSize:3,
     rsvd3:9;
  };
 };
 unsigned short consIdx;
 unsigned short rsvd4;
 unsigned long rsvd5;
 unsigned short mqsL1q;
 unsigned short cntxtRegion;
 unsigned long pcieBits;

 struct _sqCntxtEntry *next;

} __attribute__ ((packed));


typedef struct _sqCntxtEntry sqCntxtEntry;
# 424 "sp.h"
typedef enum {
 HASH_FREE,
 HASH_ASSIGNED,
 HASH_DELETED,
 HASH_RO

} T_HASH_SLOT_STATE;







typedef struct _hashEntry {
 unsigned long state:2,
      key:18,
      rsvd:12;
 sqCntxtEntry *cntxtAdr;
}hashEntry;






typedef struct _drp_crp {
 union {
  crp_struct crp;
  drp_struct drp;
 };
} drp_crp;
# 475 "sp.h"
typedef struct _bufDesc {
 unsigned long pad_for_mqs;
 union {
  drp_crp lbuf;
  fc_iocb_struct iocb[4];
 };
 unsigned long pad_for_dma[2];
 struct _bufDesc *next;
 mim_adr_struct mbuf;
 unsigned long hqpId;
}bufDesc;





typedef struct _drpCrpQue {
 bufDesc *head;
 bufDesc *tail;
} drpCrpQue;





typedef struct _bufQue {
 bufDesc *head;
 bufDesc *tail;
} bufQue;



typedef struct _opcodeFormatRamEntry {
 union {
  unsigned long long OpcodeFormat;
  struct {
   unsigned long long
    lengthInIocb :2,
    numDsds :2,
    createAlcbs :1,
    routeToSP :1,
    ctrlFlagsPsn :2,
    ctrlFlagsMsk :16,
    prefetchIocb :1,
    prefetchContext :1,
    conxIdPsn :2,



    conxIdPrefix :4,
    iocbCountFmt :2,


    ecc :7,
    rsvd :23;
  };
 };
} opcodeFormatRamEntry;
# 576 "sp.h"
typedef struct _mqsLink {
 unsigned long link[4];
}mqsLink;
# 635 "sp.h"
typedef struct _mqsMessage {
 mqsLink link;
 unsigned long iocb[32];
}mqsMessage;
# 690 "sp.h"
void mainLoop(void);



int enqueDmaCb(dmaCb *pDmaCb, dmaQue *pDmaQue);
dmaCb *dequeAndUpdateDmaCbStatus(dmaQue *pDmaQue);
dmaCb *dequeDmaCb(dmaQue *pDmaQue);
int dmaQueIsEmpty(dmaQue *pDmaQue);
int fpFifoIsEmpty(void);
int fpFifoIsFull(void);
int enqueFpFifo(unsigned long adr);
int abFifoIsEmpty(void);
int abFifoIsFull(void);
int dequeAbFifo(unsigned long *pHqpId, bufDesc **pBufAdr);
int enqueHqpCb(hqpCb *pHqpCb, hqpQue *pHqpQue);
hqpCb *dequeHqpCb(hqpQue *pHqpQue);
int hqpQueIsEmpty(hqpQue *pHqpQue);
void getIocbStateString(hqpState state, char *buf);
void getIocbStateString(hqpState state, char *buf);

void *top(void *que);
void ProcessSlowPathRequest(int hqpId);
void getHqpContext(int hqpId);
bufDesc * allocDrpCrp(int hqpId);
int processIocb(int hqpId);
int ProcessDsdList(int hqpId, int dsdListPointer);
void ReleaseHqpResources(int hqpId);




sqCntxtEntry *sqHashGet(hashEntry *table, unsigned long key);
unsigned long sqHashAdd(hashEntry *table, unsigned long key, sqCntxtEntry *value);
unsigned long sqHashDelete(hashEntry *table, unsigned long key);
unsigned long sqHashKey(unsigned long key, unsigned long indx);

void *dmalloc(unsigned long length);
void dfree(void *);
# 8 "main.c" 2
# 1 "sp_hardware.h" 1
# 24 "sp_hardware.h"
typedef struct _sp_regs {
 unsigned long hqmDebugReg;
 unsigned long hqmIoRingReg;
 unsigned long hqmLoadRamAdrReg;
 unsigned long hqmLoadRamDataReg;
 unsigned long hqmIpcMsgDataReg;
 unsigned long hqmIpcMsgCmdReg;
 unsigned long hqmSemaphoreReg;

 unsigned long hqmHqpConfigReg;






 unsigned long hqmHqpStatusReg;
# 68 "sp_hardware.h"
 unsigned long FreePoolFifoReg;
# 78 "sp_hardware.h"
 unsigned long hqpIocbFetchReg;
# 93 "sp_hardware.h"
 unsigned long iocbDmaCmdReg;
# 113 "sp_hardware.h"
 unsigned long iocbDmaSpAdrReg;


 unsigned long iocbDmaAdrlReg;
 unsigned long iocbDmaAdrhReg;

 unsigned long iocbDmaHqpIdReg;
# 130 "sp_hardware.h"
 unsigned long mimBlkRqReg;
# 147 "sp_hardware.h"
 unsigned long mimDma0CmdReg;
# 158 "sp_hardware.h"
 unsigned long mimDma0AdrReg;





 unsigned long mimDma0BlkOffsetReg;


 unsigned long mimDma0SpAdrReg;






 unsigned long mqsDma0CmdReg;
# 183 "sp_hardware.h"
 unsigned long hqpCntxtCmdReg;




 unsigned long hqpCntxtSpAdrReg;






 unsigned long hqpCmdCmpltReg;





 unsigned long hqmNumIocbPerBlockReg;






 unsigned long sqStatusReg;







 unsigned long sqCntxtCmdReg;




 unsigned long sqCntxtSpAdrReg;






 unsigned long sqCntxtUpCmdReg;




 unsigned long sqCntxtUpDataReg;







 unsigned long hostDmaCmdReg;
# 261 "sp_hardware.h"
 unsigned long hostDmaSpAdrReg;


 unsigned long hostDmaAdrlReg;
 unsigned long hostDmaAdrhReg;

 unsigned long hostDmaHqpIdReg;
# 280 "sp_hardware.h"
 unsigned long mimDma1CmdReg;
 unsigned long mimDma1AdrReg;
 unsigned long mimDma1BlkOffsetReg;
 unsigned long mimDma1SpAdrReg;







 unsigned long mqsDma1CmdReg;




 unsigned long conxIdIncCountReg;



 unsigned long mqsTieCnxReg;
 unsigned long mqsTiePrf0Reg;
 unsigned long mqsTiePrf1Reg;
 unsigned long mqsTieL1qReg;

} sp_regs;
# 534 "sp_hardware.h"
extern sp_regs spRegs __attribute__ ((section(".hdwregs")));
# 9 "main.c" 2

# 1 "simhdw.h" 1
# 31 "simhdw.h"
struct _FCP_CDB {
 unsigned char cdb[16];
};



typedef struct _scsiBlk {
 unsigned char buf[16];
} scsiBlk;
# 51 "simhdw.h"
typedef struct _timer {
 unsigned long tick[100];
 unsigned long *pNxtTick;
} timer;
# 63 "simhdw.h"
void fpHdwSimFifoInit(void);
int fpHdwSimFifoIsFull(void);
int fpHdwSimFifoIsEmpty(void);
void enqueueFpHdwSimFifo(void);
unsigned long dequeueFpHdwSimFifo(void);
void abHdwSimFifoInit(void);
int abHdwSimFifoIsFull(void);
int enqueueAbHdwSimFifo(unsigned long val);
void dequeueAbHdwSimFifo(void);


int SlowPathIocb_Ct6DsdList(void);
int SlowPathIocb_Ct7Ct1(void);
int SlowPathIocb_CtCRC_2DsdList(void);

void mlmHdwSim(void);
void initMim(void);
opcodeFormatRamEntry ReadOpcodeFormatRam( int opcode, int protocol);
void hqmFetchHdwSim(void);
void hqmCmdCmpltHdwSim(void);
void hqmMimDma0HdwSim(void);
void hqmMimClr0HdwSim(void);
void hqmMqsDma0HdwSim(void);
void hqpContextDmaHdwSim(void);
void initContext(void);
void initOpcodeFormatRam(void);
void initHdwRegs(void);
void mqsCnxIdIncHdwSim(void);

void DipslayAllocatedDrpCrpBlockList(void);
void DisplayDrpCrpChain (hqpCb *pHqpCb);
void DisplayMqsMessage(mqsMessage *pMsg);
unsigned long calcTimerTime(timer *t);
# 11 "main.c" 2

# 1 "./include/fc_iocb.h" 1
# 13 "main.c" 2

# 1 "./include/ql_xmngr.h" 1
# 284 "./include/ql_xmngr.h"
typedef struct scsi_tag_s {



    unsigned short tx_frm_sz;
    unsigned short rsvd1;
    unsigned long tx_flags;
    unsigned long exp_tx_ro;
    unsigned long rem_tx_cnt;

    union {
        unsigned long exp_tx_seqid_cnt;
        struct {
            unsigned short tx_seq_cnt;
            unsigned char tx_dfctl;
            unsigned char tx_seq_id;
        };
    };


    unsigned long rx_flags;
    unsigned long exp_rx_ro;
    unsigned long rem_rx_cnt;

    union {
        unsigned long exp_rx_seqid_cnt;
        struct {
            unsigned short rx_seq_cnt;
            unsigned char rx_dfctl;
            unsigned char rx_seq_id;
        };
    };



    unsigned long task_retry_id;
    unsigned long fill[13];

} x_scsi_struct;






typedef struct xcb_s {

    unsigned long port:3,
            flags:29;

    unsigned long iocb_handle;
    unsigned short hpq_id;
    unsigned short ctl_flags;
    unsigned short x_state;
    unsigned char x_event;
    unsigned char x_owner;
    unsigned short othr_xid;
    unsigned short my_xid;
    mim_adr_struct pcb_adr;
    mim_adr_struct drp_adr;
    mim_adr_struct x_link_adr;
    mim_adr_struct x_cont_link_adr;

    union {
        x_scsi_struct scsi_own;
        unsigned long misc_data[16];
    };

} xcb_struct;
# 15 "main.c" 2
# 61 "main.c"
unsigned long simIocbComplete = 1;
unsigned long passCount = 0;


volatile register unsigned long *rMb ;
unsigned long shdMb0;
# 91 "main.c"
dmaQue iocbDma;
dmaQue hostDma;
dmaQue mimDma;
dmaQue mqsDma;
dmaQue hqpCtxDma;
dmaQue swqeDma;
dmaQue roceCtxDma;
# 106 "main.c"
dmaQue fwDsdQue;
dmaQue fwSwqeQue;
dmaQue fwCntxt;
dmaQue fwMimQue;




bufQue iocbBlkWaitQ;
hqpQue hqpRdyQ;
hqpQue genWaitQ;
# 131 "main.c"
bufDesc iocbBuf[4] __attribute__ ((section(".off_data"),aligned(4))) ;




bufDesc drpCrpArray[8] __attribute__ ((section(".off_data"),aligned(4)));




hqpCb *HqpLookup[(1<<11)] __attribute__ ((section(".off_data"),aligned(4)));




sqCntxtEntry sqCntxt[(64)] ;
# 162 "main.c"
dmaCb dmaCbArray[(4)];
hqpCb hqpCbArray[4 ];

hqpCntxtEntry hqpCntxt[(1<<11)];
sqCntxtEntry* sqHash[(64)];






bufQue drpCrpFreePool;

hqpQue drpCrpWaitQ;

unsigned long actNumIocbBlks;



hqpQue dmaCbWaitQ;


hqpQue hqpCbFreePool;



int main(void) {

int i;

dmaCb *pDmaCb = dmaCbArray;

bufDesc *pIocbBuf = iocbBuf;

bufDesc *pDrpCrpDesc = drpCrpArray;
bufQue *pDrpCrpFreePool = &drpCrpFreePool;

hqpCb *pHqpCb = hqpCbArray;
hqpQue *pHqpCbFreePool = &hqpCbFreePool;





 rMb = (unsigned long *)0x7020;





shdMb0 = 0x0001;
*rMb = shdMb0;




 iocbDma.head = 0;
 iocbDma.tail = 0;
 hostDma.head = 0;
 hostDma.tail = 0;
 mimDma.head = 0;
 mimDma.tail = 0;
 mqsDma.head = 0;
 mqsDma.tail = 0;
 hqpCtxDma.head = 0;
 hqpCtxDma.tail = 0;
 swqeDma.head = 0;
 swqeDma.tail = 0;




 fwDsdQue.head = 0;
 fwDsdQue.tail = 0;
 fwSwqeQue.head = 0;
 fwSwqeQue.tail = 0;
 fwCntxt.head = 0;
 fwCntxt.tail = 0;
 fwMimQue.head = 0;
 fwMimQue.tail = 0;




 iocbBlkWaitQ.head = 0;
 iocbBlkWaitQ.tail = 0;

 drpCrpWaitQ.head = 0;
 drpCrpWaitQ.tail = 0;

 hqpRdyQ.head = 0;
 hqpRdyQ.tail = 0;




 drpCrpFreePool.head = 0;
 drpCrpFreePool.tail = 0;




 hqpCbFreePool.head = 0;
 hqpCbFreePool.tail = 0;





 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqmHqpStatusReg)))) = 0);
 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->FreePoolFifoReg)))) = (1<<31));
# 292 "main.c"
 unsigned long dummyHqpId;
 bufDesc *dummyBufAdr;

unsigned long loopCount = 256;

 while (dequeAbFifo(&dummyHqpId,&dummyBufAdr)) {



  if (--loopCount) {
   exit(1);
  }
 }
# 314 "main.c"
 for (i=0; i<4; i++) {

  if ( !enqueFpFifo((unsigned long)pIocbBuf) ) {
   break;
  } else {
   pIocbBuf++;
  }
 }

 actNumIocbBlks = i;






 if (actNumIocbBlks < 4) {
;
;
 }
# 346 "main.c"
 for (i=0; i<8; i++) {
  enque(pDrpCrpDesc++,pDrpCrpFreePool);
 }
# 358 "main.c"
 for (i=0; i<4; i++) {
  pHqpCb->pDmaCb = pDmaCb++;
  enque(pHqpCb++,pHqpCbFreePool);
 }






 for (i=0; i< (1<<11); i++) {
  HqpLookup[i]= 0;
 }







 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqmNumIocbPerBlockReg)))) = 4);






 initHdwRegs();
 initMim();
 initOpcodeFormatRam();
 initContext();

shdMb0 &= ~0x0001;
*rMb = shdMb0;

 mainLoop();

 return 0;
}
# 405 "main.c"
void mainLoop(void) {

unsigned long hqmStatusReg;





shdMb0 = 0x0002;
*rMb = shdMb0;




 while (passCount < 2) {
# 442 "main.c"
  if (!queIsEmpty(&hostDma)) {
   unsigned long treg;
   dmaCb *pDmaCb;
   dmaCb *pNextDmaCb;



   treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));
   if (treg & (1 << 31)) {

    pDmaCb = (dmaCb *)deque(&hostDma);
    pDmaCb->result = treg;




    if (!queIsEmpty(&hostDma)) {

     pNextDmaCb = (dmaCb *)top(&hostDma);


     (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaSpAdrReg)))) = (((unsigned long)pNextDmaCb->spBufAdr) & (0x00007FFF)));
     (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrlReg)))) = pNextDmaCb->adrl);
     (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrhReg)))) = pNextDmaCb->adrl);
     (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaHqpIdReg)))) = pNextDmaCb->hqpId);
     treg = (0<<14) + pNextDmaCb->length;

     (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))) = treg);







     hostDmaHdwSim();






  }



    ProcessSlowPathRequest(pDmaCb->hqpId);
   }
  }
# 515 "main.c"
  if (!queIsEmpty(&drpCrpWaitQ)) {
   if (!queIsEmpty(&drpCrpFreePool)) {
    hqpCb *pHqpCb = (hqpCb *)deque(&drpCrpWaitQ);
    unsigned long hqpId = pHqpCb->pIocbBlkChain->hqpId & (0x7FF);
    if (allocDrpCrp(hqpId)) {
     pHqpCb->state = HQP_STATE_PROC_IOCB;
     processIocb(hqpId);
    } else {


    }
   }
  }




  if (!queIsEmpty(&iocbBlkWaitQ)) {
   if (!queIsEmpty(&hqpCbFreePool)) {
    hqpCb *pHqpCb = (hqpCb *)deque(&hqpCbFreePool);
    memset(pHqpCb,0,sizeof(hqpCb));
    pHqpCb->pIocbBlkChain = (bufDesc *)deque(&iocbBlkWaitQ);
    unsigned long hqpId = pHqpCb->pIocbBlkChain->hqpId & (0x7FF);
    if (HqpLookup[hqpId]) {
     ;
     ;


     enque(pHqpCb->pIocbBlkChain, &iocbBlkWaitQ);
     enque(pHqpCb,&hqpCbFreePool);

    } else {




     pHqpCb->state = HQP_STATE_SLOW_PATH_REQ;
     pHqpCb->pIocbBlkChain->next = 0;
     HqpLookup[hqpId] = pHqpCb;
     ProcessSlowPathRequest(hqpId);
    }
   }
  }
# 578 "main.c"
  unsigned long hqpId;
  unsigned long rawAbFifoData;
  hqpCb *pHqpCb;
  bufDesc *buf;

  while (dequeAbFifo(&rawAbFifoData, &buf)) {

   bufDesc *curBlk;
   hqpId = rawAbFifoData & (0x7FF);
   buf->hqpId = rawAbFifoData;



   pHqpCb = HqpLookup[hqpId];




   if (!pHqpCb) {
    if (!queIsEmpty(&hqpCbFreePool)) {
     pHqpCb = (hqpCb *)deque(&hqpCbFreePool);
     HqpLookup[hqpId] = pHqpCb;

     pHqpCb->pIocbBlkChain = buf;
     pHqpCb->pCurIocb = pHqpCb->pIocbBlkChain->iocb;
     pHqpCb->state = HQP_STATE_SLOW_PATH_REQ;
     pHqpCb->pIocbBlkChain->next = 0;
     pHqpCb->pDrp = buf;
     buf->mbuf = buf->lbuf.drp.nxt_crp_adr;
     buf->lbuf.drp.nxt_crp_adr.full_adr = 0;
     ProcessSlowPathRequest(hqpId);
     break;
    } else {



     enque(buf, &iocbBlkWaitQ);
     continue;
    }
   }




   if (pHqpCb->pIocbBlkChain) {
    curBlk = pHqpCb->pIocbBlkChain->next;
    while (curBlk->next) {
     curBlk = curBlk->next;
    }
    curBlk->next = buf;
   } else {
    pHqpCb->pIocbBlkChain = buf;
    pHqpCb->iocbIndx = 0;
   }
   buf->next = 0;



   if (pHqpCb->state == HQP_STATE_WAIT_IOCB_BLK) {
    ProcessSlowPathRequest(hqpId);
   }
  }
# 650 "main.c"
  if (simIocbComplete) {

   SlowPathIocb_Ct6DsdList();







   passCount++;
  }



 }

shdMb0 &= ~0x0002;
*rMb = shdMb0;
}
# 708 "main.c"
void ProcessSlowPathRequest(int hqpId) {

unsigned long treg;
hqpCb *pHqpCb = HqpLookup[hqpId];
bufDesc *pDrpCrp;
# 721 "main.c"
 if (!hqpCntxt[hqpId].valid) {







  getHqpContext(hqpId);
 }





  if (pHqpCb->state == HQP_STATE_SLOW_PATH_REQ ) {



simIocbComplete = 0;
shdMb0 |= 0x0004;
*rMb = shdMb0;



  pHqpCb->iocbIndx = 0;
  pHqpCb->state = HQP_STATE_PROC_IOCB;
  pHqpCb->iocbCount = pHqpCb->pCurIocb->hdr.iocb_count;
  pHqpCb->numIocbProcessed = 0;
  }



 while(1) {



  if (!processIocb(hqpId)) {
   return;
  }
  pHqpCb->numIocbProcessed += 1;
  pHqpCb->iocbIndx++;
  pHqpCb->iocbCount--;
# 789 "main.c"
  if (pHqpCb->iocbCount) {
# 800 "main.c"
   if (pHqpCb->iocbIndx == ((pHqpCb->pIocbBlkChain->hqpId & (0x07 << 13)) >> 13) ) {
    if (pHqpCb->pIocbBlkChain->next) {
     bufDesc *pCurIocbBlk = pHqpCb->pIocbBlkChain;



     pHqpCb->iocbIndx = 0;



     pHqpCb->pIocbBlkChain = pHqpCb->pIocbBlkChain->next;
     pHqpCb->pCurIocb = pHqpCb->pIocbBlkChain->iocb;



     if ( pCurIocbBlk->hqpId & (0x03 << 11)) {
      enqueFpFifo((unsigned long)pCurIocbBlk);
     }

    } else {



     if ( pHqpCb->pIocbBlkChain->hqpId & (0x03 << 11)) {
      enqueFpFifo((unsigned long)(pHqpCb->pIocbBlkChain));
     }




     pHqpCb->state = HQP_STATE_WAIT_IOCB_BLK;
     pHqpCb->pIocbBlkChain = 0;




     int count = pHqpCb->iocbCount;
     if (pHqpCb->iocbCount > 4) {
      count = 4;
     }
     treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpIocbFetchReg)))));

     while ( !(treg & (1<<31)) ) {
      treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpIocbFetchReg)))));
     }
     treg = (count << 16) + hqpId;
     (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpIocbFetchReg)))) = treg);

*rMb = shdMb0 | 0x0008;
    hqmFetchHdwSim();
*rMb = shdMb0;

    return;

    }
   } else {



    pHqpCb->pCurIocb = &pHqpCb->pIocbBlkChain->iocb[pHqpCb->iocbIndx];
   }

  } else {
   break;
  }
  }

  opcodeFormatRamEntry opcodeFmt;
  int protocol = hqpCntxt[hqpId].type - 1;


  opcodeFmt = ReadOpcodeFormatRam(pHqpCb->pDrp->lbuf.drp.gen_iocb[0] & 0xFF, protocol);







  if (pHqpCb->pT10Cntxt) {
  bufDesc *pDrpCrpDesc = pHqpCb->pT10Cntxt;
  bufDesc *pCurDrpCrpDesc;



   pHqpCb->pDrp->lbuf.drp.gen_def[0] = pHqpCb->pT10Cntxt->mbuf.full_adr | 0x80000000;




   if (opcodeFmt.createAlcbs) {




    pDrpCrpDesc->lbuf.drp.misc_data[0] = pDrpCrpDesc->mbuf.full_adr | 0x80000000;
    pDrpCrpDesc->lbuf.drp.misc_data[1] = 1;
    pDrpCrpDesc->lbuf.drp.misc_data[2] = pDrpCrpDesc->lbuf.drp.dsd[0].addr_lo;
    pDrpCrpDesc->lbuf.drp.misc_data[3] = pDrpCrpDesc->lbuf.drp.dsd[0].addr_hi;
    pDrpCrpDesc->lbuf.drp.misc_data[4] = pDrpCrpDesc->lbuf.drp.dsd[0].length;
    pDrpCrpDesc->lbuf.drp.misc_data[5] = pDrpCrpDesc->lbuf.drp.gen_iocb[3];
   }
# 912 "main.c"
   while (pDrpCrpDesc) {

    treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))));

    while ( !(treg & (1<<31)) ) {
     treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))));
    }

    (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0AdrReg)))) = pDrpCrpDesc->mbuf.blk_id);
    (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0BlkOffsetReg)))) = 0);
    (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0SpAdrReg)))) = (((unsigned long)&pDrpCrpDesc->lbuf) & (0x00007FFF)));
    treg = (pDrpCrpDesc->mbuf.mem_rgn << 16) | (0<<15) | sizeof(drp_crp);

    (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))) = treg);


*rMb = shdMb0 | 0x0008;
   hqmMimDma0HdwSim();
*rMb = shdMb0;

   pCurDrpCrpDesc = pDrpCrpDesc;
    pDrpCrpDesc = pDrpCrpDesc->next;
   enque(pCurDrpCrpDesc,&drpCrpFreePool);
   }
  }




 bufDesc *pDrpCrpDesc = pHqpCb->pDrp;





  if (opcodeFmt.createAlcbs) {





   pDrpCrpDesc->lbuf.drp.misc_data[0] = pDrpCrpDesc->mbuf.full_adr | 0x80000000;
   pDrpCrpDesc->lbuf.drp.misc_data[1] = 1;
   pDrpCrpDesc->lbuf.drp.misc_data[2] = pDrpCrpDesc->lbuf.drp.dsd[0].addr_lo;
   pDrpCrpDesc->lbuf.drp.misc_data[3] = pDrpCrpDesc->lbuf.drp.dsd[0].addr_hi;
   pDrpCrpDesc->lbuf.drp.misc_data[4] = pDrpCrpDesc->lbuf.drp.dsd[0].length;
   pDrpCrpDesc->lbuf.drp.misc_data[5] = pDrpCrpDesc->lbuf.drp.gen_iocb[3];
  }





 treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))));

 while ( !(treg & (1<<31)) ) {
  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))));
 }

 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0AdrReg)))) = pDrpCrpDesc->mbuf.blk_id);
 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0BlkOffsetReg)))) = 0);
 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0SpAdrReg)))) = (((unsigned long)&pDrpCrpDesc->lbuf) & (0x00007FFF)));
 treg = (pDrpCrpDesc->mbuf.mem_rgn << 16) | (0<<15) | sizeof(drp_crp);

 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))) = treg);

*rMb = shdMb0 | 0x0008;
  hqmMimDma0HdwSim();
*rMb = shdMb0;


 pDrpCrpDesc = pDrpCrpDesc->next;
 bufDesc *pCurDrpCrpDesc;






  while (pDrpCrpDesc) {

   treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))));

   while ( !(treg & (1<<31)) ) {
    treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))));
   }

   (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0AdrReg)))) = pDrpCrpDesc->mbuf.blk_id);
   (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0BlkOffsetReg)))) = 0);
   (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0SpAdrReg)))) = (((unsigned long)&pDrpCrpDesc->lbuf) & (0x00007FFF)));
   treg = (pDrpCrpDesc->mbuf.mem_rgn << 16) | (0<<15) | sizeof(drp_crp);
   (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimDma0CmdReg)))) = treg);

*rMb = shdMb0 | 0x0008;
  hqmMimDma0HdwSim();
*rMb = shdMb0;

  pCurDrpCrpDesc = pDrpCrpDesc;
   pDrpCrpDesc = pDrpCrpDesc->next;
  enque(pCurDrpCrpDesc,&drpCrpFreePool);
  }






shdMb0 |= 0x0010;
*rMb = shdMb0;
# 1034 "main.c"
 unsigned long *pMqsIocb = (unsigned long *)pHqpCb->pDrp;
  pMqsIocb[31] = pHqpCb->pDrp->mbuf.full_adr | (1<<31);
  pMqsIocb[0] = (hqpCntxt[hqpId].type) | (hqpCntxt[hqpId].port << 4) | (hqpId << 7);
# 1045 "main.c"
  unsigned long conxId = opcodeFmt.conxIdPrefix<<24;

  switch (opcodeFmt.conxIdPsn) {

   case 0x0:



    treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->conxIdIncCountReg)))));
    while (!(treg & (0x1<<31))) {
     treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->conxIdIncCountReg)))));
    }

    (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->conxIdIncCountReg)))) = 0);

*rMb = shdMb0 | 0x0008;
    mqsCnxIdIncHdwSim();
*rMb = ~shdMb0;

    treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->conxIdIncCountReg)))));
    while (!(treg & (0x1<<31))) {
     treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->conxIdIncCountReg)))));
    }
    conxId += (treg & 0x00FFFFFF);

    break;

   case 0x01:
    conxId += hqpCntxt[hqpId].vpid;
    break;

   case 0x02:
    conxId += pMqsIocb[3] & 0x0000FFFF;
    break;

   case 0x03:
    conxId += pMqsIocb[3] & 0x00FFFFFF;
    break;
  }

  (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsTieCnxReg)))) = conxId);




  switch (hqpCntxt[hqpId].type-1) {

   case (0x01 -1): {



    unsigned long temp = (pMqsIocb[3] & 0x0000FFFF) + ( hqpCntxt[hqpId].hqpCntxtW1 & 0x0FFF0000);



    (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsTiePrf0Reg)))) = temp);



    (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsTiePrf0Reg)))) = 0);
    break;
   }
   case (0x02 -1):

    break;

   case (0x03 -1):

    break;

   case (0x04 -1):

    break;

  }



  (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsTieL1qReg)))) = hqpCntxt[hqpId].mqsL1q);


shdMb0 &= ~0x0010;
*rMb = shdMb0;




  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsDma0CmdReg)))));

  while ( !(treg & (1<<31)) ) {
   treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsDma0CmdReg)))));
  }

  (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsDma0CmdReg)))) = (unsigned long)pMqsIocb);


*rMb = shdMb0 | 0x0008;
  hqmMqsDma0HdwSim();
*rMb = shdMb0;
# 1152 "main.c"
  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsDma0CmdReg)))));

  while ( !(treg & (1<<31)) ) {
   treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mqsDma0CmdReg)))));
  }





 treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCmdCmpltReg)))));

 while ( !(treg & (1<<31)) ) {
  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCmdCmpltReg)))));
 }
 treg = (pHqpCb->numIocbProcessed << 16) + hqpId;
 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCmdCmpltReg)))) = treg);

*rMb = shdMb0 | 0x0008;
 hqmCmdCmpltHdwSim();
*rMb = shdMb0;







 ReleaseHqpResources(hqpId);


simIocbComplete = 1;




shdMb0 &= ~0x0004;
*rMb = shdMb0;
}
# 1212 "main.c"
int processIocb(int hqpId) {

int protocol = hqpCntxt[hqpId].type-1;
hqpCb *pHqpCb = HqpLookup[hqpId];
bufDesc * pDrpCrp;
opcodeFormatRamEntry opcodeFmt;







 switch (protocol) {




  case (0x01 -1): {

   unsigned long iocbIndx = pHqpCb->iocbIndx;




   fc_iocb_struct *pIocb = pHqpCb->pCurIocb;




   opcodeFmt = ReadOpcodeFormatRam(pIocb->hdr.iocb_type, protocol);







   switch (pIocb->hdr.iocb_type) {

    case 0x48: {

     dmaCb *pDmaCb = pHqpCb->pDmaCb;
     unsigned long treg;







     switch (pHqpCb->state) {

      case HQP_STATE_PROC_IOCB:




       if (pIocb->cmnd6.cmnd_cntl & 0x0004) {
        pHqpCb->flags |= 0x0001;
       }




       pDmaCb->spBufAdr = &pHqpCb->pDrp->lbuf.drp.dsd[0];



       pHqpCb->pBuf = pDmaCb->spBufAdr;
       pDmaCb->type = DMA_TYPE_DSD;
       pDmaCb->hqpId = hqpId;
       if (pHqpCb->flags & 0x0001) {
        pHqpCb->flags |= 0x0002;
        pDmaCb->adrh = pIocb->cmnd6.cmnd_dataseg0.addr_hi;
        pDmaCb->adrl = pIocb->cmnd6.cmnd_dataseg0.addr_lo;
        pDmaCb->length = pIocb->cmnd6.cmnd_dataseg0.length;
        pHqpCb->dsdCount = pIocb->cmnd6.cmnd_dataseg0.length / (sizeof(dseg_struct)*4) ;
        pHqpCb->state = HQP_STATE_WAIT_FOR_DSD_DMA;

        pHqpCb->dsdIndxInDrpCrp = 0;




        if (pDmaCb->length > ((4 +1)*sizeof(dseg_struct)*4)) {
         pDmaCb->length = 4*sizeof(dseg_struct)*4;
        }



        if (!queIsEmpty(&hostDma)) {
         enque(pDmaCb,&hostDma);
         return 0;
        }

        treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));

        while ( !(treg & (1 << 31)) ) {
         treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));
        }

        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaSpAdrReg)))) = (((unsigned long)pDmaCb->spBufAdr) & (0x00007FFF)));
        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrlReg)))) = pDmaCb->adrl);
        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrhReg)))) = pDmaCb->adrh);
        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaHqpIdReg)))) = hqpId);
        treg = (0<<14) + pDmaCb->length;

        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))) = treg);
        enque(pDmaCb,&hostDma);


*rMb = shdMb0 | 0x0008;
        hostDmaHdwSim();
*rMb = shdMb0;



        return 0;
       } else {




       }
       break;




      case HQP_STATE_WAIT_FOR_DSD_DMA:

       if (!ProcessDsdList(hqpId,0)) {
        return 0;
       }
       break;




      case HQP_STATE_WAIT_FOR_DSD_LPTR_DMA: {

       pHqpCb->state = HQP_STATE_WAIT_FOR_DSD_DMA;
       if (!ProcessDsdList(hqpId, 1)) {
        return 0;
       }
       break;
     }
     }
     break;
    }





    case 0x18 : {






     dseg_struct *pDseg = &(pIocb->cmnd7.cmnd_dataseg0);
     dseg_struct *pDsegInDrpCrp = &pHqpCb->pDrp->lbuf.drp.dsd[0];





     pDsegInDrpCrp[0].addr_hi = pDseg->addr_hi;
     pDsegInDrpCrp[0].addr_lo = pDseg->addr_lo;
     pDsegInDrpCrp[0].length = pDseg->length;
     pHqpCb->dsdIndxInDrpCrp = 1;
     pHqpCb->flags |= 0x0002;
     pHqpCb->dsdCount = pIocb->cmnd7.cmnd_seg_cnt-1;
     break;
    }
# 1398 "main.c"
    case 0x0A: {






     dseg_struct *pDsegInDrpCrp;
     dseg_struct *pDseg = &pIocb->cont1.cont_dataseg[pHqpCb->dsdIndxInBuf];

     while (pHqpCb->dsdCount) {

      if (pHqpCb->flags & 0x0002) {
       pDsegInDrpCrp = &pHqpCb->pDrp->lbuf.drp.dsd[pHqpCb->dsdIndxInDrpCrp];

       while ( (pHqpCb->dsdIndxInDrpCrp < 4) &&
        (pHqpCb->dsdIndxInBuf < 5) &&
        (pHqpCb->dsdCount)) {

        if (!pDseg->length) {



        }
        pDsegInDrpCrp->addr_hi = pDseg->addr_hi;
        pDsegInDrpCrp->addr_lo = pDseg->addr_lo;
        pDsegInDrpCrp->length = pDseg->length;
        pDsegInDrpCrp++;
        pDseg++;
        pHqpCb->dsdIndxInDrpCrp++;
        pHqpCb->dsdIndxInBuf++;
        pHqpCb->dsdCount--;
       }



       if (!pHqpCb->dsdCount) {
     break;
    }

       if (pHqpCb->dsdIndxInDrpCrp == 4) {



        pHqpCb->flags &= ~0x0002;



        pHqpCb->pDrp->next = allocDrpCrp(hqpId);







        if (!pHqpCb->pDrp->next) {

         return 0;
        }



        pHqpCb->pDrp->lbuf.drp.nxt_crp_adr.full_adr = pHqpCb->pDrp->next->mbuf.full_adr | 0x80000000;






        pHqpCb->pCrp = pHqpCb->pDrp->next;
        pHqpCb->pCrp->next = 0;
        pHqpCb->dsdIndxInDrpCrp = 0;




        pDsegInDrpCrp = &pHqpCb->pCrp->lbuf.crp.dsd_list_0[0];

       }


       if (pHqpCb->dsdIndxInBuf == 5) {
   break;
 }



      } else {



       pDsegInDrpCrp = &pHqpCb->pCrp->lbuf.crp.dsd_list_0[pHqpCb->dsdIndxInDrpCrp];

       while ( (pHqpCb->dsdIndxInDrpCrp < 20) &&
        (pHqpCb->dsdIndxInBuf < 5) &&
        (pHqpCb->dsdCount)) {

        if (!pDseg->length) {



}
        pDsegInDrpCrp->addr_hi = pDseg->addr_hi;
        pDsegInDrpCrp->addr_lo = pDseg->addr_lo;
        pDsegInDrpCrp->length = pDseg->length;

        pDsegInDrpCrp++;
        pDseg++;
        pHqpCb->dsdIndxInDrpCrp++;
        pHqpCb->dsdIndxInBuf++;
        pHqpCb->dsdCount--;
       }



       if (!pHqpCb->dsdCount) {
        break;
       }

       if (pHqpCb->dsdIndxInDrpCrp == 20) {




        pHqpCb->pCrp->next = allocDrpCrp(hqpId);







        if (!pHqpCb->pCrp->next) {

         return 0;
        }




        pHqpCb->pCrp->lbuf.crp.nxt_crp_ptr.full_adr = pHqpCb->pCrp->next->mbuf.full_adr | 0x80000000;




        pHqpCb->pCrp = pHqpCb->pCrp->next;
        pHqpCb->pCrp->next = 0;
        pHqpCb->dsdIndxInDrpCrp = 0;




        pDsegInDrpCrp = &pHqpCb->pCrp->lbuf.crp.dsd_list_0[0];

       }



       if (pHqpCb->dsdIndxInBuf == 5) {
        break;
    }

    }

   }
     break;
    }


    case 0x6A: {

     dmaCb *pDmaCb = pHqpCb->pDmaCb;
     unsigned long treg;
# 1580 "main.c"
     switch (pHqpCb->state) {

      case HQP_STATE_PROC_IOCB:

       if (pIocb->cmnd_crc2.cmnd_cntl & 0x0004) {
        pHqpCb->flags |= 0x0001;
       }
       if (pIocb->cmnd_crc2.cmnd_cntl & 0x0008) {
        pHqpCb->flags |= 0x0004;
       }



       pHqpCb->pT10Cntxt = allocDrpCrp(hqpId);







       if (!pHqpCb->pT10Cntxt) {

        return 0;
       }





       pDmaCb->type = DMA_TYPE_CRC_CNTXT;
       pDmaCb->spBufAdr = &pHqpCb->pT10Cntxt->lbuf;
       pDmaCb->adrh = pIocb->cmnd_crc2.cmnd_crc_ctx_dsd.addr_hi;
       pDmaCb->adrl = pIocb->cmnd_crc2.cmnd_crc_ctx_dsd.addr_lo;
       pDmaCb->length = sizeof(dcrc_ctxt_struct)*4;
       pDmaCb->hqpId = hqpId;
       pHqpCb->state = HQP_STATE_WAIT_FOR_CRC_CNTXT_DMA;



       if (!queIsEmpty(&hostDma)) {
        enque(pDmaCb, &hostDma);
        return 0;
       }

       treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));

       while ( !(treg & (1 << 31)) ) {
        treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));
       }

       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaSpAdrReg)))) = (((unsigned long)pDmaCb->spBufAdr) & (0x00007FFF)));
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrlReg)))) = pDmaCb->adrl);
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrhReg)))) = pDmaCb->adrh);
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaHqpIdReg)))) = hqpId);
       treg = (0<<14) + pDmaCb->length;

       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))) = treg);
       enque(pDmaCb,&hostDma);


*rMb = shdMb0 | 0x0008;
       hostDmaHdwSim();
*rMb = shdMb0;



       return 0;
       break;




      case HQP_STATE_WAIT_FOR_DSD_DMA:

       if (!ProcessDsdList(hqpId,0)) {
        return 0;
       }





       if (!(pHqpCb->flags & 0x0004)) {
        break;
       }
       dcrc_ctxt_struct *pCrcCntxt = (dcrc_ctxt_struct *)&pHqpCb->pT10Cntxt->lbuf;
       pDmaCb->type = DMA_TYPE_DSD;
       pHqpCb->pT10Cntxt->next = allocDrpCrp(hqpId);



       pHqpCb->pT10Cntxt->lbuf.drp.nxt_crp_adr.full_adr = pHqpCb->pT10Cntxt->next->mbuf.full_adr | 0x80000000;
       pHqpCb->flags &= ~0x0002;
       pHqpCb->pCrp = pHqpCb->pT10Cntxt->next;
       pDmaCb->spBufAdr = &pHqpCb->pCrp->lbuf.crp.dsd_list_0[0];
       pDmaCb->adrh = pCrcCntxt->db.dif_dsd.addr_hi;
       pDmaCb->adrl = pCrcCntxt->db.dif_dsd.addr_lo;
       pDmaCb->length = pCrcCntxt->db.dif_dsd.length;
       pHqpCb->dsdCount = pCrcCntxt->db.dif_dsd.length / (sizeof(dseg_struct)*4);
       pHqpCb->state = HQP_STATE_WAIT_FOR_CRC_DIF_DMA;




       if (pDmaCb->length > ((20 +1)*sizeof(dseg_struct)*4)) {
        pDmaCb->length = 20*sizeof(dseg_struct)*4;
       }




       if (!queIsEmpty(&hostDma)) {
        enque(pDmaCb,&hostDma);
        return 0;
       }

       treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));

       while ( !(treg & (1 << 31)) ) {
        treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));
       }

       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaSpAdrReg)))) = (((unsigned long)pDmaCb->spBufAdr) & (0x00007FFF)));
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrlReg)))) = pDmaCb->adrl);
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrhReg)))) = pDmaCb->adrh);
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaHqpIdReg)))) = hqpId);
       treg = (0<<14) + pDmaCb->length;

       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))) = treg);
       enque(pDmaCb,&hostDma);


*rMb = shdMb0 | 0x0008;
       hostDmaHdwSim();
*rMb = shdMb0;



       return 0;

       break;




       case HQP_STATE_WAIT_FOR_DSD_LPTR_DMA: {

        pHqpCb->state = HQP_STATE_WAIT_FOR_DSD_DMA;
        if (!ProcessDsdList(hqpId, 1)) {
         return 0;
        }





        if (!(pHqpCb->flags & 0x0004)) {
         break;
        }
        dcrc_ctxt_struct *pCrcCntxt = (dcrc_ctxt_struct *)&pHqpCb->pT10Cntxt->lbuf;
        pDmaCb->type = DMA_TYPE_DSD;
        pHqpCb->pT10Cntxt->next = allocDrpCrp(hqpId);
        pHqpCb->flags &= ~0x0002;
        pHqpCb->pCrp = pHqpCb->pT10Cntxt->next;
        pDmaCb->spBufAdr = &pHqpCb->pCrp->lbuf.crp.dsd_list_0[0];
        pDmaCb->adrh = pCrcCntxt->db.dif_dsd.addr_hi;
        pDmaCb->adrl = pCrcCntxt->db.dif_dsd.addr_lo;
        pDmaCb->length = pCrcCntxt->db.dif_dsd.length;
        pHqpCb->dsdCount = pCrcCntxt->db.dif_dsd.length / (sizeof(dseg_struct)*4);
        pHqpCb->state = HQP_STATE_WAIT_FOR_CRC_DIF_DMA;





        if (pDmaCb->length > ((20 +1)*sizeof(dseg_struct)*4)) {
         pDmaCb->length = 20*sizeof(dseg_struct)*4;
        }




        if (!queIsEmpty(&hostDma)) {
         enque(pDmaCb,&hostDma);
         return 0;
        }

        treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));

        while ( !(treg & (1 << 31)) ) {
         treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));
        }

        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaSpAdrReg)))) = (((unsigned long)pDmaCb->spBufAdr) & (0x00007FFF)) >> 2);
        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrlReg)))) = pDmaCb->adrl);
        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrhReg)))) = pDmaCb->adrh);
        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaHqpIdReg)))) = hqpId);
        treg = (0<<14) + pDmaCb->length;

        (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))) = treg);
        enque(pDmaCb,&hostDma);




        hostDmaHdwSim();




        return 0;

        break;
       }






      case HQP_STATE_WAIT_FOR_CRC_DIF_DMA:

       if (!ProcessDsdList(hqpId,0)) {
        return 0;
       }
       break;




      case HQP_STATE_WAIT_FOR_DIF_LPTR_DMA:

       pHqpCb->state = HQP_STATE_WAIT_FOR_CRC_DIF_DMA;
       if (!ProcessDsdList(hqpId, 1)) {
        return 0;
       }
       break;




      case HQP_STATE_WAIT_FOR_CRC_CNTXT_DMA: {

       if (!(pHqpCb->flags & (0x0001 | 0x0004 ))) {
        break;
       }



       pHqpCb->pBuf = pDmaCb->spBufAdr;
       dcrc_ctxt_struct *pCrcCntxt = (dcrc_ctxt_struct *)&pHqpCb->pT10Cntxt->lbuf;
       pDmaCb->type = DMA_TYPE_DSD;

       if (pHqpCb->flags & 0x0001) {
        pDmaCb->spBufAdr = &pHqpCb->pDrp->lbuf.drp.dsd[0];
        pHqpCb->flags |= 0x0002;
        pDmaCb->adrh = pCrcCntxt->db.data_dsd.addr_hi;
        pDmaCb->adrl = pCrcCntxt->db.data_dsd.addr_lo;
        pDmaCb->length = pCrcCntxt->db.data_dsd.length;
        pHqpCb->dsdCount = pCrcCntxt->db.data_dsd.length / (sizeof(dseg_struct)*4);
        pHqpCb->state = HQP_STATE_WAIT_FOR_DSD_DMA;




        if (pDmaCb->length > ((4 +1)*sizeof(dseg_struct)*4)) {
         pDmaCb->length = 4*sizeof(dseg_struct)*4;
        }

       } else if (pHqpCb->flags & 0x0004) {
        pHqpCb->pT10Cntxt->next = allocDrpCrp(hqpId);



        pHqpCb->pT10Cntxt->lbuf.drp.nxt_crp_adr.full_adr = pHqpCb->pT10Cntxt->next->mbuf.full_adr | 0x80000000;
        pHqpCb->flags &= ~0x0002;
        pHqpCb->pCrp = pHqpCb->pT10Cntxt->next;
        pDmaCb->spBufAdr = &pHqpCb->pCrp->lbuf.crp.dsd_list_0[0];
        pDmaCb->adrh = pCrcCntxt->db.dif_dsd.addr_hi;
        pDmaCb->adrl = pCrcCntxt->db.dif_dsd.addr_lo;
        pDmaCb->length = pCrcCntxt->db.dif_dsd.length;
        pHqpCb->dsdCount = pCrcCntxt->db.dif_dsd.length / (sizeof(dseg_struct)*4);
        pHqpCb->state = HQP_STATE_WAIT_FOR_CRC_DIF_DMA;





        if (pDmaCb->length > ((20 +1)*sizeof(dseg_struct)*4)) {
         pDmaCb->length = 20*sizeof(dseg_struct)*4;
       }

       }
       pHqpCb->dsdIndxInDrpCrp = 0;



       if (!queIsEmpty(&hostDma)) {
        enque(pDmaCb,&hostDma);
        return 0;
       }

       treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));

       while ( !(treg & (1 << 31)) ) {
        treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));
       }

       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaSpAdrReg)))) = (((unsigned long)pDmaCb->spBufAdr) & (0x00007FFF)));
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrlReg)))) = pDmaCb->adrl);
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrhReg)))) = pDmaCb->adrh);
       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaHqpIdReg)))) = hqpId);
       treg = (0<<14) + pDmaCb->length;

       (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))) = treg);
       enque(pDmaCb,&hostDma);


*rMb = shdMb0 | 0x0008;
       hostDmaHdwSim();
*rMb = shdMb0;



       return 0;
      }
      break;
     }

    }

    default:
     break;

   }
   break;
  }

  case (0x02 -1):
   break;

  case (0x03 -1):
   break;

  case (0x04 -1):
   break;

 }


 return 1;
}
# 1946 "main.c"
int ProcessDsdList(int hqpId, int dsdListPointer) {

hqpCb *pHqpCb = HqpLookup[hqpId];
dmaCb *pDmaCb = pHqpCb->pDmaCb;

unsigned long workingOnDrp = (pHqpCb->flags & 0x0002)? 1 : 0;
unsigned long numDsegsInDrpCrp = (pHqpCb->pDmaCb->length / (sizeof(dseg_struct)*4));

unsigned long totalNumDsds = pHqpCb->dsdCount-1;
dseg_struct *pDsdListPtr;
unsigned long treg;





 pHqpCb->dsdCount -= numDsegsInDrpCrp;
 pHqpCb->dsdIndxInDrpCrp += numDsegsInDrpCrp;



 if (!pHqpCb->dsdCount) {



  pDsdListPtr = ((dseg_struct *)pDmaCb->spBufAdr)+(numDsegsInDrpCrp-1);




  if (!dsdListPointer) {
  pHqpCb->dsdIndxInDrpCrp--;
  numDsegsInDrpCrp--;
 }

  if (!pDsdListPtr->length) {



    pHqpCb->flags &= ~0x0002;
# 1994 "main.c"
   if (pHqpCb->dsdIndxInDrpCrp == 0) {




    bufDesc *pCurCrpDrp = pHqpCb->pDrp;
    while (pCurCrpDrp && (pCurCrpDrp->next != pHqpCb->pCrp)) {
     pCurCrpDrp = pCurCrpDrp->next;
   }
    pCurCrpDrp->next = 0;
    enque(pHqpCb->pCrp,&drpCrpFreePool);





    pCurCrpDrp->lbuf.crp.nxt_crp_ptr.full_adr = 0;
   }
   return 1;
  }



  pDmaCb->adrh = pDsdListPtr->addr_hi;
  pDmaCb->adrl = pDsdListPtr->addr_lo;
  pDmaCb->length = pDsdListPtr->length;
  pHqpCb->dsdCount = pDsdListPtr->length / (sizeof(dseg_struct)*4);

 } else {



  pDmaCb->adrl += pDmaCb->length;
  pDmaCb->length = pHqpCb->dsdCount * sizeof(dseg_struct) *4;
   }



 if (pDmaCb->length == (sizeof(dseg_struct)*4)) {



  pDmaCb->spBufAdr = dmalloc(sizeof(dseg_struct));
  pHqpCb->state = HQP_STATE_WAIT_FOR_DSD_LPTR_DMA;






 } else if (workingOnDrp) {



  if (numDsegsInDrpCrp == 4) {
    workingOnDrp = 0;
    pHqpCb->flags &= ~0x0002;




    pHqpCb->pDrp->next = allocDrpCrp(hqpId);







    if (!pHqpCb->pDrp->next) {

     return 0;
    }



    pHqpCb->pDrp->lbuf.drp.nxt_crp_adr.full_adr = pHqpCb->pDrp->next->mbuf.full_adr | 0x80000000;



    pHqpCb->pCrp = pHqpCb->pDrp->next;
    pHqpCb->pCrp->next = 0;
    pHqpCb->dsdIndxInDrpCrp = 0;




   pDmaCb->spBufAdr = &pHqpCb->pCrp->lbuf.crp.dsd_list_0[0];



   if (pDmaCb->length > ( (20 +1)*sizeof(dseg_struct)*4) ) {
    pDmaCb->length = 20*sizeof(dseg_struct)*4;
   }

  } else {



   pDmaCb->spBufAdr += (4 - numDsegsInDrpCrp);
   pDmaCb->length = (4 - numDsegsInDrpCrp) * sizeof(dseg_struct) *4;
   }




 } else {




   if (pHqpCb->dsdIndxInDrpCrp == 20) {



    pHqpCb->pCrp->next = allocDrpCrp(hqpId);







    if (!pHqpCb->pCrp->next) {


     return 0;
    }




    pHqpCb->pCrp->lbuf.crp.nxt_crp_ptr.full_adr = pHqpCb->pCrp->next->mbuf.full_adr | 0x80000000;




    pHqpCb->pCrp = pHqpCb->pCrp->next;
    pHqpCb->pCrp->next = 0;
    pHqpCb->dsdIndxInDrpCrp = 0;



   pDmaCb->spBufAdr = &pHqpCb->pCrp->lbuf.crp.dsd_list_0[0];



   if (pDmaCb->length > ( (20 +1)*sizeof(dseg_struct)*4) ) {
    pDmaCb->length = 20*sizeof(dseg_struct)*4;
   }
  } else {



   pDmaCb->spBufAdr += (20 - numDsegsInDrpCrp);
   pDmaCb->length = (20 - numDsegsInDrpCrp) * sizeof(dseg_struct)*4;
  }
 }
# 2161 "main.c"
 if (!queIsEmpty(&hostDma)) {
  enque(pDmaCb,&hostDma);
  return 0;
 }

 treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));

 while ( !(treg & (1 << 31)) ) {
  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))));
 }

 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaSpAdrReg)))) = (((unsigned long)pDmaCb->spBufAdr) & (0x00007FFF)));
 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrlReg)))) = pDmaCb->adrl);
 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaAdrhReg)))) = pDmaCb->adrl);
 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaHqpIdReg)))) = hqpId);
 treg = (0<<14) + pDmaCb->length;

 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hostDmaCmdReg)))) = treg);
 enque(pDmaCb,&hostDma);


*rMb = shdMb0 | 0x0008;
 hostDmaHdwSim();
*rMb = shdMb0;


 return 0;
}
# 2207 "main.c"
void ReleaseHqpResources(int hqpId) {

hqpCb *pHqpCb = HqpLookup[hqpId];
unsigned long treg;
# 2219 "main.c"
 if (pHqpCb->pBuf) {
  dfree(pHqpCb->pBuf);
 }





 enqueFpFifo((unsigned long)(pHqpCb->pDrp));

 enque(pHqpCb,&hqpCbFreePool);
 HqpLookup[hqpId] = 0;
}
# 2252 "main.c"
void getHqpContext(int hqpId) {

unsigned long treg;
hqmHqpCntxt *pBuf;
hqpCntxtEntry *pHqpCntxtEntry = &hqpCntxt[hqpId];





 treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCntxtCmdReg)))));

 while ( !(treg & (1<<31)) ) {
  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCntxtCmdReg)))));
 }



 pBuf = (hqmHqpCntxt *)dmalloc(sizeof(hqmHqpCntxt));

 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCntxtSpAdrReg)))) = ((((unsigned long)pBuf) & (0x00007FFF))));
 (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCntxtCmdReg)))) = hqpId);


*rMb = shdMb0 | 0x0008;
 hqpContextDmaHdwSim();;
*rMb = shdMb0;


 treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCntxtCmdReg)))));

 while ( !(treg & (1<<31)) ) {
  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->hqpCntxtCmdReg)))));
 }




 pHqpCntxtEntry->vpid = pBuf->vpid;
 pHqpCntxtEntry->port = pBuf->port;
 pHqpCntxtEntry->type = pBuf->type;
 pHqpCntxtEntry->iocbRegion = pBuf->iocbRegion;
 pHqpCntxtEntry->mqsL1q = pBuf->mqsL1Que;
 pHqpCntxtEntry->cntxtSize = pBuf->cntxtSize;
 pHqpCntxtEntry->cntxtRegion = pBuf->cntxtRegion;
 if (pBuf->state == 0x8) {
  pHqpCntxtEntry->valid = 1;
 } else {
  pHqpCntxtEntry->valid = 0;
 }






 dfree(pBuf);
}
# 2338 "main.c"
bufDesc *allocDrpCrp(int hqpId) {

unsigned long treg;
hqpCb *pHqpCb = HqpLookup[hqpId];
bufDesc * pDrpCrp;
# 2351 "main.c"
 if (!queIsEmpty(&drpCrpFreePool)) {
  pDrpCrp = (bufDesc *)deque(&drpCrpFreePool);

  memclrMim0(pDrpCrp,sizeof(bufDesc));




  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimBlkRqReg)))));

  while ( !(treg & (1<<31)) ) {
   treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimBlkRqReg)))));
  }




  treg = (1<<27) + (hqpCntxt[hqpId].iocbRegion << 20);
  (*((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimBlkRqReg)))) = treg);


*rMb = shdMb0 | 0x0008;
 mlmHdwSim();
*rMb = shdMb0;

  treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimBlkRqReg)))));
  while ( !(treg & (1<<31)) ) {
   treg = ( *((volatile unsigned long *)(((unsigned long)&spRegs) + (((unsigned long)&((sp_regs *)0)->mimBlkRqReg)))));
  }
  if (treg & (1<<30)) {
   enque(pDrpCrp,&drpCrpFreePool);
   return 0;
  }



  pDrpCrp->mbuf.blk_id = treg & (0x7FF);
  pDrpCrp->mbuf.mem_rgn = hqpCntxt[hqpId].iocbRegion;
  return pDrpCrp;




 } else {
  return 0;
 }
}
# 2409 "main.c"
unsigned long calcTimerTime(timer *t) {

unsigned long time;
unsigned long delta = 0;
unsigned long *pStTick;
unsigned long *pEndTick;

 if (t->tick[1] < t->tick[0]) {
  time = (0xFFFFFFFF - (t->tick[0] - t->tick[1])) + 1;
 } else {
  time = t->tick[1] - t->tick[0];
 }
 pStTick = &(t->tick[2]);
 pEndTick = &(t->tick[3]);

 while (*pStTick) {
  if (*pEndTick < *pStTick) {
   delta += ((0xFFFFFFFF - (*pStTick - *pEndTick)) + 1);
  } else {
   delta += (*pEndTick - *pStTick);
  }
  pEndTick += 2;
  pStTick += 2;

 }
 return (time - delta);
}
