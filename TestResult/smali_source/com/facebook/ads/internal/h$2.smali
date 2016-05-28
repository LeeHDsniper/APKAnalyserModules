.class Lcom/facebook/ads/internal/h$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/internal/adapters/BannerAdapterListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/ads/internal/h;->n()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/Runnable;

.field final synthetic b:Lcom/facebook/ads/internal/h;


# direct methods
.method constructor <init>(Lcom/facebook/ads/internal/h;Ljava/lang/Runnable;)V
    .registers 3

    iput-object p1, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    iput-object p2, p0, Lcom/facebook/ads/internal/h$2;->a:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBannerAdClicked(Lcom/facebook/ads/internal/adapters/BannerAdapter;)V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->d(Lcom/facebook/ads/internal/h;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    iget-object v0, v0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/a;->b()V

    return-void
.end method

.method public onBannerAdLoaded(Lcom/facebook/ads/internal/adapters/BannerAdapter;Landroid/view/View;)V
    .registers 5

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->d(Lcom/facebook/ads/internal/h;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->e(Lcom/facebook/ads/internal/h;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/internal/h$2;->a:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->f(Lcom/facebook/ads/internal/h;)Lcom/facebook/ads/internal/adapters/AdAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v1, p1}, Lcom/facebook/ads/internal/h;->b(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/AdAdapter;)Lcom/facebook/ads/internal/adapters/AdAdapter;

    iget-object v1, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v1, p2}, Lcom/facebook/ads/internal/h;->a(Lcom/facebook/ads/internal/h;Landroid/view/View;)Landroid/view/View;

    iget-object v1, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v1}, Lcom/facebook/ads/internal/h;->g(Lcom/facebook/ads/internal/h;)Z

    move-result v1

    if-nez v1, :cond_30

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    iget-object v0, v0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/a;->a()V

    :goto_2f
    return-void

    :cond_30
    iget-object v1, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    iget-object v1, v1, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    invoke-virtual {v1, p2}, Lcom/facebook/ads/internal/a;->a(Landroid/view/View;)V

    iget-object v1, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v1, v0}, Lcom/facebook/ads/internal/h;->a(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/AdAdapter;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->b(Lcom/facebook/ads/internal/h;)V

    goto :goto_2f
.end method

.method public onBannerError(Lcom/facebook/ads/internal/adapters/BannerAdapter;Lcom/facebook/ads/AdError;)V
    .registers 5

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->d(Lcom/facebook/ads/internal/h;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->e(Lcom/facebook/ads/internal/h;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/internal/h$2;->a:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0, p1}, Lcom/facebook/ads/internal/h;->a(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/AdAdapter;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->c(Lcom/facebook/ads/internal/h;)V

    return-void
.end method

.method public onBannerLoggingImpression(Lcom/facebook/ads/internal/adapters/BannerAdapter;)V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->d(Lcom/facebook/ads/internal/h;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$2;->b:Lcom/facebook/ads/internal/h;

    iget-object v0, v0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/a;->c()V

    return-void
.end method
