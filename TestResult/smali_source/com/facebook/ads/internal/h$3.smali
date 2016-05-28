.class Lcom/facebook/ads/internal/h$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/ads/internal/h;->n()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/facebook/ads/internal/adapters/InterstitialAdapter;

.field final synthetic b:Lcom/facebook/ads/internal/h;


# direct methods
.method constructor <init>(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/InterstitialAdapter;)V
    .registers 3

    iput-object p1, p0, Lcom/facebook/ads/internal/h$3;->b:Lcom/facebook/ads/internal/h;

    iput-object p2, p0, Lcom/facebook/ads/internal/h$3;->a:Lcom/facebook/ads/internal/adapters/InterstitialAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/h$3;->b:Lcom/facebook/ads/internal/h;

    iget-object v1, p0, Lcom/facebook/ads/internal/h$3;->a:Lcom/facebook/ads/internal/adapters/InterstitialAdapter;

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/h;->a(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/AdAdapter;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/h$3;->b:Lcom/facebook/ads/internal/h;

    invoke-static {v0}, Lcom/facebook/ads/internal/h;->c(Lcom/facebook/ads/internal/h;)V

    return-void
.end method
