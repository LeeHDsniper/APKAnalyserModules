.class Lcom/facebook/ads/internal/adapters/i$2;
.super Lcom/facebook/ads/internal/adapters/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/ads/internal/adapters/i;->a(Lcom/facebook/ads/internal/dto/d;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/internal/adapters/i;


# direct methods
.method constructor <init>(Lcom/facebook/ads/internal/adapters/i;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/adapters/i$2;->a:Lcom/facebook/ads/internal/adapters/i;

    invoke-direct {p0}, Lcom/facebook/ads/internal/adapters/c;-><init>()V

    return-void
.end method


# virtual methods
.method public d()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/i$2;->a:Lcom/facebook/ads/internal/adapters/i;

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/i;->a(Lcom/facebook/ads/internal/adapters/i;)Lcom/facebook/ads/internal/adapters/BannerAdapterListener;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/i$2;->a:Lcom/facebook/ads/internal/adapters/i;

    invoke-static {v0}, Lcom/facebook/ads/internal/adapters/i;->a(Lcom/facebook/ads/internal/adapters/i;)Lcom/facebook/ads/internal/adapters/BannerAdapterListener;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/i$2;->a:Lcom/facebook/ads/internal/adapters/i;

    invoke-interface {v0, v1}, Lcom/facebook/ads/internal/adapters/BannerAdapterListener;->onBannerLoggingImpression(Lcom/facebook/ads/internal/adapters/BannerAdapter;)V

    :cond_13
    return-void
.end method
