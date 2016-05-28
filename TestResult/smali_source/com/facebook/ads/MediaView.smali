.class public Lcom/facebook/ads/MediaView;
.super Landroid/widget/RelativeLayout;


# instance fields
.field private final a:Lcom/facebook/ads/internal/view/e;

.field private final b:Lcom/facebook/ads/internal/view/video/a;

.field private c:Z

.field private d:Z


# direct methods
.method private a(Lcom/facebook/ads/NativeAd;)Z
    .registers 3

    invoke-virtual {p1}, Lcom/facebook/ads/NativeAd;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method


# virtual methods
.method public setAutoplay(Z)V
    .registers 3

    iput-boolean p1, p0, Lcom/facebook/ads/MediaView;->d:Z

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {v0, p1}, Lcom/facebook/ads/internal/view/video/a;->setAutoplay(Z)V

    return-void
.end method

.method public setNativeAd(Lcom/facebook/ads/NativeAd;)V
    .registers 7

    const/4 v4, 0x0

    const/4 v1, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p1, v2}, Lcom/facebook/ads/NativeAd;->b(Z)V

    iget-boolean v0, p0, Lcom/facebook/ads/MediaView;->d:Z

    invoke-virtual {p1, v0}, Lcom/facebook/ads/NativeAd;->setMediaViewAutoplay(Z)V

    iget-boolean v0, p0, Lcom/facebook/ads/MediaView;->c:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->a:Lcom/facebook/ads/internal/view/e;

    invoke-virtual {v0, v4, v4}, Lcom/facebook/ads/internal/view/e;->a(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/video/a;->b()V

    iput-boolean v3, p0, Lcom/facebook/ads/MediaView;->c:Z

    :cond_1c
    invoke-direct {p0, p1}, Lcom/facebook/ads/MediaView;->a(Lcom/facebook/ads/NativeAd;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->a:Lcom/facebook/ads/internal/view/e;

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/e;->setVisibility(I)V

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {v0, v3}, Lcom/facebook/ads/internal/view/video/a;->setVisibility(I)V

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {p0, v0}, Lcom/facebook/ads/MediaView;->bringChildToFront(Landroid/view/View;)V

    iput-boolean v2, p0, Lcom/facebook/ads/MediaView;->c:Z

    :try_start_33
    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {p1}, Lcom/facebook/ads/NativeAd;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/video/a;->setVideoPlayReportURI(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {p1}, Lcom/facebook/ads/NativeAd;->c()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/video/a;->setVideoTimeReportURI(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {p1}, Lcom/facebook/ads/NativeAd;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/video/a;->setVideoURI(Ljava/lang/String;)V
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_4e} :catch_4f

    :cond_4e
    :goto_4e
    return-void

    :catch_4f
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4e

    :cond_54
    invoke-virtual {p1}, Lcom/facebook/ads/NativeAd;->getAdCoverImage()Lcom/facebook/ads/NativeAd$Image;

    move-result-object v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/view/video/a;->a()V

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->b:Lcom/facebook/ads/internal/view/video/a;

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/view/video/a;->setVisibility(I)V

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->a:Lcom/facebook/ads/internal/view/e;

    invoke-virtual {v0, v3}, Lcom/facebook/ads/internal/view/e;->setVisibility(I)V

    iget-object v0, p0, Lcom/facebook/ads/MediaView;->a:Lcom/facebook/ads/internal/view/e;

    invoke-virtual {p0, v0}, Lcom/facebook/ads/MediaView;->bringChildToFront(Landroid/view/View;)V

    iput-boolean v2, p0, Lcom/facebook/ads/MediaView;->c:Z

    new-instance v0, Lcom/facebook/ads/internal/util/k;

    iget-object v1, p0, Lcom/facebook/ads/MediaView;->a:Lcom/facebook/ads/internal/view/e;

    invoke-direct {v0, v1}, Lcom/facebook/ads/internal/util/k;-><init>(Lcom/facebook/ads/internal/view/e;)V

    new-array v1, v2, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/facebook/ads/NativeAd;->getAdCoverImage()Lcom/facebook/ads/NativeAd$Image;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/ads/NativeAd$Image;->getUrl()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/util/k;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_4e
.end method
