.class public Lcom/facebook/ads/InterstitialAd;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/Ad;


# static fields
.field private static final a:Lcom/facebook/ads/internal/c;


# instance fields
.field private final b:Landroid/content/Context;

.field private final c:Ljava/lang/String;

.field private d:Lcom/facebook/ads/internal/h;

.field private e:Z

.field private f:Z

.field private g:Lcom/facebook/ads/InterstitialAdListener;

.field private h:Lcom/facebook/ads/ImpressionListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/facebook/ads/internal/c;->a:Lcom/facebook/ads/internal/c;

    sput-object v0, Lcom/facebook/ads/InterstitialAd;->a:Lcom/facebook/ads/internal/c;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/ads/InterstitialAd;->b:Landroid/content/Context;

    iput-object p2, p0, Lcom/facebook/ads/InterstitialAd;->c:Ljava/lang/String;

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/InterstitialAdListener;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd;->g:Lcom/facebook/ads/InterstitialAdListener;

    return-object v0
.end method

.method static synthetic a(Lcom/facebook/ads/InterstitialAd;Lcom/facebook/ads/internal/h;)Lcom/facebook/ads/internal/h;
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    return-object p1
.end method

.method static synthetic a(Lcom/facebook/ads/InterstitialAd;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/facebook/ads/InterstitialAd;->e:Z

    return p1
.end method

.method static synthetic b(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/ImpressionListener;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd;->h:Lcom/facebook/ads/ImpressionListener;

    return-object v0
.end method

.method static synthetic b(Lcom/facebook/ads/InterstitialAd;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/facebook/ads/InterstitialAd;->f:Z

    return p1
.end method

.method static synthetic c(Lcom/facebook/ads/InterstitialAd;)Lcom/facebook/ads/internal/h;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    return-object v0
.end method


# virtual methods
.method public isAdLoaded()Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/InterstitialAd;->e:Z

    return v0
.end method

.method public loadAd()V
    .registers 9

    const/4 v6, 0x1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/ads/InterstitialAd;->e:Z

    iget-boolean v0, p0, Lcom/facebook/ads/InterstitialAd;->f:Z

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "InterstitialAd cannot be loaded while being displayed. Make sure your adapter calls adapterListener.onInterstitialDismissed()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/h;->d()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    :cond_1c
    sget-object v4, Lcom/facebook/ads/AdSize;->INTERSTITIAL:Lcom/facebook/ads/AdSize;

    sget-object v0, Lcom/facebook/ads/AdSize;->INTERSTITIAL:Lcom/facebook/ads/AdSize;

    invoke-static {v0}, Lcom/facebook/ads/internal/util/g;->a(Lcom/facebook/ads/AdSize;)Lcom/facebook/ads/internal/e;

    move-result-object v3

    new-instance v0, Lcom/facebook/ads/internal/h;

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd;->b:Landroid/content/Context;

    iget-object v2, p0, Lcom/facebook/ads/InterstitialAd;->c:Ljava/lang/String;

    sget-object v5, Lcom/facebook/ads/InterstitialAd;->a:Lcom/facebook/ads/internal/c;

    move v7, v6

    invoke-direct/range {v0 .. v7}, Lcom/facebook/ads/internal/h;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/ads/internal/e;Lcom/facebook/ads/AdSize;Lcom/facebook/ads/internal/c;IZ)V

    iput-object v0, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    new-instance v1, Lcom/facebook/ads/InterstitialAd$1;

    invoke-direct {v1, p0}, Lcom/facebook/ads/InterstitialAd$1;-><init>(Lcom/facebook/ads/InterstitialAd;)V

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/h;->a(Lcom/facebook/ads/internal/a;)V

    iget-object v0, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/h;->b()V

    return-void
.end method

.method public show()Z
    .registers 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    iget-boolean v2, p0, Lcom/facebook/ads/InterstitialAd;->e:Z

    if-nez v2, :cond_12

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd;->g:Lcom/facebook/ads/InterstitialAdListener;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/facebook/ads/InterstitialAd;->g:Lcom/facebook/ads/InterstitialAdListener;

    sget-object v2, Lcom/facebook/ads/AdError;->INTERNAL_ERROR:Lcom/facebook/ads/AdError;

    invoke-interface {v1, p0, v2}, Lcom/facebook/ads/InterstitialAdListener;->onError(Lcom/facebook/ads/Ad;Lcom/facebook/ads/AdError;)V

    :cond_11
    :goto_11
    return v0

    :cond_12
    iget-object v2, p0, Lcom/facebook/ads/InterstitialAd;->d:Lcom/facebook/ads/internal/h;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/h;->c()V

    iput-boolean v1, p0, Lcom/facebook/ads/InterstitialAd;->f:Z

    iput-boolean v0, p0, Lcom/facebook/ads/InterstitialAd;->e:Z

    move v0, v1

    goto :goto_11
.end method
