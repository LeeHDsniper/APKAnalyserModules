.class public Lcom/google/android/gms/internal/zzge;
.super Lcom/google/android/gms/internal/zzhq;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzCD:Lcom/google/android/gms/internal/zzga$zza;

.field private final zzCF:Lcom/google/android/gms/internal/zzhj$zza;

.field private final zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

.field private final zzCP:Lcom/google/android/gms/internal/zzgf;

.field private zzCQ:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/google/android/gms/internal/zzhj;",
            ">;"
        }
    .end annotation
.end field

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzn;Lcom/google/android/gms/internal/zzbc;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzan;Lcom/google/android/gms/internal/zzga$zza;)V
    .registers 14

    new-instance v0, Lcom/google/android/gms/internal/zzgf;

    new-instance v4, Lcom/google/android/gms/internal/zzhy;

    invoke-direct {v4, p1}, Lcom/google/android/gms/internal/zzhy;-><init>(Landroid/content/Context;)V

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzgf;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzn;Lcom/google/android/gms/internal/zzbc;Lcom/google/android/gms/internal/zzhy;Lcom/google/android/gms/internal/zzan;Lcom/google/android/gms/internal/zzhj$zza;)V

    invoke-direct {p0, p4, p6, v0}, Lcom/google/android/gms/internal/zzge;-><init>(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzga$zza;Lcom/google/android/gms/internal/zzgf;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzga$zza;Lcom/google/android/gms/internal/zzgf;)V
    .registers 5

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhq;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzge;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzge;->zzCD:Lcom/google/android/gms/internal/zzga$zza;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzge;->zzCP:Lcom/google/android/gms/internal/zzgf;

    return-void
.end method

.method private zzA(I)Lcom/google/android/gms/internal/zzhj;
    .registers 34

    new-instance v2, Lcom/google/android/gms/internal/zzhj;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzge;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v9, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v10, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyA:J

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v12, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDB:Ljava/lang/String;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDY:J

    move-wide/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzhj$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDW:J

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-wide v0, v6, Lcom/google/android/gms/internal/zzhj$zza;->zzGI:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEb:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEc:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzhj$zza;->zzGF:Lorg/json/JSONObject;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzge;->zzCF:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDO:Ljava/lang/String;

    move-object/from16 v31, v0

    move/from16 v6, p1

    invoke-direct/range {v2 .. v31}, Lcom/google/android/gms/internal/zzhj;-><init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzip;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzei;Ljava/lang/String;Lcom/google/android/gms/internal/zzea;Lcom/google/android/gms/internal/zzec;JLcom/google/android/gms/ads/internal/client/AdSizeParcel;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Ljava/lang/String;)V

    return-object v2
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzge;)Lcom/google/android/gms/internal/zzga$zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzCD:Lcom/google/android/gms/internal/zzga$zza;

    return-object v0
.end method


# virtual methods
.method public onStop()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzge;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzCQ:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzCQ:Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_d
    monitor-exit v1

    return-void

    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public zzdG()V
    .registers 9

    const/4 v3, -0x1

    const/4 v2, -0x2

    const/4 v1, 0x0

    :try_start_3
    iget-object v4, p0, Lcom/google/android/gms/internal/zzge;->zzpc:Ljava/lang/Object;

    monitor-enter v4
    :try_end_6
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_3 .. :try_end_6} :catch_2d
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_3 .. :try_end_6} :catch_3e
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_6} :catch_44
    .catch Ljava/util/concurrent/CancellationException; {:try_start_3 .. :try_end_6} :catch_48

    :try_start_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzCP:Lcom/google/android/gms/internal/zzgf;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzht;->zza(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzih;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzCQ:Ljava/util/concurrent/Future;

    monitor-exit v4
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_2a

    :try_start_f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzCQ:Ljava/util/concurrent/Future;

    const-wide/32 v4, 0xea60

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v4, v5, v6}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzhj;
    :try_end_1c
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_f .. :try_end_1c} :catch_2d
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_f .. :try_end_1c} :catch_3e
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_1c} :catch_44
    .catch Ljava/util/concurrent/CancellationException; {:try_start_f .. :try_end_1c} :catch_48

    move v1, v2

    :goto_1d
    if-eqz v0, :cond_4c

    :goto_1f
    sget-object v1, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzge$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzge$1;-><init>(Lcom/google/android/gms/internal/zzge;Lcom/google/android/gms/internal/zzhj;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_2a
    move-exception v0

    :try_start_2b
    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_2a

    :try_start_2c
    throw v0
    :try_end_2d
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2c .. :try_end_2d} :catch_2d
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2c .. :try_end_2d} :catch_3e
    .catch Ljava/lang/InterruptedException; {:try_start_2c .. :try_end_2d} :catch_44
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2c .. :try_end_2d} :catch_48

    :catch_2d
    move-exception v0

    const-string v0, "Timed out waiting for native ad."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzge;->zzCQ:Ljava/util/concurrent/Future;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-object v7, v1

    move v1, v0

    move-object v0, v7

    goto :goto_1d

    :catch_3e
    move-exception v0

    const/4 v0, 0x0

    move-object v7, v1

    move v1, v0

    move-object v0, v7

    goto :goto_1d

    :catch_44
    move-exception v0

    move-object v0, v1

    move v1, v3

    goto :goto_1d

    :catch_48
    move-exception v0

    move-object v0, v1

    move v1, v3

    goto :goto_1d

    :cond_4c
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzge;->zzA(I)Lcom/google/android/gms/internal/zzhj;

    move-result-object v0

    goto :goto_1f
.end method
