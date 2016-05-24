.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$4;
.super Ljava/lang/Object;
.source "AdobeStorageSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

.field final synthetic val$sessionClient:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .prologue
    .line 552
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$4;->val$sessionClient:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressNotification(D)V
    .registers 4
    .param p1, "progressPercent"    # D

    .prologue
    .line 555
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$4;->val$sessionClient:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;

    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;->onProgress(D)V

    .line 556
    return-void
.end method
