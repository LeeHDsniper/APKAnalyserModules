.class public Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;
.super Ljava/lang/Object;
.source "AdmobInterstitialUtils.java"


# static fields
.field private static interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;


# direct methods
.method public static displayAdmobInterstitial()V
    .registers 1

    .prologue
    .line 31
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    .line 32
    return-void
.end method

.method public static initializeAdmobInterstitial(Landroid/app/Activity;)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 16
    new-instance v1, Lcom/google/android/gms/ads/InterstitialAd;

    invoke-direct {v1, p0}, Lcom/google/android/gms/ads/InterstitialAd;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    .line 17
    sget-object v1, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    const-string v2, "ca-app-pub-5680507560819481/1233814459"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/InterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 18
    new-instance v1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    .line 19
    .local v0, "adRequest":Lcom/google/android/gms/ads/AdRequest;
    sget-object v1, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/InterstitialAd;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 20
    return-void
.end method

.method public static isAdmobInterstitialReady()Z
    .registers 1

    .prologue
    .line 23
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v0, :cond_e

    sget-object v0, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 24
    const/4 v0, 0x1

    .line 26
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
