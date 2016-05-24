.class final Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$10;
.super Ljava/lang/Object;
.source "AdobePhotoCollectionsDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->getRenditionForCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
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
.field final synthetic val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 2

    .prologue
    .line 277
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$10;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 280
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$10;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local p1    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onError(Ljava/lang/Object;)V

    .line 281
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 277
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$10;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
