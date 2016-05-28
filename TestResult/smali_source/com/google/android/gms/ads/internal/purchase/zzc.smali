.class public Lcom/google/android/gms/ads/internal/purchase/zzc;
.super Lcom/google/android/gms/internal/zzhq;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private zzBO:Z

.field private zzBP:Lcom/google/android/gms/internal/zzfq;

.field private zzBQ:Lcom/google/android/gms/ads/internal/purchase/zzb;

.field private zzBR:Lcom/google/android/gms/ads/internal/purchase/zzh;

.field private zzBS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/ads/internal/purchase/zzf;",
            ">;"
        }
    .end annotation
.end field

.field private zzBT:Lcom/google/android/gms/ads/internal/purchase/zzk;

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzfq;Lcom/google/android/gms/ads/internal/purchase/zzk;)V
    .registers 10

    new-instance v4, Lcom/google/android/gms/ads/internal/purchase/zzb;

    invoke-direct {v4, p1}, Lcom/google/android/gms/ads/internal/purchase/zzb;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/purchase/zzh;->zzx(Landroid/content/Context;)Lcom/google/android/gms/ads/internal/purchase/zzh;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/purchase/zzc;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzfq;Lcom/google/android/gms/ads/internal/purchase/zzk;Lcom/google/android/gms/ads/internal/purchase/zzb;Lcom/google/android/gms/ads/internal/purchase/zzh;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzfq;Lcom/google/android/gms/ads/internal/purchase/zzk;Lcom/google/android/gms/ads/internal/purchase/zzb;Lcom/google/android/gms/ads/internal/purchase/zzh;)V
    .registers 10

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhq;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzpc:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBO:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBS:Ljava/util/List;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBP:Lcom/google/android/gms/internal/zzfq;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBT:Lcom/google/android/gms/ads/internal/purchase/zzk;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBQ:Lcom/google/android/gms/ads/internal/purchase/zzb;

    iput-object p5, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBR:Lcom/google/android/gms/ads/internal/purchase/zzh;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBR:Lcom/google/android/gms/ads/internal/purchase/zzh;

    const-wide/16 v2, 0xa

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/ads/internal/purchase/zzh;->zzf(J)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBS:Ljava/util/List;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/purchase/zzc;)Lcom/google/android/gms/ads/internal/purchase/zzk;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBT:Lcom/google/android/gms/ads/internal/purchase/zzk;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/ads/internal/purchase/zzc;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/ads/internal/purchase/zzc;)Lcom/google/android/gms/internal/zzfq;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBP:Lcom/google/android/gms/internal/zzfq;

    return-object v0
.end method

.method private zzd(J)V
    .registers 4

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/ads/internal/purchase/zzc;->zze(J)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "Timeout waiting for pending transaction to be processed."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    :cond_b
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBO:Z

    if-eqz v0, :cond_0

    return-void
.end method

.method private zze(J)Z
    .registers 8

    const-wide/32 v0, 0xea60

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, p1

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_11

    const/4 v0, 0x0

    :goto_10
    return v0

    :cond_11
    :try_start_11
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzpc:Ljava/lang/Object;

    invoke-virtual {v2, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_11 .. :try_end_16} :catch_18

    :goto_16
    const/4 v0, 0x1

    goto :goto_10

    :catch_18
    move-exception v0

    const-string v0, "waitWithTimeout_lock interrupted"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_16
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 5
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBQ:Lcom/google/android/gms/ads/internal/purchase/zzb;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/ads/internal/purchase/zzb;->zzM(Landroid/os/IBinder;)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzfg()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBO:Z

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzpc:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    return-void

    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 3
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    const-string v0, "In-app billing service disconnected."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBQ:Lcom/google/android/gms/ads/internal/purchase/zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/purchase/zzb;->destroy()V

    return-void
.end method

.method public onStop()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->zzpD()Lcom/google/android/gms/common/stats/zzb;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2, p0}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBQ:Lcom/google/android/gms/ads/internal/purchase/zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/purchase/zzb;->destroy()V

    monitor-exit v1

    return-void

    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0
.end method

.method protected zza(Lcom/google/android/gms/ads/internal/purchase/zzf;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    const-string v1, "RESPONSE_CODE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    const-string v1, "INAPP_PURCHASE_DATA"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    const-string v1, "INAPP_DATA_SIGNATURE"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/ads/internal/purchase/zzc$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/google/android/gms/ads/internal/purchase/zzc$1;-><init>(Lcom/google/android/gms/ads/internal/purchase/zzc;Lcom/google/android/gms/ads/internal/purchase/zzf;Landroid/content/Intent;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public zzdG()V
    .registers 6

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.android.vending"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->zzpD()Lcom/google/android/gms/common/stats/zzb;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->mContext:Landroid/content/Context;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v0, p0, v4}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzd(J)V

    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->zzpD()Lcom/google/android/gms/common/stats/zzb;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2, p0}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBQ:Lcom/google/android/gms/ads/internal/purchase/zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/purchase/zzb;->destroy()V

    monitor-exit v1

    return-void

    :catchall_30
    move-exception v0

    monitor-exit v1
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_30

    throw v0
.end method

.method protected zzfg()V
    .registers 13

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBS:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    return-void

    :cond_9
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBS:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/ads/internal/purchase/zzf;

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/purchase/zzf;->zzCf:Ljava/lang/String;

    invoke-virtual {v6, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_14

    :cond_26
    const/4 v0, 0x0

    :goto_27
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBQ:Lcom/google/android/gms/ads/internal/purchase/zzb;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/ads/internal/purchase/zzb;->zzj(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_55

    :cond_35
    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzBR:Lcom/google/android/gms/ads/internal/purchase/zzh;

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/ads/internal/purchase/zzf;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/ads/internal/purchase/zzh;->zza(Lcom/google/android/gms/ads/internal/purchase/zzf;)V

    goto :goto_3d

    :cond_55
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/internal/purchase/zzi;->zzc(Landroid/os/Bundle;)I

    move-result v1

    if-nez v1, :cond_35

    const-string v1, "INAPP_PURCHASE_ITEM_LIST"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    const-string v1, "INAPP_PURCHASE_DATA_LIST"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    const-string v1, "INAPP_DATA_SIGNATURE_LIST"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v9

    const-string v1, "INAPP_CONTINUATION_TOKEN"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v0, 0x0

    move v4, v0

    :goto_79
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v4, v0, :cond_bb

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b7

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/ads/internal/purchase/zzf;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    move-result-object v10

    invoke-virtual {v10, v1}, Lcom/google/android/gms/ads/internal/purchase/zzi;->zzal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v3, Lcom/google/android/gms/ads/internal/purchase/zzf;->zzCe:Ljava/lang/String;

    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b7

    invoke-virtual {p0, v3, v1, v2}, Lcom/google/android/gms/ads/internal/purchase/zzc;->zza(Lcom/google/android/gms/ads/internal/purchase/zzf;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b7
    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_79

    :cond_bb
    if-eqz v5, :cond_35

    invoke-virtual {v6}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_35

    move-object v0, v5

    goto/16 :goto_27
.end method
