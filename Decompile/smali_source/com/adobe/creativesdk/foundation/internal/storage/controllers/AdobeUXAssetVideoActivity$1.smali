.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$1;
.super Ljava/lang/Object;
.source "AdobeUXAssetVideoActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->refreshVideoView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .registers 11
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 78
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v1, "VideoActivity-onError"

    const-string v2, "error code is %d:%d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_progressBar:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    const-string v1, "Can\'t play this video"

    invoke-static {v0, v1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->finish()V

    .line 82
    return v6
.end method
