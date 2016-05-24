.class public Lcom/google/android/gms/internal/zzep;
.super Lcom/google/android/gms/internal/zzek$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzek$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    return-void
.end method


# virtual methods
.method public getBody()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getBody()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCallToAction()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getCallToAction()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public getHeadline()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getHeadline()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImages()Ljava/util/List;
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getImages()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_30

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/ads/formats/NativeAd$Image;

    new-instance v3, Lcom/google/android/gms/ads/internal/formats/zzc;

    invoke-interface {v0}, Lcom/google/android/gms/ads/formats/NativeAd$Image;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-interface {v0}, Lcom/google/android/gms/ads/formats/NativeAd$Image;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-direct {v3, v4, v0}, Lcom/google/android/gms/ads/internal/formats/zzc;-><init>(Landroid/graphics/drawable/Drawable;Landroid/net/Uri;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_2e
    move-object v0, v1

    :goto_2f
    return-object v0

    :cond_30
    const/4 v0, 0x0

    goto :goto_2f
.end method

.method public getOverrideClickHandling()Z
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getOverrideClickHandling()Z

    move-result v0

    return v0
.end method

.method public getOverrideImpressionRecording()Z
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getOverrideImpressionRecording()Z

    move-result v0

    return v0
.end method

.method public getPrice()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getPrice()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStarRating()D
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getStarRating()D

    move-result-wide v0

    return-wide v0
.end method

.method public getStore()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getStore()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public recordImpression()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->recordImpression()V

    return-void
.end method

.method public zzc(Lcom/google/android/gms/dynamic/zzd;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzp(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->handleClick(Landroid/view/View;)V

    return-void
.end method

.method public zzd(Lcom/google/android/gms/dynamic/zzd;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzp(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->trackView(Landroid/view/View;)V

    return-void
.end method

.method public zzds()Lcom/google/android/gms/internal/zzcj;
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzep;->zzza:Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->getIcon()Lcom/google/android/gms/ads/formats/NativeAd$Image;

    move-result-object v1

    if-eqz v1, :cond_16

    new-instance v0, Lcom/google/android/gms/ads/internal/formats/zzc;

    invoke-interface {v1}, Lcom/google/android/gms/ads/formats/NativeAd$Image;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-interface {v1}, Lcom/google/android/gms/ads/formats/NativeAd$Image;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/ads/internal/formats/zzc;-><init>(Landroid/graphics/drawable/Drawable;Landroid/net/Uri;)V

    :goto_15
    return-object v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
