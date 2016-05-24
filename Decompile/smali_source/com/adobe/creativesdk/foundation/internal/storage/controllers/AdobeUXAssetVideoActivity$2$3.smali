.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$3;
.super Ljava/lang/Object;
.source "AdobeUXAssetVideoActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnInfoListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;->onPrepared(Landroid/media/MediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .registers 7
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    const/4 v2, 0x0

    .line 114
    const/16 v0, 0x2bd

    if-ne p2, v0, :cond_10

    .line 115
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_progressBar:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 116
    :cond_10
    const/16 v0, 0x2be

    if-eq p2, v0, :cond_17

    const/4 v0, 0x3

    if-ne p2, v0, :cond_23

    .line 117
    :cond_17
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_progressBar:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 119
    :cond_23
    return v2
.end method
