.class public Lcom/facebook/ads/internal/view/video/support/d;
.super Landroid/view/TextureView;

# interfaces
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/view/TextureView$SurfaceTextureListener;
.implements Lcom/facebook/ads/internal/view/video/support/e;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation


# static fields
.field private static final i:Ljava/lang/String;


# instance fields
.field private a:Landroid/view/View;

.field private b:Landroid/net/Uri;

.field private c:Lcom/facebook/ads/internal/view/video/support/b;

.field private d:Landroid/view/Surface;

.field private e:Landroid/media/MediaPlayer;

.field private f:Z

.field private g:Z

.field private h:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/facebook/ads/internal/view/video/support/d;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/view/video/support/d;->i:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private a()V
    .registers 5

    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    :try_start_5
    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/video/support/d;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/facebook/ads/internal/view/video/support/d;->b:Landroid/net/Uri;

    invoke-virtual {v1, v0, v2}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->d:Landroid/view/Surface;

    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    invoke-virtual {v1, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    new-instance v0, Lcom/facebook/ads/internal/view/video/support/c;

    iget-object v2, p0, Lcom/facebook/ads/internal/view/video/support/d;->a:Landroid/view/View;

    invoke-direct {v0, v2}, Lcom/facebook/ads/internal/view/video/support/c;-><init>(Landroid/view/View;)V

    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    invoke-virtual {v1, p0}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setLooping(Z)V

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepareAsync()V

    iput-object v1, p0, Lcom/facebook/ads/internal/view/video/support/d;->e:Landroid/media/MediaPlayer;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_2c} :catch_2d

    :goto_2c
    return-void

    :catch_2d
    move-exception v0

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    sget-object v1, Lcom/facebook/ads/internal/view/video/support/d;->i:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot prepare media player with SurfaceTexture: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2c
.end method


# virtual methods
.method public a(Landroid/view/View;Landroid/net/Uri;)V
    .registers 3

    iput-object p1, p0, Lcom/facebook/ads/internal/view/video/support/d;->a:Landroid/view/View;

    iput-object p2, p0, Lcom/facebook/ads/internal/view/video/support/d;->b:Landroid/net/Uri;

    invoke-virtual {p0, p0}, Lcom/facebook/ads/internal/view/video/support/d;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    return-void
.end method

.method public getCurrentPosition()I
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/facebook/ads/internal/view/video/support/d;->e:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_b

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->e:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    :cond_b
    return v0
.end method

.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .registers 3

    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .registers 5

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->c:Lcom/facebook/ads/internal/view/video/support/b;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->c:Lcom/facebook/ads/internal/view/video/support/b;

    invoke-interface {v0, p1}, Lcom/facebook/ads/internal/view/video/support/b;->a(Landroid/media/MediaPlayer;)V

    :cond_a
    iget-boolean v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->g:Z

    if-eqz v0, :cond_13

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    iput-boolean v2, p0, Lcom/facebook/ads/internal/view/video/support/d;->g:Z

    :cond_13
    iget v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->h:I

    if-lez v0, :cond_2c

    iget v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->h:I

    iget-object v1, p0, Lcom/facebook/ads/internal/view/video/support/d;->e:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    if-lt v0, v1, :cond_23

    iput v2, p0, Lcom/facebook/ads/internal/view/video/support/d;->h:I

    :cond_23
    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->e:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/facebook/ads/internal/view/video/support/d;->h:I

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    iput v2, p0, Lcom/facebook/ads/internal/view/video/support/d;->h:I

    :cond_2c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->f:Z

    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .registers 5

    new-instance v0, Landroid/view/Surface;

    invoke-direct {v0, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->d:Landroid/view/Surface;

    invoke-direct {p0}, Lcom/facebook/ads/internal/view/video/support/d;->a()V

    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .registers 4

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .registers 2

    return-void
.end method

.method public setFrameVideoViewListener(Lcom/facebook/ads/internal/view/video/support/b;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/view/video/support/d;->c:Lcom/facebook/ads/internal/view/video/support/b;

    return-void
.end method

.method public start()V
    .registers 3

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->f:Z

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->e:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    :goto_a
    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/video/support/d;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/video/support/d;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-virtual {p0, v0, v1, v1}, Lcom/facebook/ads/internal/view/video/support/d;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    :cond_17
    return-void

    :cond_18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/ads/internal/view/video/support/d;->g:Z

    goto :goto_a
.end method
