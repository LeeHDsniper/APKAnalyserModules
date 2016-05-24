.class public Lcom/google/android/gms/internal/zzhj;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzhj$zza;
    }
.end annotation


# instance fields
.field public final errorCode:I

.field public final orientation:I

.field public final zzAR:Lcom/google/android/gms/internal/zzip;

.field public final zzDB:Ljava/lang/String;

.field public final zzDO:Ljava/lang/String;

.field public final zzDW:J

.field public final zzDX:Z

.field public final zzDY:J

.field public final zzDZ:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

.field public final zzEc:Ljava/lang/String;

.field public final zzGF:Lorg/json/JSONObject;

.field public final zzGG:Lcom/google/android/gms/internal/zzea;

.field public final zzGH:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

.field public final zzGI:J

.field public final zzGJ:J

.field public final zzGK:Lcom/google/android/gms/ads/internal/formats/zzh$zza;

.field public final zzyA:J

.field public final zzyQ:Lcom/google/android/gms/internal/zzdz;

.field public final zzyR:Lcom/google/android/gms/internal/zzei;

.field public final zzyS:Ljava/lang/String;

.field public final zzyT:Lcom/google/android/gms/internal/zzec;

.field public final zzyw:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzyx:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzip;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzei;Ljava/lang/String;Lcom/google/android/gms/internal/zzea;Lcom/google/android/gms/internal/zzec;JLcom/google/android/gms/ads/internal/client/AdSizeParcel;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Ljava/lang/String;)V
    .registers 34
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/ads/internal/client/AdRequestParcel;",
            "Lcom/google/android/gms/internal/zzip;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;IJ",
            "Ljava/lang/String;",
            "Z",
            "Lcom/google/android/gms/internal/zzdz;",
            "Lcom/google/android/gms/internal/zzei;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzea;",
            "Lcom/google/android/gms/internal/zzec;",
            "J",
            "Lcom/google/android/gms/ads/internal/client/AdSizeParcel;",
            "JJJ",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            "Lcom/google/android/gms/ads/internal/formats/zzh$zza;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhj;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz p3, :cond_62

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    :goto_d
    iput-object v2, p0, Lcom/google/android/gms/internal/zzhj;->zzyw:Ljava/util/List;

    iput p4, p0, Lcom/google/android/gms/internal/zzhj;->errorCode:I

    if-eqz p5, :cond_64

    invoke-static {p5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    :goto_17
    iput-object v2, p0, Lcom/google/android/gms/internal/zzhj;->zzyx:Ljava/util/List;

    if-eqz p6, :cond_66

    invoke-static {p6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    :goto_1f
    iput-object v2, p0, Lcom/google/android/gms/internal/zzhj;->zzDZ:Ljava/util/List;

    iput p7, p0, Lcom/google/android/gms/internal/zzhj;->orientation:I

    iput-wide p8, p0, Lcom/google/android/gms/internal/zzhj;->zzyA:J

    iput-object p10, p0, Lcom/google/android/gms/internal/zzhj;->zzDB:Ljava/lang/String;

    iput-boolean p11, p0, Lcom/google/android/gms/internal/zzhj;->zzDX:Z

    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzyR:Lcom/google/android/gms/internal/zzei;

    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzyS:Ljava/lang/String;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzyT:Lcom/google/android/gms/internal/zzec;

    move-wide/from16 v0, p17

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzhj;->zzDY:J

    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzGH:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-wide/from16 v0, p20

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzhj;->zzDW:J

    move-wide/from16 v0, p22

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzhj;->zzGI:J

    move-wide/from16 v0, p24

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzhj;->zzGJ:J

    move-object/from16 v0, p26

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzEc:Ljava/lang/String;

    move-object/from16 v0, p27

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzGF:Lorg/json/JSONObject;

    move-object/from16 v0, p28

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzGK:Lcom/google/android/gms/ads/internal/formats/zzh$zza;

    move-object/from16 v0, p29

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzDO:Ljava/lang/String;

    return-void

    :cond_62
    const/4 v2, 0x0

    goto :goto_d

    :cond_64
    const/4 v2, 0x0

    goto :goto_17

    :cond_66
    const/4 v2, 0x0

    goto :goto_1f
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzei;Ljava/lang/String;Lcom/google/android/gms/internal/zzec;Lcom/google/android/gms/ads/internal/formats/zzh$zza;)V
    .registers 40

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v3, v2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v5, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyw:Ljava/util/List;

    move-object/from16 v0, p1

    iget v6, v0, Lcom/google/android/gms/internal/zzhj$zza;->errorCode:I

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v7, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyx:Ljava/util/List;

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v8, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDZ:Ljava/util/List;

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v9, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v10, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyA:J

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v12, v2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDB:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v13, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDX:Z

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGG:Lcom/google/android/gms/internal/zzea;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDY:J

    move-wide/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDW:J

    move-wide/from16 v22, v0

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGI:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGJ:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEc:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGF:Lorg/json/JSONObject;

    move-object/from16 v29, v0

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, v2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDO:Ljava/lang/String;

    move-object/from16 v31, v0

    move-object/from16 v2, p0

    move-object/from16 v4, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move-object/from16 v16, p5

    move-object/from16 v18, p6

    move-object/from16 v30, p7

    invoke-direct/range {v2 .. v31}, Lcom/google/android/gms/internal/zzhj;-><init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzip;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzei;Ljava/lang/String;Lcom/google/android/gms/internal/zzea;Lcom/google/android/gms/internal/zzec;JLcom/google/android/gms/ads/internal/client/AdSizeParcel;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public zzbY()Z
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziq;->zzbY()Z

    move-result v0

    goto :goto_d
.end method
