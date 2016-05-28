.class final Lcom/facebook/ads/internal/view/g$b;
.super Lcom/facebook/ads/internal/util/u;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/ads/internal/view/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/ads/internal/util/u",
        "<",
        "Lcom/facebook/ads/internal/view/g;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/facebook/ads/internal/view/g;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/util/u;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/g$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/internal/view/g;

    if-eqz v0, :cond_22

    invoke-static {v0}, Lcom/facebook/ads/internal/view/g;->a(Lcom/facebook/ads/internal/view/g;)Landroid/widget/VideoView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/VideoView;->getCurrentPosition()I

    move-result v1

    invoke-static {v0}, Lcom/facebook/ads/internal/view/g;->b(Lcom/facebook/ads/internal/view/g;)I

    move-result v2

    if-le v1, v2, :cond_19

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/view/g;->a(Lcom/facebook/ads/internal/view/g;I)I

    :cond_19
    invoke-static {v0}, Lcom/facebook/ads/internal/view/g;->c(Lcom/facebook/ads/internal/view/g;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_22
    return-void
.end method
