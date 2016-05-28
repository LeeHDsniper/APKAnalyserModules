.class public Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;
.super Ljava/lang/Object;
.source "FacebookInterstitialUtils.java"


# static fields
.field private static facebookInterstitialAd:Lcom/facebook/ads/InterstitialAd;


# direct methods
.method public static displayFacebookInterstitialAd()V
    .registers 1

    .prologue
    .line 27
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->facebookInterstitialAd:Lcom/facebook/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/facebook/ads/InterstitialAd;->show()Z

    .line 28
    return-void
.end method

.method public static initializeFacebookInterstitialAd(Landroid/app/Activity;)V
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 15
    new-instance v0, Lcom/facebook/ads/InterstitialAd;

    const-string v1, "1170205383008749_1178244322204855"

    invoke-direct {v0, p0, v1}, Lcom/facebook/ads/InterstitialAd;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->facebookInterstitialAd:Lcom/facebook/ads/InterstitialAd;

    .line 16
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->facebookInterstitialAd:Lcom/facebook/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/facebook/ads/InterstitialAd;->loadAd()V

    .line 17
    return-void
.end method

.method public static isFacebookInterstitialReady()Z
    .registers 1

    .prologue
    .line 20
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->facebookInterstitialAd:Lcom/facebook/ads/InterstitialAd;

    if-eqz v0, :cond_e

    sget-object v0, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->facebookInterstitialAd:Lcom/facebook/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/facebook/ads/InterstitialAd;->isAdLoaded()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 21
    const/4 v0, 0x1

    .line 23
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
