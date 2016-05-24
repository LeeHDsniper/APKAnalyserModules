.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;
.super Ljava/lang/Object;
.source "AdobeUXAssetVideoActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->refreshVideoView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field progressBarShown:Z

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;->progressBarShown:Z

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .registers 3
    .param p1, "mediaPlayer"    # Landroid/media/MediaPlayer;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_stopPosition:I
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)I

    move-result v0

    if-eqz v0, :cond_11

    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_stopPosition:I
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 94
    :cond_11
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 103
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 111
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 122
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 123
    return-void
.end method
