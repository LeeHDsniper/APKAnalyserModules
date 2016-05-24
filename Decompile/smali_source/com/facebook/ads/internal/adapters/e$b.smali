.class final Lcom/facebook/ads/internal/adapters/e$b;
.super Lcom/facebook/ads/internal/util/u;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/ads/internal/adapters/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/ads/internal/util/u",
        "<",
        "Lcom/facebook/ads/internal/adapters/e;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/facebook/ads/internal/adapters/e;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/util/u;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    invoke-virtual {p0}, Lcom/facebook/ads/internal/adapters/e$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/internal/adapters/e;

    if-nez v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->a(Lcom/facebook/ads/internal/adapters/e;)Z

    move-result v1

    if-nez v1, :cond_15

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->b(Lcom/facebook/ads/internal/adapters/e;)Z

    move-result v1

    if-nez v1, :cond_8

    :cond_15
    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->c(Lcom/facebook/ads/internal/adapters/e;)Landroid/view/View;

    move-result-object v1

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->d(Lcom/facebook/ads/internal/adapters/e;)Lcom/facebook/ads/internal/adapters/e$a;

    move-result-object v2

    if-eqz v1, :cond_8

    if-eqz v2, :cond_8

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->e(Lcom/facebook/ads/internal/adapters/e;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->f(Lcom/facebook/ads/internal/adapters/e;)I

    move-result v4

    invoke-static {v3, v1, v4}, Lcom/facebook/ads/internal/util/g;->a(Landroid/content/Context;Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_37

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/e$a;->a()V

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/adapters/e;->a(Lcom/facebook/ads/internal/adapters/e;Z)Z

    goto :goto_8

    :cond_37
    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/e$a;->b()V

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->i(Lcom/facebook/ads/internal/adapters/e;)Landroid/os/Handler;

    move-result-object v1

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->g(Lcom/facebook/ads/internal/adapters/e;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/e;->h(Lcom/facebook/ads/internal/adapters/e;)I

    move-result v0

    int-to-long v4, v0

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_8
.end method
