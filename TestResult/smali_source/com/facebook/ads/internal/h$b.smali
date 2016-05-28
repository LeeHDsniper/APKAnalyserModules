.class final Lcom/facebook/ads/internal/h$b;
.super Lcom/facebook/ads/internal/util/u;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/ads/internal/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/ads/internal/util/u",
        "<",
        "Lcom/facebook/ads/internal/h;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/facebook/ads/internal/h;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/util/u;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/internal/h$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/internal/h;

    if-nez v0, :cond_9

    :goto_8
    return-void

    :cond_9
    invoke-static {v0}, Lcom/facebook/ads/internal/h;->b(Lcom/facebook/ads/internal/h;)V

    goto :goto_8
.end method
