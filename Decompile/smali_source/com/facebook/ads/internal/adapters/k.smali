.class public Lcom/facebook/ads/internal/adapters/k;
.super Lcom/facebook/ads/internal/adapters/p;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/facebook/ads/internal/adapters/n;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/facebook/ads/internal/adapters/p;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Lcom/facebook/ads/internal/adapters/q;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/facebook/ads/internal/adapters/q;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "data"

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/n;->a(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/adapters/n;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    iput-object p1, p0, Lcom/facebook/ads/internal/adapters/k;->a:Landroid/content/Context;

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-static {p1, v0}, Lcom/facebook/ads/internal/util/f;->a(Landroid/content/Context;Lcom/facebook/ads/internal/adapters/a;)Z

    move-result v0

    if-eqz v0, :cond_22

    :cond_1c
    sget-object v0, Lcom/facebook/ads/AdError;->NO_FILL:Lcom/facebook/ads/AdError;

    invoke-interface {p2, p0, v0}, Lcom/facebook/ads/internal/adapters/q;->a(Lcom/facebook/ads/internal/adapters/p;Lcom/facebook/ads/AdError;)V

    :goto_21
    return-void

    :cond_22
    if-eqz p2, :cond_27

    invoke-interface {p2, p0}, Lcom/facebook/ads/internal/adapters/q;->a(Lcom/facebook/ads/internal/adapters/p;)V

    :cond_27
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/n;->v()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/util/b;->a:Ljava/lang/String;

    goto :goto_21
.end method

.method public a(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0, p1}, Lcom/facebook/ads/internal/adapters/n;->a(Ljava/util/Map;)V

    goto :goto_4
.end method

.method public b(Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/k;->a:Landroid/content/Context;

    invoke-virtual {v0, v1, p1}, Lcom/facebook/ads/internal/adapters/n;->a(Landroid/content/Context;Ljava/util/Map;)V

    goto :goto_4
.end method

.method public b()Z
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/n;->p()Z

    move-result v0

    return v0
.end method

.method public d()Z
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/n;->q()Z

    move-result v0

    return v0
.end method

.method public e()I
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/n;->r()I

    move-result v0

    return v0
.end method

.method public i()Lcom/facebook/ads/NativeAd$Image;
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/internal/adapters/k;->w()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/n;->e()Lcom/facebook/ads/NativeAd$Image;

    move-result-object v0

    goto :goto_7
.end method

.method public onDestroy()V
    .registers 1

    return-void
.end method

.method public t()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/internal/adapters/k;->w()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/n;->l()Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method public u()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/internal/adapters/k;->w()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/n;->m()Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method public v()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/internal/adapters/k;->w()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/n;->n()Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method public w()Z
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/k;->b:Lcom/facebook/ads/internal/adapters/n;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
