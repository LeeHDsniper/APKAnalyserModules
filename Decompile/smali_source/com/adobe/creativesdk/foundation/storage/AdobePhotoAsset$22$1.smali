.class Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$1;
.super Ljava/lang/Object;
.source "AdobePhotoAsset.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->onMiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    .prologue
    .line 956
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressNotification(D)V
    .registers 4
    .param p1, "progressPercent"    # D

    .prologue
    .line 959
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onProgress(D)V

    .line 960
    return-void
.end method
