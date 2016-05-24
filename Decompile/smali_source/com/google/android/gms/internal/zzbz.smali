.class public Lcom/google/android/gms/internal/zzbz;
.super Ljava/lang/Object;


# instance fields
.field private mContext:Landroid/content/Context;

.field private zzqK:Ljava/lang/String;

.field private zzvf:Z

.field private zzvg:Ljava/lang/String;

.field private zzvh:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 7

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbz;->mContext:Landroid/content/Context;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzqK:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbz;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbz;->zzqK:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuB:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvf:Z

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuC:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvg:Ljava/lang/String;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v1, "s"

    const-string v2, "gmob_sdk"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v1, "v"

    const-string v2, "3"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v1, "os"

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v1, "sdk"

    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v1, "device"

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzhu;->zzgt()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v1, "ua"

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Lcom/google/android/gms/internal/zzhu;->zzf(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v2, "app"

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_bb

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    :goto_7f
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ba

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbD()Lcom/google/android/gms/internal/zzgs;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbz;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzgs;->zzD(Landroid/content/Context;)Lcom/google/android/gms/internal/zzgr;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v2, "network_coarse"

    iget v3, v0, Lcom/google/android/gms/internal/zzgr;->zzFN:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    const-string v2, "network_fine"

    iget v0, v0, Lcom/google/android/gms/internal/zzgr;->zzFO:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_ba
    return-void

    :cond_bb
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    goto :goto_7f
.end method


# virtual methods
.method getContext()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method zzbV()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzqK:Ljava/lang/String;

    return-object v0
.end method

.method zzdf()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvf:Z

    return v0
.end method

.method zzdg()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvg:Ljava/lang/String;

    return-object v0
.end method

.method zzdh()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbz;->zzvh:Ljava/util/Map;

    return-object v0
.end method
