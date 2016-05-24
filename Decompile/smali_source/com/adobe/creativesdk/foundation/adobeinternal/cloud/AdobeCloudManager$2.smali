.class Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$2;
.super Ljava/lang/Object;
.source "AdobeCloudManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->refreshClouds(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

.field final synthetic val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    .prologue
    .line 498
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$2;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$2;->val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 5
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 501
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$2;->val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    if-eqz v0, :cond_a

    .line 503
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$2;->val$errorBlock:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 509
    :goto_9
    return-void

    .line 507
    :cond_a
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Failed to refresh the cloud manager"

    invoke-static {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    goto :goto_9
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 498
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$2;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
