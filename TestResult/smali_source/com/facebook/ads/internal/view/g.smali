.class public Lcom/facebook/ads/internal/view/g;
.super Landroid/widget/LinearLayout;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/internal/view/g$a;,
        Lcom/facebook/ads/internal/view/g$b;
    }
.end annotation


# instance fields
.field private a:Landroid/widget/VideoView;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Z

.field private e:I

.field private f:Landroid/os/Handler;

.field private g:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/facebook/ads/internal/view/g;->c()V

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/view/g;I)I
    .registers 2

    iput p1, p0, Lcom/facebook/ads/internal/view/g;->e:I

    return p1
.end method

.method static synthetic a(Lcom/facebook/ads/internal/view/g;)Landroid/widget/VideoView;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    return-object v0
.end method

.method static synthetic b(Lcom/facebook/ads/internal/view/g;)I
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/view/g;->e:I

    return v0
.end method

.method static synthetic c(Lcom/facebook/ads/internal/view/g;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->g:Landroid/os/Handler;

    return-object v0
.end method

.method private c()V
    .registers 7

    const-wide/16 v4, 0xfa

    const/4 v3, -0x1

    new-instance v0, Landroid/widget/MediaController;

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/g;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/VideoView;

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/g;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/VideoView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    invoke-virtual {v0, p0}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    invoke-virtual {v1, v0}, Landroid/widget/VideoView;->setMediaController(Landroid/widget/MediaController;)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xb

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0x9

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xc

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    invoke-virtual {v1, v0}, Landroid/widget/VideoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    invoke-virtual {p0, v0}, Lcom/facebook/ads/internal/view/g;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/facebook/ads/internal/view/g;->g:Landroid/os/Handler;

    new-instance v0, Lcom/facebook/ads/internal/view/g$b;

    invoke-direct {v0, p0}, Lcom/facebook/ads/internal/view/g$b;-><init>(Lcom/facebook/ads/internal/view/g;)V

    iget-object v1, p0, Lcom/facebook/ads/internal/view/g;->g:Landroid/os/Handler;

    invoke-virtual {v1, v0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/facebook/ads/internal/view/g;->f:Landroid/os/Handler;

    new-instance v0, Lcom/facebook/ads/internal/view/g$a;

    invoke-direct {v0, p0}, Lcom/facebook/ads/internal/view/g$a;-><init>(Lcom/facebook/ads/internal/view/g;)V

    iget-object v1, p0, Lcom/facebook/ads/internal/view/g;->f:Landroid/os/Handler;

    invoke-virtual {v1, v0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method static synthetic d(Lcom/facebook/ads/internal/view/g;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->f:Landroid/os/Handler;

    return-object v0
.end method

.method private d()V
    .registers 6

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/facebook/ads/internal/view/g;->d:Z

    if-nez v0, :cond_39

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/g;->getVideoTimeReportURI()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_39

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "time"

    iget v2, p0, Lcom/facebook/ads/internal/view/g;->e:I

    div-int/lit16 v2, v2, 0x3e8

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "inline"

    const-string v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/facebook/ads/internal/util/o;

    invoke-direct {v1, v0}, Lcom/facebook/ads/internal/util/o;-><init>(Ljava/util/Map;)V

    new-array v0, v4, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/g;->getVideoTimeReportURI()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v3

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/util/o;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    iput-boolean v4, p0, Lcom/facebook/ads/internal/view/g;->d:Z

    iput v3, p0, Lcom/facebook/ads/internal/view/g;->e:I

    :cond_39
    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->start()V

    return-void
.end method

.method public b()V
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->stopPlayback()V

    :cond_9
    return-void
.end method

.method public getVideoPlayReportURI()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->b:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoTimeReportURI()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->c:Ljava/lang/String;

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .registers 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    invoke-direct {p0}, Lcom/facebook/ads/internal/view/g;->d()V

    return-void
.end method

.method public setVideoPlayReportURI(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/view/g;->b:Ljava/lang/String;

    return-void
.end method

.method public setVideoTimeReportURI(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/view/g;->c:Ljava/lang/String;

    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;)V
    .registers 3

    if-eqz p1, :cond_7

    iget-object v0, p0, Lcom/facebook/ads/internal/view/g;->a:Landroid/widget/VideoView;

    invoke-virtual {v0, p1}, Landroid/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    :cond_7
    return-void
.end method

.method public setVideoURI(Ljava/lang/String;)V
    .registers 3

    if-eqz p1, :cond_9

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/facebook/ads/internal/view/g;->setVideoURI(Landroid/net/Uri;)V

    :cond_9
    return-void
.end method
