.class public Lcom/google/android/gms/internal/zzgd;
.super Lcom/google/android/gms/internal/zzfz;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private zzCN:Lcom/google/android/gms/internal/zzdy;

.field protected zzCO:Lcom/google/android/gms/internal/zzee;

.field private final zzon:Lcom/google/android/gms/internal/zzcd;

.field private zzow:Lcom/google/android/gms/internal/zzeh;

.field private zzye:Lcom/google/android/gms/internal/zzea;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/internal/zzga$zza;Lcom/google/android/gms/internal/zzcd;)V
    .registers 8

    invoke-direct {p0, p1, p2, p3, p5}, Lcom/google/android/gms/internal/zzfz;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V

    iput-object p4, p0, Lcom/google/android/gms/internal/zzgd;->zzow:Lcom/google/android/gms/internal/zzeh;

    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj$zza;->zzGG:Lcom/google/android/gms/internal/zzea;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgd;->zzye:Lcom/google/android/gms/internal/zzea;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzgd;->zzon:Lcom/google/android/gms/internal/zzcd;

    return-void
.end method


# virtual methods
.method public onStop()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgd;->zzCE:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-super {p0}, Lcom/google/android/gms/internal/zzfz;->onStop()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgd;->zzCN:Lcom/google/android/gms/internal/zzdy;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgd;->zzCN:Lcom/google/android/gms/internal/zzdy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdy;->cancel()V

    :cond_f
    monitor-exit v1

    return-void

    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0
.end method

.method protected zzh(J)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzfz$zza;
        }
    .end annotation

    iget-object v6, p0, Lcom/google/android/gms/internal/zzgd;->zzCE:Ljava/lang/Object;

    monitor-enter v6

    :try_start_3
    new-instance v0, Lcom/google/android/gms/internal/zzdy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgd;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgd;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgd;->zzow:Lcom/google/android/gms/internal/zzeh;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgd;->zzye:Lcom/google/android/gms/internal/zzea;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v5, v5, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzsJ:Z

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzdy;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/internal/zzea;Z)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgd;->zzCN:Lcom/google/android/gms/internal/zzdy;

    monitor-exit v6
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_4c

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgd;->zzCN:Lcom/google/android/gms/internal/zzdy;

    const-wide/32 v4, 0xea60

    iget-object v6, p0, Lcom/google/android/gms/internal/zzgd;->zzon:Lcom/google/android/gms/internal/zzcd;

    move-wide v2, p1

    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/zzdy;->zza(JJLcom/google/android/gms/internal/zzcd;)Lcom/google/android/gms/internal/zzee;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    iget v0, v0, Lcom/google/android/gms/internal/zzee;->zzyP:I

    packed-switch v0, :pswitch_data_5a

    new-instance v0, Lcom/google/android/gms/internal/zzfz$zza;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected mediation result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    iget v2, v2, Lcom/google/android/gms/internal/zzee;->zzyP:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzfz$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :catchall_4c
    move-exception v0

    :try_start_4d
    monitor-exit v6
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_4c

    throw v0

    :pswitch_4f
    new-instance v0, Lcom/google/android/gms/internal/zzfz$zza;

    const-string v1, "No fill from any mediation ad networks."

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzfz$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :pswitch_58
    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_58
        :pswitch_4f
    .end packed-switch
.end method

.method protected zzz(I)Lcom/google/android/gms/internal/zzhj;
    .registers 34

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgd;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v6, v2, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    new-instance v2, Lcom/google/android/gms/internal/zzhj;

    iget-object v3, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/internal/zzgd;->zzoL:Lcom/google/android/gms/internal/zzip;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyw:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v7, v7, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyx:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v8, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDZ:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v9, v9, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v10, v10, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyA:J

    iget-object v12, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDB:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDX:Z

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    if-eqz v14, :cond_da

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    iget-object v14, v14, Lcom/google/android/gms/internal/zzee;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    :goto_40
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    if-eqz v15, :cond_dd

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    iget-object v15, v15, Lcom/google/android/gms/internal/zzee;->zzyR:Lcom/google/android/gms/internal/zzei;

    :goto_4c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    move-object/from16 v16, v0

    if-eqz v16, :cond_e0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/google/android/gms/internal/zzee;->zzyS:Ljava/lang/String;

    move-object/from16 v16, v0

    :goto_60
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzye:Lcom/google/android/gms/internal/zzea;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    move-object/from16 v18, v0

    if-eqz v18, :cond_e8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCO:Lcom/google/android/gms/internal/zzee;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/google/android/gms/internal/zzee;->zzyT:Lcom/google/android/gms/internal/zzec;

    move-object/from16 v18, v0

    :goto_7a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-wide v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDY:J

    move-wide/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-wide v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDW:J

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGI:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-wide v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEb:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEc:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgd;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

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

    :cond_da
    const/4 v14, 0x0

    goto/16 :goto_40

    :cond_dd
    const/4 v15, 0x0

    goto/16 :goto_4c

    :cond_e0
    const-class v16, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_60

    :cond_e8
    const/16 v18, 0x0

    goto :goto_7a
.end method
