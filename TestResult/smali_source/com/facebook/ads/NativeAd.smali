.class public Lcom/facebook/ads/NativeAd;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/Ad;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/NativeAd$b;,
        Lcom/facebook/ads/NativeAd$Rating;,
        Lcom/facebook/ads/NativeAd$Image;
    }
.end annotation


# static fields
.field private static final a:Lcom/facebook/ads/internal/c;

.field private static final b:Ljava/lang/String;

.field private static c:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/facebook/ads/NativeAd;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private j:Lcom/facebook/ads/internal/adapters/p;

.field private p:Lcom/facebook/ads/internal/adapters/o;

.field private v:Z

.field private w:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/facebook/ads/internal/c;->a:Lcom/facebook/ads/internal/c;

    sput-object v0, Lcom/facebook/ads/NativeAd;->a:Lcom/facebook/ads/internal/c;

    const-class v0, Lcom/facebook/ads/NativeAd;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/NativeAd;->b:Ljava/lang/String;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/facebook/ads/NativeAd;->c:Ljava/util/WeakHashMap;

    return-void
.end method

.method static synthetic e(Lcom/facebook/ads/NativeAd;)Lcom/facebook/ads/internal/adapters/p;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/NativeAd;->j:Lcom/facebook/ads/internal/adapters/p;

    return-object v0
.end method

.method static synthetic g(Lcom/facebook/ads/NativeAd;)Lcom/facebook/ads/internal/adapters/o;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/NativeAd;->p:Lcom/facebook/ads/internal/adapters/o;

    return-object v0
.end method


# virtual methods
.method a()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/NativeAd;->isAdLoaded()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/facebook/ads/NativeAd;->j:Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/p;->t()Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method b()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/NativeAd;->isAdLoaded()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/facebook/ads/NativeAd;->j:Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/p;->u()Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method b(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/facebook/ads/NativeAd;->v:Z

    return-void
.end method

.method c()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/NativeAd;->isAdLoaded()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/facebook/ads/NativeAd;->j:Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/p;->v()Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method public getAdCoverImage()Lcom/facebook/ads/NativeAd$Image;
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/NativeAd;->isAdLoaded()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/facebook/ads/NativeAd;->j:Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/p;->i()Lcom/facebook/ads/NativeAd$Image;

    move-result-object v0

    goto :goto_7
.end method

.method public isAdLoaded()Z
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/NativeAd;->j:Lcom/facebook/ads/internal/adapters/p;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setMediaViewAutoplay(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/facebook/ads/NativeAd;->w:Z

    return-void
.end method
