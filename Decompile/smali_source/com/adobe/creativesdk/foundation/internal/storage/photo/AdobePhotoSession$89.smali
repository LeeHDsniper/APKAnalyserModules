.class Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$89;
.super Ljava/lang/Object;
.source "AdobePhotoSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

.field final synthetic val$callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;

.field final synthetic val$error:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    .prologue
    .line 5299
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$89;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$89;->val$callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$89;->val$error:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 5302
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$89;->val$callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$89;->val$error:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 5303
    return-void
.end method
