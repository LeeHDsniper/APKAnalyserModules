.class public Lcom/facebook/ads/internal/view/m;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/internal/view/h;


# instance fields
.field private a:Lcom/facebook/ads/internal/view/g;


# direct methods
.method public constructor <init>(Lcom/facebook/ads/InterstitialAdActivity;Lcom/facebook/ads/internal/view/h$a;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/facebook/ads/internal/view/g;

    invoke-direct {v0, p1}, Lcom/facebook/ads/internal/view/g;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/facebook/ads/internal/view/m;->a:Lcom/facebook/ads/internal/view/g;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Lcom/facebook/ads/internal/view/m;->a:Lcom/facebook/ads/internal/view/g;

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/view/g;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/m;->a:Lcom/facebook/ads/internal/view/g;

    invoke-interface {p2, v0}, Lcom/facebook/ads/internal/view/h$a;->a(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 1

    return-void
.end method

.method public a(Landroid/content/Intent;Landroid/os/Bundle;)V
    .registers 7

    const-string v0, "videoURL"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "videoPlayReportURL"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "videoTimeReportURL"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/ads/internal/view/m;->a:Lcom/facebook/ads/internal/view/g;

    invoke-virtual {v3, v1}, Lcom/facebook/ads/internal/view/g;->setVideoPlayReportURI(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/ads/internal/view/m;->a:Lcom/facebook/ads/internal/view/g;

    invoke-virtual {v1, v2}, Lcom/facebook/ads/internal/view/g;->setVideoTimeReportURI(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/ads/internal/view/m;->a:Lcom/facebook/ads/internal/view/g;

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/view/g;->setVideoURI(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/m;->a:Lcom/facebook/ads/internal/view/g;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/g;->a()V

    return-void
.end method

.method public a(Landroid/os/Bundle;)V
    .registers 2

    return-void
.end method

.method public b()V
    .registers 1

    return-void
.end method

.method public c()V
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/m;->a:Lcom/facebook/ads/internal/view/g;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/g;->b()V

    return-void
.end method
