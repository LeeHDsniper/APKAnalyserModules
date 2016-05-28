.class Lcom/facebook/ads/InterstitialAd$1;
.super Lcom/facebook/ads/internal/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/ads/InterstitialAd;->loadAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/InterstitialAd;


# direct methods
.method constructor <init>(Lcom/facebook/ads/InterstitialAd;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-direct {p0}, Lcom/facebook/ads/internal/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;Z)Z

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/facebook/ads/InterstitialAdListener;->onAdLoaded(Lcom/facebook/ads/Ad;)V

    :cond_19
    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public a(Lcom/facebook/ads/internal/b;)V
    .registers 5

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-virtual {p1}, Lcom/facebook/ads/internal/b;->b()Lcom/facebook/ads/AdError;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/ads/InterstitialAdListener;->onError(Lcom/facebook/ads/Ad;Lcom/facebook/ads/AdError;)V

    :cond_17
    return-void
.end method

.method public b()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/facebook/ads/InterstitialAdListener;->onAdClicked(Lcom/facebook/ads/Ad;)V

    :cond_13
    return-void
.end method

.method public c()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->b(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/ImpressionListener;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->b(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/ImpressionListener;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/facebook/ads/ImpressionListener;->onLoggingImpression(Lcom/facebook/ads/Ad;)V

    :cond_13
    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    instance-of v0, v0, Lcom/facebook/ads/ImpressionListener;

    if-eqz v0, :cond_38

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v1}, Lcom/facebook/ads/InterstitialAd;->b(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/ImpressionListener;

    move-result-object v1

    if-eq v0, v1, :cond_38

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/ImpressionListener;

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/facebook/ads/ImpressionListener;->onLoggingImpression(Lcom/facebook/ads/Ad;)V

    :cond_38
    return-void
.end method

.method public d()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/facebook/ads/InterstitialAdListener;->onInterstitialDisplayed(Lcom/facebook/ads/Ad;)V

    :cond_13
    return-void
.end method

.method public e()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/facebook/ads/InterstitialAd;->b(Lcom/facebook/ads/InterstitialAd;Z)Z

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->c(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/internal/h;

    move-result-object v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->c(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/internal/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/h;->d()V

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;Lcom/facebook/ads/internal/h;)Lcom/facebook/ads/internal/h;

    :cond_1d
    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-static {v0}, Lcom/facebook/ads/InterstitialAd;->a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd$1;->a:Lcom/facebook/ads/InterstitialAd;

    invoke-interface {v0, v1}, Lcom/facebook/ads/InterstitialAdListener;->onInterstitialDismissed(Lcom/facebook/ads/Ad;)V

    :cond_30
    return-void
.end method
