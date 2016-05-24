.class public abstract Lcom/google/android/gms/internal/zzfz;
.super Lcom/google/android/gms/internal/zzhq;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzfz$zza;
    }
.end annotation


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected final zzCD:Lcom/google/android/gms/internal/zzga$zza;

.field protected final zzCE:Ljava/lang/Object;

.field protected final zzCF:Lcom/google/android/gms/internal/zzhj$zza;

.field protected zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

.field protected final zzoL:Lcom/google/android/gms/internal/zzip;

.field protected final zzpc:Ljava/lang/Object;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V
    .registers 6

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhq;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfz;->zzpc:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfz;->zzCE:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfz;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfz;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfz;->zzoL:Lcom/google/android/gms/internal/zzip;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzfz;->zzCD:Lcom/google/android/gms/internal/zzga$zza;

    return-void
.end method


# virtual methods
.method public onStop()V
    .registers 1

    return-void
.end method

.method public zzdG()V
    .registers 7

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfz;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3
    const-string v0, "AdRendererBackgroundTask started."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfz;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->errorCode:I
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_54

    :try_start_c
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/google/android/gms/internal/zzfz;->zzh(J)V
    :try_end_13
    .catch Lcom/google/android/gms/internal/zzfz$zza; {:try_start_c .. :try_end_13} :catch_23
    .catchall {:try_start_c .. :try_end_13} :catchall_54

    :goto_13
    :try_start_13
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzfz;->zzz(I)Lcom/google/android/gms/internal/zzhj;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v3, Lcom/google/android/gms/internal/zzfz$2;

    invoke-direct {v3, p0, v0}, Lcom/google/android/gms/internal/zzfz$2;-><init>(Lcom/google/android/gms/internal/zzfz;Lcom/google/android/gms/internal/zzhj;)V

    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    monitor-exit v2

    return-void

    :catch_23
    move-exception v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfz$zza;->getErrorCode()I

    move-result v1

    const/4 v3, 0x3

    if-eq v1, v3, :cond_2e

    const/4 v3, -0x1

    if-ne v1, v3, :cond_4c

    :cond_2e
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfz$zza;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    :goto_35
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    if-nez v0, :cond_57

    new-instance v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    :goto_40
    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v3, Lcom/google/android/gms/internal/zzfz$1;

    invoke-direct {v3, p0}, Lcom/google/android/gms/internal/zzfz$1;-><init>(Lcom/google/android/gms/internal/zzfz;)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move v0, v1

    goto :goto_13

    :cond_4c
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfz$zza;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_35

    :catchall_54
    move-exception v0

    monitor-exit v2
    :try_end_56
    .catchall {:try_start_13 .. :try_end_56} :catchall_54

    throw v0

    :cond_57
    :try_start_57
    new-instance v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v4, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyA:J

    invoke-direct {v0, v1, v4, v5}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(IJ)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
    :try_end_62
    .catchall {:try_start_57 .. :try_end_62} :catchall_54

    goto :goto_40
.end method

.method protected abstract zzh(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzfz$zza;
        }
    .end annotation
.end method

.method protected zzi(Lcom/google/android/gms/internal/zzhj;)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfz;->zzCD:Lcom/google/android/gms/internal/zzga$zza;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzga$zza;->zzb(Lcom/google/android/gms/internal/zzhj;)V

    return-void
.end method

.method protected zzz(I)Lcom/google/android/gms/internal/zzhj;
    .registers 34

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzfz;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v6, v2, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    new-instance v2, Lcom/google/android/gms/internal/zzhj;

    iget-object v3, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/internal/zzfz;->zzoL:Lcom/google/android/gms/internal/zzip;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyw:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v7, v7, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyx:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v8, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDZ:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v9, v9, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v10, v10, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyA:J

    iget-object v12, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDB:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDX:Z

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-wide v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDY:J

    move-wide/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfz;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-wide v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDW:J

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfz;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGI:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-wide v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEb:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfz;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEc:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfz;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGF:Lorg/json/JSONObject;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDO:Ljava/lang/String;

    move-object/from16 v31, v0

    move/from16 v6, p1

    invoke-direct/range {v2 .. v31}, Lcom/google/android/gms/internal/zzhj;-><init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzip;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzei;Ljava/lang/String;Lcom/google/android/gms/internal/zzea;Lcom/google/android/gms/internal/zzec;JLcom/google/android/gms/ads/internal/client/AdSizeParcel;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Ljava/lang/String;)V

    return-object v2
.end method
