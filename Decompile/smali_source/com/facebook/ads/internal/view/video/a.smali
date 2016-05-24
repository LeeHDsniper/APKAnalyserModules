.class public Lcom/facebook/ads/internal/view/video/a;
.super Landroid/widget/FrameLayout;


# instance fields
.field private a:Lcom/facebook/ads/internal/view/video/support/a;

.field private b:Lcom/facebook/ads/internal/adapters/e;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Z

.field private h:Z

.field private i:I

.field private n:F


# direct methods
.method private f()V
    .registers 6

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/facebook/ads/internal/view/video/a;->h:Z

    if-nez v0, :cond_39

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/video/a;->getVideoTimeReportURI()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_39

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "time"

    iget v2, p0, Lcom/facebook/ads/internal/view/video/a;->i:I

    div-int/lit16 v2, v2, 0x3e8

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "inline"

    const-string v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/facebook/ads/internal/util/o;

    invoke-direct {v1, v0}, Lcom/facebook/ads/internal/util/o;-><init>(Ljava/util/Map;)V

    new-array v0, v4, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/video/a;->getVideoTimeReportURI()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v3

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/util/o;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    iput-boolean v4, p0, Lcom/facebook/ads/internal/view/video/a;->h:Z

    iput v3, p0, Lcom/facebook/ads/internal/view/video/a;->i:I

    :cond_39
    return-void
.end method

.method private setOnClickListenerInternal(Landroid/view/View$OnClickListener;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private setOnTouchListenerInternal(Landroid/view/View$OnTouchListener;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/view/video/a;->i:I

    if-lez v0, :cond_a

    invoke-direct {p0}, Lcom/facebook/ads/internal/view/video/a;->f()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/ads/internal/view/video/a;->i:I

    :cond_a
    return-void
.end method

.method public b()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/ads/internal/view/video/a;->d:Ljava/lang/String;

    return-void
.end method

.method public getAutoplay()Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/view/video/a;->g:Z

    return v0
.end method

.method public getVideoPlayReportURI()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/a;->e:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoTimeReportURI()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/a;->f:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoURI()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/a;->d:Ljava/lang/String;

    return-object v0
.end method

.method getVolume()F
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/view/video/a;->n:F

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/a;->b:Lcom/facebook/ads/internal/adapters/e;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/e;->a()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    invoke-direct {p0}, Lcom/facebook/ads/internal/view/video/a;->f()V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/a;->b:Lcom/facebook/ads/internal/adapters/e;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/e;->b()V

    return-void
.end method

.method public setAutoplay(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/facebook/ads/internal/view/video/a;->g:Z

    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2

    return-void
.end method

.method public setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    .registers 2

    return-void
.end method

.method public setVideoPlayReportURI(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/view/video/a;->e:Ljava/lang/String;

    return-void
.end method

.method public setVideoTimeReportURI(Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/video/a;->a()V

    iput-object p1, p0, Lcom/facebook/ads/internal/view/video/a;->f:Ljava/lang/String;

    return-void
.end method

.method public setVideoURI(Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/facebook/ads/internal/view/video/a;->d:Ljava/lang/String;

    if-eqz p1, :cond_16

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/a;->a:Lcom/facebook/ads/internal/view/video/support/a;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/video/support/a;->setup(Landroid/net/Uri;)V

    iget-boolean v0, p0, Lcom/facebook/ads/internal/view/video/a;->g:Z

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/a;->a:Lcom/facebook/ads/internal/view/video/support/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/video/support/a;->a()V

    :cond_16
    return-void
.end method

.method setVolume(F)V
    .registers 2

    iput p1, p0, Lcom/facebook/ads/internal/view/video/a;->n:F

    return-void
.end method
