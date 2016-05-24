.class public Lcom/facebook/ads/internal/adapters/m;
.super Lcom/facebook/ads/internal/adapters/b;


# static fields
.field private static final b:Ljava/lang/String;


# instance fields
.field private final c:Lcom/facebook/ads/internal/view/d;

.field private d:Lcom/facebook/ads/internal/adapters/l;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/facebook/ads/internal/adapters/m;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/adapters/m;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/facebook/ads/internal/view/d;Lcom/facebook/ads/internal/adapters/c;)V
    .registers 4

    invoke-direct {p0, p1, p3}, Lcom/facebook/ads/internal/adapters/b;-><init>(Landroid/content/Context;Lcom/facebook/ads/internal/adapters/c;)V

    iput-object p2, p0, Lcom/facebook/ads/internal/adapters/m;->c:Lcom/facebook/ads/internal/view/d;

    return-void
.end method

.method private a(Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/m;->d:Lcom/facebook/ads/internal/adapters/l;

    if-nez v0, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/m;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/l;->f()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    new-instance v1, Lcom/facebook/ads/internal/util/o;

    invoke-direct {v1, p1}, Lcom/facebook/ads/internal/util/o;-><init>(Ljava/util/Map;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/facebook/ads/internal/util/o;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_4
.end method


# virtual methods
.method public a(Lcom/facebook/ads/internal/adapters/l;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/adapters/m;->d:Lcom/facebook/ads/internal/adapters/l;

    return-void
.end method

.method protected b()V
    .registers 4

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/m;->d:Lcom/facebook/ads/internal/adapters/l;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/m;->c:Lcom/facebook/ads/internal/view/d;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/m;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/l;->g()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_24

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/m;->c:Lcom/facebook/ads/internal/view/d;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/d;->b()Z

    move-result v0

    if-eqz v0, :cond_30

    sget-object v0, Lcom/facebook/ads/internal/adapters/m;->b:Ljava/lang/String;

    const-string v1, "Webview already destroyed, cannot send impression"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_24
    :goto_24
    const-string v0, "evt"

    const-string v1, "native_imp"

    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/adapters/m;->a(Ljava/util/Map;)V

    goto :goto_4

    :cond_30
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/m;->c:Lcom/facebook/ads/internal/view/d;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/ads/internal/adapters/m;->d:Lcom/facebook/ads/internal/adapters/l;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/l;->g()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/d;->loadUrl(Ljava/lang/String;)V

    goto :goto_24
.end method

.method public d()V
    .registers 3

    const-string v0, "evt"

    const-string v1, "interstitial_displayed"

    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/adapters/m;->a(Ljava/util/Map;)V

    return-void
.end method
