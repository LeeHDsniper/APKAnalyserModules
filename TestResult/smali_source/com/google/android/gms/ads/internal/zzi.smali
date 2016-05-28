.class public Lcom/google/android/gms/ads/internal/zzi;
.super Lcom/google/android/gms/ads/internal/client/zzo$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzoS:Lcom/google/android/gms/ads/internal/client/zzn;

.field private final zzoT:Lcom/google/android/gms/internal/zzct;

.field private final zzoU:Lcom/google/android/gms/internal/zzcu;

.field private final zzoV:Lcom/google/android/gms/internal/zzlh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzcw;",
            ">;"
        }
    .end annotation
.end field

.field private final zzoW:Lcom/google/android/gms/internal/zzlh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzcv;",
            ">;"
        }
    .end annotation
.end field

.field private final zzoX:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

.field private final zzoY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzoZ:Ljava/lang/String;

.field private final zzow:Lcom/google/android/gms/internal/zzeh;

.field private final zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private zzpb:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/google/android/gms/ads/internal/zzn;",
            ">;"
        }
    .end annotation
.end field

.field private zzpc:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/client/zzn;Lcom/google/android/gms/internal/zzct;Lcom/google/android/gms/internal/zzcu;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzeh;",
            "Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;",
            "Lcom/google/android/gms/ads/internal/client/zzn;",
            "Lcom/google/android/gms/internal/zzct;",
            "Lcom/google/android/gms/internal/zzcu;",
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzcw;",
            ">;",
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzcv;",
            ">;",
            "Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/client/zzo$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzi;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoZ:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/zzi;->zzow:Lcom/google/android/gms/internal/zzeh;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iput-object p5, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoS:Lcom/google/android/gms/ads/internal/client/zzn;

    iput-object p7, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoU:Lcom/google/android/gms/internal/zzcu;

    iput-object p6, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoT:Lcom/google/android/gms/internal/zzct;

    iput-object p8, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoV:Lcom/google/android/gms/internal/zzlh;

    iput-object p9, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoW:Lcom/google/android/gms/internal/zzlh;

    iput-object p10, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoX:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/zzi;->zzbi()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoY:Ljava/util/List;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/zzi;)Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpc:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/zzi;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpb:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method static synthetic zzb(Lcom/google/android/gms/ads/internal/zzi;)Lcom/google/android/gms/internal/zzct;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoT:Lcom/google/android/gms/internal/zzct;

    return-object v0
.end method

.method private zzbi()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoU:Lcom/google/android/gms/internal/zzcu;

    if-eqz v1, :cond_e

    const-string v1, "1"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_e
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoT:Lcom/google/android/gms/internal/zzct;

    if-eqz v1, :cond_17

    const-string v1, "2"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_17
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoV:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzlh;->size()I

    move-result v1

    if-lez v1, :cond_24

    const-string v1, "3"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_24
    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/ads/internal/zzi;)Lcom/google/android/gms/internal/zzcu;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoU:Lcom/google/android/gms/internal/zzcu;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/ads/internal/zzi;)Lcom/google/android/gms/internal/zzlh;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoV:Lcom/google/android/gms/internal/zzlh;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/ads/internal/zzi;)Lcom/google/android/gms/ads/internal/client/zzn;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoS:Lcom/google/android/gms/ads/internal/client/zzn;

    return-object v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/ads/internal/zzi;)Lcom/google/android/gms/internal/zzlh;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoW:Lcom/google/android/gms/internal/zzlh;

    return-object v0
.end method

.method static synthetic zzg(Lcom/google/android/gms/ads/internal/zzi;)Ljava/util/List;
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/zzi;->zzbi()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zzh(Lcom/google/android/gms/ads/internal/zzi;)Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoX:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    return-object v0
.end method


# virtual methods
.method public getMediationAdapterClassName()Ljava/lang/String;
    .registers 4

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    :try_start_4
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpb:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/ads/internal/zzn;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzn;->getMediationAdapterClassName()Ljava/lang/String;

    move-result-object v0

    :goto_16
    monitor-exit v2

    :goto_17
    return-object v0

    :cond_18
    move-object v0, v1

    goto :goto_16

    :cond_1a
    monitor-exit v2

    move-object v0, v1

    goto :goto_17

    :catchall_1d
    move-exception v0

    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_4 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method public isLoading()Z
    .registers 4

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    :try_start_4
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpb:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/ads/internal/zzn;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzn;->isLoading()Z

    move-result v0

    :goto_16
    monitor-exit v2

    :goto_17
    return v0

    :cond_18
    move v0, v1

    goto :goto_16

    :cond_1a
    monitor-exit v2

    move v0, v1

    goto :goto_17

    :catchall_1d
    move-exception v0

    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_4 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method protected runOnUiThread(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected zzbj()Lcom/google/android/gms/ads/internal/zzn;
    .registers 7

    new-instance v0, Lcom/google/android/gms/ads/internal/zzn;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzi;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzi;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzs(Landroid/content/Context;)Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzi;->zzoZ:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzi;->zzow:Lcom/google/android/gms/internal/zzeh;

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zzi;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/zzn;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    return-object v0
.end method

.method public zze(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V
    .registers 3

    new-instance v0, Lcom/google/android/gms/ads/internal/zzi$1;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/ads/internal/zzi$1;-><init>(Lcom/google/android/gms/ads/internal/zzi;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/zzi;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
