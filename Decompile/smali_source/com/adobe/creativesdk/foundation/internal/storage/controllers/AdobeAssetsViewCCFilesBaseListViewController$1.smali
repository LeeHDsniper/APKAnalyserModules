.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;
.super Ljava/lang/Object;
.source "AdobeAssetsViewCCFilesBaseListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;->loadAssetRendition(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
        "<[B",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

.field final synthetic val$renditionRequestCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;->val$renditionRequestCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellation()V
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;->val$renditionRequestCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCancellation()V

    .line 88
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 84
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;->onCompletion([B)V

    return-void
.end method

.method public onCompletion([B)V
    .registers 3
    .param p1, "requestResult"    # [B

    .prologue
    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;->val$renditionRequestCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    .line 93
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;->val$renditionRequestCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onError(Ljava/lang/Object;)V

    .line 98
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 84
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 4
    .param p1, "progress"    # D

    .prologue
    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$1;->val$renditionRequestCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onProgress(D)V

    .line 103
    return-void
.end method
