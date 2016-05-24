.class public interface abstract Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;
.super Ljava/lang/Object;
.source "IAdobeStorageResourceRequestCompletionHandler.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeProgressCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
        ">;",
        "Lcom/adobe/creativesdk/foundation/storage/IAdobeProgressCallback;"
    }
.end annotation


# virtual methods
.method public abstract onComplete(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;)V
.end method
