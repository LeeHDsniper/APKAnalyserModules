.class public Lcom/google/android/gms/ads/internal/client/zzz;
.super Ljava/lang/Object;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zznK:Lcom/google/android/gms/ads/internal/client/zzg;

.field private zzoZ:Ljava/lang/String;

.field private zzsK:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

.field private zzsn:Lcom/google/android/gms/ads/internal/client/zza;

.field private zzso:Lcom/google/android/gms/ads/AdListener;

.field private final zztk:Lcom/google/android/gms/internal/zzeg;

.field private zztm:Lcom/google/android/gms/ads/internal/client/zzr;

.field private zztn:Ljava/lang/String;

.field private zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

.field private zztq:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

.field private zztr:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

.field private zzts:Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzg;->zzcA()Lcom/google/android/gms/ads/internal/client/zzg;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/ads/internal/client/zzz;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzg;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V
    .registers 4

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzg;->zzcA()Lcom/google/android/gms/ads/internal/client/zzg;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/android/gms/ads/internal/client/zzz;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzg;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzg;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzeg;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzeg;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztk:Lcom/google/android/gms/internal/zzeg;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zznK:Lcom/google/android/gms/ads/internal/client/zzg;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzts:Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

    return-void
.end method

.method private zzM(Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzoZ:Ljava/lang/String;

    if-nez v0, :cond_7

    invoke-direct {p0, p1}, Lcom/google/android/gms/ads/internal/client/zzz;->zzN(Ljava/lang/String;)V

    :cond_7
    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcF()Lcom/google/android/gms/ads/internal/client/zze;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    invoke-direct {v2}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;-><init>()V

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzoZ:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztk:Lcom/google/android/gms/internal/zzeg;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gms/ads/internal/client/zze;->zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzeg;)Lcom/google/android/gms/ads/internal/client/zzr;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzso:Lcom/google/android/gms/ads/AdListener;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    new-instance v1, Lcom/google/android/gms/ads/internal/client/zzc;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzso:Lcom/google/android/gms/ads/AdListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/ads/internal/client/zzc;-><init>(Lcom/google/android/gms/ads/AdListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/ads/internal/client/zzn;)V

    :cond_2c
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    new-instance v1, Lcom/google/android/gms/ads/internal/client/zzb;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    invoke-direct {v1, v2}, Lcom/google/android/gms/ads/internal/client/zzb;-><init>(Lcom/google/android/gms/ads/internal/client/zza;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/ads/internal/client/zzm;)V

    :cond_3c
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzsK:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    new-instance v1, Lcom/google/android/gms/ads/internal/client/zzi;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzsK:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/ads/internal/client/zzi;-><init>(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/ads/internal/client/zzt;)V

    :cond_4c
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    new-instance v1, Lcom/google/android/gms/internal/zzfr;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzfr;-><init>(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/internal/zzfm;)V

    :cond_5c
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztq:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

    if-eqz v0, :cond_6e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    new-instance v1, Lcom/google/android/gms/internal/zzfv;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztq:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzfv;-><init>(Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;)V

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztn:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/internal/zzfq;Ljava/lang/String;)V

    :cond_6e
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztr:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    if-eqz v0, :cond_7e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    new-instance v1, Lcom/google/android/gms/internal/zzci;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztr:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzci;-><init>(Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/internal/zzch;)V

    :cond_7e
    return-void
.end method

.method private zzN(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-nez v0, :cond_23

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The ad unit ID must be set on InterstitialAd before "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is called."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_23
    return-void
.end method


# virtual methods
.method public getAdListener()Lcom/google/android/gms/ads/AdListener;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzso:Lcom/google/android/gms/ads/AdListener;

    return-object v0
.end method

.method public getAdUnitId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzoZ:Ljava/lang/String;

    return-object v0
.end method

.method public getAppEventListener()Lcom/google/android/gms/ads/doubleclick/AppEventListener;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzsK:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    return-object v0
.end method

.method public getInAppPurchaseListener()Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    return-object v0
.end method

.method public getMediationAdapterClassName()Ljava/lang/String;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/client/zzr;->getMediationAdapterClassName()Ljava/lang/String;
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v0

    :goto_a
    return-object v0

    :catch_b
    move-exception v0

    const-string v1, "Failed to get the mediation adapter class name."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_11
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getOnCustomRenderedAdLoadedListener()Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztr:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    return-object v0
.end method

.method public isLoaded()Z
    .registers 4

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-nez v1, :cond_6

    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    invoke-interface {v1}, Lcom/google/android/gms/ads/internal/client/zzr;->isReady()Z
    :try_end_b
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_b} :catch_d

    move-result v0

    goto :goto_5

    :catch_d
    move-exception v1

    const-string v2, "Failed to check if ad is ready."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method public isLoading()Z
    .registers 4

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-nez v1, :cond_6

    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    invoke-interface {v1}, Lcom/google/android/gms/ads/internal/client/zzr;->isLoading()Z
    :try_end_b
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_b} :catch_d

    move-result v0

    goto :goto_5

    :catch_d
    move-exception v1

    const-string v2, "Failed to check if ad is loading."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method public setAdListener(Lcom/google/android/gms/ads/AdListener;)V
    .registers 4
    .param p1, "adListener"    # Lcom/google/android/gms/ads/AdListener;

    .prologue
    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzso:Lcom/google/android/gms/ads/AdListener;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz v0, :cond_12

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz p1, :cond_13

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzc;

    invoke-direct {v0, p1}, Lcom/google/android/gms/ads/internal/client/zzc;-><init>(Lcom/google/android/gms/ads/AdListener;)V

    :goto_f
    invoke-interface {v1, v0}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/ads/internal/client/zzn;)V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_12} :catch_15

    :cond_12
    :goto_12
    return-void

    :cond_13
    const/4 v0, 0x0

    goto :goto_f

    :catch_15
    move-exception v0

    const-string v1, "Failed to set the AdListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public setAdUnitId(Ljava/lang/String;)V
    .registers 4
    .param p1, "adUnitId"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzoZ:Ljava/lang/String;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The ad unit ID can only be set once on InterstitialAd."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzoZ:Ljava/lang/String;

    return-void
.end method

.method public setAppEventListener(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V
    .registers 4
    .param p1, "appEventListener"    # Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    .prologue
    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzsK:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz v0, :cond_12

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz p1, :cond_13

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzi;

    invoke-direct {v0, p1}, Lcom/google/android/gms/ads/internal/client/zzi;-><init>(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V

    :goto_f
    invoke-interface {v1, v0}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/ads/internal/client/zzt;)V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_12} :catch_15

    :cond_12
    :goto_12
    return-void

    :cond_13
    const/4 v0, 0x0

    goto :goto_f

    :catch_15
    move-exception v0

    const-string v1, "Failed to set the AppEventListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public setInAppPurchaseListener(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V
    .registers 4
    .param p1, "inAppPurchaseListener"    # Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztq:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Play store purchase parameter has already been set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    :try_start_c
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz v0, :cond_1e

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz p1, :cond_1f

    new-instance v0, Lcom/google/android/gms/internal/zzfr;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzfr;-><init>(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V

    :goto_1b
    invoke-interface {v1, v0}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/internal/zzfm;)V
    :try_end_1e
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_1e} :catch_21

    :cond_1e
    :goto_1e
    return-void

    :cond_1f
    const/4 v0, 0x0

    goto :goto_1b

    :catch_21
    move-exception v0

    const-string v1, "Failed to set the InAppPurchaseListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public setOnCustomRenderedAdLoadedListener(Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;)V
    .registers 4
    .param p1, "onCustomRenderedAdLoadedListener"    # Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    .prologue
    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztr:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz v0, :cond_12

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz p1, :cond_13

    new-instance v0, Lcom/google/android/gms/internal/zzci;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzci;-><init>(Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;)V

    :goto_f
    invoke-interface {v1, v0}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/internal/zzch;)V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_12} :catch_15

    :cond_12
    :goto_12
    return-void

    :cond_13
    const/4 v0, 0x0

    goto :goto_f

    :catch_15
    move-exception v0

    const-string v1, "Failed to set the OnCustomRenderedAdLoadedListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public setPlayStorePurchaseParams(Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;Ljava/lang/String;)V
    .registers 5
    .param p1, "playStorePurchaseListener"    # Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;
    .param p2, "publicKey"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "In app purchase parameter has already been set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    :try_start_c
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztq:Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztn:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz v0, :cond_20

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz p1, :cond_21

    new-instance v0, Lcom/google/android/gms/internal/zzfv;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzfv;-><init>(Lcom/google/android/gms/ads/purchase/PlayStorePurchaseListener;)V

    :goto_1d
    invoke-interface {v1, v0, p2}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/internal/zzfq;Ljava/lang/String;)V
    :try_end_20
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_20} :catch_23

    :cond_20
    :goto_20
    return-void

    :cond_21
    const/4 v0, 0x0

    goto :goto_1d

    :catch_23
    move-exception v0

    const-string v1, "Failed to set the play store purchase parameter."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_20
.end method

.method public show()V
    .registers 3

    :try_start_0
    const-string v0, "show"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/client/zzz;->zzN(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/client/zzr;->showInterstitial()V
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_a} :catch_b

    :goto_a
    return-void

    :catch_b
    move-exception v0

    const-string v1, "Failed to show interstitial."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_a
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zza;)V
    .registers 4

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz v0, :cond_12

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-eqz p1, :cond_13

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzb;

    invoke-direct {v0, p1}, Lcom/google/android/gms/ads/internal/client/zzb;-><init>(Lcom/google/android/gms/ads/internal/client/zza;)V

    :goto_f
    invoke-interface {v1, v0}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/ads/internal/client/zzm;)V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_12} :catch_15

    :cond_12
    :goto_12
    return-void

    :cond_13
    const/4 v0, 0x0

    goto :goto_f

    :catch_15
    move-exception v0

    const-string v1, "Failed to set the AdClickListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzx;)V
    .registers 5

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    if-nez v0, :cond_9

    const-string v0, "loadAd"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/client/zzz;->zzM(Ljava/lang/String;)V

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztm:Lcom/google/android/gms/ads/internal/client/zzr;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zznK:Lcom/google/android/gms/ads/internal/client/zzg;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzz;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2, p1}, Lcom/google/android/gms/ads/internal/client/zzg;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzx;)Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/client/zzr;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzz;->zztk:Lcom/google/android/gms/internal/zzeg;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/client/zzx;->zzcN()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzeg;->zze(Ljava/util/Map;)V
    :try_end_22
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_22} :catch_23

    :cond_22
    :goto_22
    return-void

    :catch_23
    move-exception v0

    const-string v1, "Failed to load ad."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_22
.end method
