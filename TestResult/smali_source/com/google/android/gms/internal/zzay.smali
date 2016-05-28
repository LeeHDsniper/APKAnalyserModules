.class public Lcom/google/android/gms/internal/zzay;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzba;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private final zzpc:Ljava/lang/Object;

.field private final zzqM:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Lcom/google/android/gms/internal/zzhj;",
            "Lcom/google/android/gms/internal/zzaz;",
            ">;"
        }
    .end annotation
.end field

.field private final zzqN:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/internal/zzaz;",
            ">;"
        }
    .end annotation
.end field

.field private final zzqO:Landroid/content/Context;

.field private final zzqP:Lcom/google/android/gms/internal/zzdv;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzdv;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzpc:Ljava/lang/Object;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqN:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqO:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzay;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzay;->zzqP:Lcom/google/android/gms/internal/zzdv;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzhj;)Lcom/google/android/gms/internal/zzaz;
    .registers 4

    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gms/internal/zzay;->zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzhj;Landroid/view/View;)Lcom/google/android/gms/internal/zzaz;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzhj;Landroid/view/View;)Lcom/google/android/gms/internal/zzaz;
    .registers 11

    iget-object v6, p0, Lcom/google/android/gms/internal/zzay;->zzpc:Ljava/lang/Object;

    monitor-enter v6

    :try_start_3
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzay;->zzd(Lcom/google/android/gms/internal/zzhj;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaz;

    monitor-exit v6

    :goto_12
    return-object v0

    :cond_13
    new-instance v0, Lcom/google/android/gms/internal/zzaz;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzay;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzay;->zzqP:Lcom/google/android/gms/internal/zzdv;

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaz;-><init>(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Landroid/view/View;Lcom/google/android/gms/internal/zzdv;)V

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzaz;->zza(Lcom/google/android/gms/internal/zzba;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p2, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzay;->zzqN:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v6

    goto :goto_12

    :catchall_2e
    move-exception v0

    monitor-exit v6
    :try_end_30
    .catchall {:try_start_3 .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaz;)V
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzay;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaz;->zzcd()Z

    move-result v0

    if-nez v0, :cond_31

    iget-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqN:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_18
    :goto_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_18

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_18

    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_3 .. :try_end_30} :catchall_2e

    throw v0

    :cond_31
    :try_start_31
    monitor-exit v1
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_2e

    return-void
.end method

.method public zzd(Lcom/google/android/gms/internal/zzhj;)Z
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzay;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaz;

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaz;->zzcd()Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_14
    monitor-exit v1

    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_14

    :catchall_18
    move-exception v0

    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v0
.end method

.method public zze(Lcom/google/android/gms/internal/zzhj;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzay;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaz;

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaz;->zzcb()V

    :cond_10
    monitor-exit v1

    return-void

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public zzf(Lcom/google/android/gms/internal/zzhj;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzay;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaz;

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaz;->stop()V

    :cond_10
    monitor-exit v1

    return-void

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzhj;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzay;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaz;

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaz;->pause()V

    :cond_10
    monitor-exit v1

    return-void

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public zzh(Lcom/google/android/gms/internal/zzhj;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzay;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzay;->zzqM:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaz;

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaz;->resume()V

    :cond_10
    monitor-exit v1

    return-void

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method
