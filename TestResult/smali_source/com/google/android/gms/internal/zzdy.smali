.class public final Lcom/google/android/gms/internal/zzdy;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzow:Lcom/google/android/gms/internal/zzeh;

.field private final zzpc:Ljava/lang/Object;

.field private final zzyd:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

.field private final zzye:Lcom/google/android/gms/internal/zzea;

.field private final zzyf:Z

.field private zzyg:Z

.field private zzyh:Lcom/google/android/gms/internal/zzed;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/internal/zzea;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdy;->zzpc:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzdy;->zzyg:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdy;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdy;->zzyd:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzdy;->zzow:Lcom/google/android/gms/internal/zzeh;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzdy;->zzye:Lcom/google/android/gms/internal/zzea;

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzdy;->zzyf:Z

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdy;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzdy;->zzyg:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdy;->zzyh:Lcom/google/android/gms/internal/zzed;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdy;->zzyh:Lcom/google/android/gms/internal/zzed;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzed;->cancel()V

    :cond_f
    monitor-exit v1

    return-void

    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_4 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public zza(JJLcom/google/android/gms/internal/zzcd;)Lcom/google/android/gms/internal/zzee;
    .registers 29

    const-string v4, "Starting mediation."

    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/internal/zzdy;->zzye:Lcom/google/android/gms/internal/zzea;

    iget-object v4, v4, Lcom/google/android/gms/internal/zzea;->zzyu:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_18
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_119

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/zzdz;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Trying mediation network: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v9, Lcom/google/android/gms/internal/zzdz;->zzyl:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    iget-object v4, v9, Lcom/google/android/gms/internal/zzdz;->zzym:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_42
    :goto_42
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_18

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdy;->zzpc:Ljava/lang/Object;

    move-object/from16 v21, v0

    monitor-enter v21

    :try_start_59
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/google/android/gms/internal/zzdy;->zzyg:Z

    if-eqz v4, :cond_67

    new-instance v4, Lcom/google/android/gms/internal/zzee;

    const/4 v5, -0x1

    invoke-direct {v4, v5}, Lcom/google/android/gms/internal/zzee;-><init>(I)V

    monitor-exit v21

    :goto_66
    return-object v4

    :cond_67
    new-instance v4, Lcom/google/android/gms/internal/zzed;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/internal/zzdy;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/gms/internal/zzdy;->zzow:Lcom/google/android/gms/internal/zzeh;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzdy;->zzye:Lcom/google/android/gms/internal/zzea;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/gms/internal/zzdy;->zzyd:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v10, v10, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/gms/internal/zzdy;->zzyd:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v11, v11, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/gms/internal/zzdy;->zzyd:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v12, v12, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/google/android/gms/internal/zzdy;->zzyf:Z

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/gms/internal/zzdy;->zzyd:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v14, v14, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqt:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/gms/internal/zzdy;->zzyd:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v15, v15, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqv:Ljava/util/List;

    invoke-direct/range {v4 .. v15}, Lcom/google/android/gms/internal/zzed;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/internal/zzea;Lcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;ZLcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Ljava/util/List;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/google/android/gms/internal/zzdy;->zzyh:Lcom/google/android/gms/internal/zzed;

    monitor-exit v21
    :try_end_9f
    .catchall {:try_start_59 .. :try_end_9f} :catchall_f0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/internal/zzdy;->zzyh:Lcom/google/android/gms/internal/zzed;

    move-wide/from16 v0, p1

    move-wide/from16 v2, p3

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzed;->zza(JJ)Lcom/google/android/gms/internal/zzee;

    move-result-object v4

    iget v5, v4, Lcom/google/android/gms/internal/zzee;->zzyP:I

    if-nez v5, :cond_f3

    const-string v5, "Adapter succeeded."

    invoke-static {v5}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    const-string v5, "mediation_network_succeed"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_d0

    const-string v5, "mediation_networks_fail"

    const-string v6, ","

    move-object/from16 v0, v16

    invoke-static {v6, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d0
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "mls"

    aput-object v7, v5, v6

    move-object/from16 v0, p5

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v5}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "ttm"

    aput-object v7, v5, v6

    move-object/from16 v0, p5

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v5}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    goto/16 :goto_66

    :catchall_f0
    move-exception v4

    :try_start_f1
    monitor-exit v21
    :try_end_f2
    .catchall {:try_start_f1 .. :try_end_f2} :catchall_f0

    throw v4

    :cond_f3
    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "mlf"

    aput-object v7, v5, v6

    move-object/from16 v0, p5

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v5}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    iget-object v5, v4, Lcom/google/android/gms/internal/zzee;->zzyR:Lcom/google/android/gms/internal/zzei;

    if-eqz v5, :cond_42

    sget-object v5, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v6, Lcom/google/android/gms/internal/zzdy$1;

    move-object/from16 v0, p0

    invoke-direct {v6, v0, v4}, Lcom/google/android/gms/internal/zzdy$1;-><init>(Lcom/google/android/gms/internal/zzdy;Lcom/google/android/gms/internal/zzee;)V

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_42

    :cond_119
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_12e

    const-string v4, "mediation_networks_fail"

    const-string v5, ","

    move-object/from16 v0, v16

    invoke-static {v5, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p5

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    :cond_12e
    new-instance v4, Lcom/google/android/gms/internal/zzee;

    const/4 v5, 0x1

    invoke-direct {v4, v5}, Lcom/google/android/gms/internal/zzee;-><init>(I)V

    goto/16 :goto_66
.end method
