.class Lcom/facebook/ads/internal/view/f$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/internal/view/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/ads/internal/view/f;-><init>(Lcom/facebook/ads/InterstitialAdActivity;Lcom/facebook/ads/internal/view/h$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/InterstitialAdActivity;

.field final synthetic b:Lcom/facebook/ads/internal/view/f;


# direct methods
.method constructor <init>(Lcom/facebook/ads/internal/view/f;Lcom/facebook/ads/InterstitialAdActivity;)V
    .registers 3

    iput-object p1, p0, Lcom/facebook/ads/internal/view/f$1;->b:Lcom/facebook/ads/internal/view/f;

    iput-object p2, p0, Lcom/facebook/ads/internal/view/f$1;->a:Lcom/facebook/ads/InterstitialAdActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 2

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .registers 6

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "fbad"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    const-string v1, "close"

    invoke-virtual {v0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f$1;->a:Lcom/facebook/ads/InterstitialAdActivity;

    invoke-virtual {v0}, Lcom/facebook/ads/InterstitialAdActivity;->finish()V

    :cond_21
    :goto_21
    return-void

    :cond_22
    iget-object v1, p0, Lcom/facebook/ads/internal/view/f$1;->b:Lcom/facebook/ads/internal/view/f;

    invoke-static {v1}, Lcom/facebook/ads/internal/view/f;->a(Lcom/facebook/ads/internal/view/f;)Lcom/facebook/ads/internal/view/h$a;

    move-result-object v1

    const-string v2, "com.facebook.ads.interstitial.clicked"

    invoke-interface {v1, v2}, Lcom/facebook/ads/internal/view/h$a;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/ads/internal/view/f$1;->a:Lcom/facebook/ads/InterstitialAdActivity;

    invoke-static {v1, v0}, Lcom/facebook/ads/internal/action/b;->a(Landroid/content/Context;Landroid/net/Uri;)Lcom/facebook/ads/internal/action/a;

    move-result-object v0

    if-eqz v0, :cond_21

    :try_start_35
    iget-object v1, p0, Lcom/facebook/ads/internal/view/f$1;->b:Lcom/facebook/ads/internal/view/f;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/action/a;->a()Lcom/facebook/ads/internal/util/b$a;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/facebook/ads/internal/view/f;->a(Lcom/facebook/ads/internal/view/f;Lcom/facebook/ads/internal/util/b$a;)Lcom/facebook/ads/internal/util/b$a;

    iget-object v1, p0, Lcom/facebook/ads/internal/view/f$1;->b:Lcom/facebook/ads/internal/view/f;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/facebook/ads/internal/view/f;->a(Lcom/facebook/ads/internal/view/f;J)J

    invoke-virtual {v0}, Lcom/facebook/ads/internal/action/a;->b()V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_4a} :catch_4b

    goto :goto_21

    :catch_4b
    move-exception v0

    invoke-static {}, Lcom/facebook/ads/internal/view/f;->d()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error executing action"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_21
.end method

.method public b()V
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/f$1;->b:Lcom/facebook/ads/internal/view/f;

    invoke-static {v0}, Lcom/facebook/ads/internal/view/f;->b(Lcom/facebook/ads/internal/view/f;)Lcom/facebook/ads/internal/adapters/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/m;->a()V

    return-void
.end method
