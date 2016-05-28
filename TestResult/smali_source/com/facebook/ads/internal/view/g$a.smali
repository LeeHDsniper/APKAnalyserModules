.class final Lcom/facebook/ads/internal/view/g$a;
.super Lcom/facebook/ads/internal/util/u;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/ads/internal/view/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
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

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/g$a;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/internal/view/g;

    if-eqz v0, :cond_26

    invoke-static {v0}, Lcom/facebook/ads/internal/view/g;->a(Lcom/facebook/ads/internal/view/g;)Landroid/widget/VideoView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/VideoView;->getCurrentPosition()I

    move-result v1

    const/16 v2, 0xbb8

    if-le v1, v2, :cond_27

    new-instance v1, Lcom/facebook/ads/internal/util/o;

    invoke-direct {v1}, Lcom/facebook/ads/internal/util/o;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/g;->getVideoPlayReportURI()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/facebook/ads/internal/util/o;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_26
    :goto_26
    return-void

    :cond_27
    invoke-static {v0}, Lcom/facebook/ads/internal/view/g;->d(Lcom/facebook/ads/internal/view/g;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_26
.end method
