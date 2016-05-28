.class public final Lcom/google/android/gms/internal/zzet;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/ads/mediation/MediationBannerListener;
.implements Lcom/google/ads/mediation/MediationInterstitialListener;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<NETWORK_EXTRAS::",
        "Lcom/google/ads/mediation/NetworkExtras;",
        "SERVER_PARAMETERS:",
        "Lcom/google/ads/mediation/MediationServerParameters;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/ads/mediation/MediationBannerListener;",
        "Lcom/google/ads/mediation/MediationInterstitialListener;"
    }
.end annotation


# instance fields
.field private final zzyY:Lcom/google/android/gms/internal/zzej;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzej;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzet;)Lcom/google/android/gms/internal/zzej;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    return-object v0
.end method


# virtual methods
.method public onClick(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationBannerAdapter;, "Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    const-string v0, "Adapter called onClick."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onClick must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$1;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdClicked()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdClicked."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onDismissScreen(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationBannerAdapter;, "Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    const-string v0, "Adapter called onDismissScreen."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onDismissScreen must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$4;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$4;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdClosed()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdClosed."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onDismissScreen(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationInterstitialAdapter;, "Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    const-string v0, "Adapter called onDismissScreen."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onDismissScreen must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$9;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$9;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdClosed()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdClosed."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/mediation/MediationBannerAdapter;Lcom/google/ads/AdRequest$ErrorCode;)V
    .registers 5
    .param p2, "errorCode"    # Lcom/google/ads/AdRequest$ErrorCode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;",
            "Lcom/google/ads/AdRequest$ErrorCode;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationBannerAdapter;, "Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Adapter called onFailedToReceiveAd with error. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "onFailedToReceiveAd must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$5;

    invoke-direct {v1, p0, p2}, Lcom/google/android/gms/internal/zzet$5;-><init>(Lcom/google/android/gms/internal/zzet;Lcom/google/ads/AdRequest$ErrorCode;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_2f
    return-void

    :cond_30
    :try_start_30
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-static {p2}, Lcom/google/android/gms/internal/zzeu;->zza(Lcom/google/ads/AdRequest$ErrorCode;)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzej;->onAdFailedToLoad(I)V
    :try_end_39
    .catch Landroid/os/RemoteException; {:try_start_30 .. :try_end_39} :catch_3a

    goto :goto_2f

    :catch_3a
    move-exception v0

    const-string v1, "Could not call onAdFailedToLoad."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2f
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/mediation/MediationInterstitialAdapter;Lcom/google/ads/AdRequest$ErrorCode;)V
    .registers 5
    .param p2, "errorCode"    # Lcom/google/ads/AdRequest$ErrorCode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;",
            "Lcom/google/ads/AdRequest$ErrorCode;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationInterstitialAdapter;, "Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Adapter called onFailedToReceiveAd with error "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_36

    const-string v0, "onFailedToReceiveAd must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$10;

    invoke-direct {v1, p0, p2}, Lcom/google/android/gms/internal/zzet$10;-><init>(Lcom/google/android/gms/internal/zzet;Lcom/google/ads/AdRequest$ErrorCode;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_35
    return-void

    :cond_36
    :try_start_36
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-static {p2}, Lcom/google/android/gms/internal/zzeu;->zza(Lcom/google/ads/AdRequest$ErrorCode;)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzej;->onAdFailedToLoad(I)V
    :try_end_3f
    .catch Landroid/os/RemoteException; {:try_start_36 .. :try_end_3f} :catch_40

    goto :goto_35

    :catch_40
    move-exception v0

    const-string v1, "Could not call onAdFailedToLoad."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_35
.end method

.method public onLeaveApplication(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationBannerAdapter;, "Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    const-string v0, "Adapter called onLeaveApplication."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onLeaveApplication must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$6;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$6;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdLeftApplication()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdLeftApplication."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onLeaveApplication(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationInterstitialAdapter;, "Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    const-string v0, "Adapter called onLeaveApplication."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onLeaveApplication must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$11;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$11;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdLeftApplication()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdLeftApplication."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onPresentScreen(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationBannerAdapter;, "Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    const-string v0, "Adapter called onPresentScreen."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onPresentScreen must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$7;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$7;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdOpened()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdOpened."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onPresentScreen(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationInterstitialAdapter;, "Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    const-string v0, "Adapter called onPresentScreen."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onPresentScreen must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$2;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$2;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdOpened()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdOpened."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onReceivedAd(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationBannerAdapter;, "Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    const-string v0, "Adapter called onReceivedAd."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onReceivedAd must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$8;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$8;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdLoaded()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdLoaded."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onReceivedAd(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzet;, "Lcom/google/android/gms/internal/zzet<TNETWORK_EXTRAS;TSERVER_PARAMETERS;>;"
    .local p1, "adapter":Lcom/google/ads/mediation/MediationInterstitialAdapter;, "Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    const-string v0, "Adapter called onReceivedAd."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-nez v0, :cond_1f

    const-string v0, "onReceivedAd must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzet$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzet$3;-><init>(Lcom/google/android/gms/internal/zzet;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1e
    return-void

    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet;->zzyY:Lcom/google/android/gms/internal/zzej;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdLoaded()V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    goto :goto_1e

    :catch_25
    move-exception v0

    const-string v1, "Could not call onAdLoaded."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method
