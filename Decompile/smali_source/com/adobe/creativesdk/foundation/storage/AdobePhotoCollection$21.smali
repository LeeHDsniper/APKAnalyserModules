.class Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$21;
.super Ljava/lang/Object;
.source "AdobePhotoCollection.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->assetCount(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .prologue
    .line 515
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$21;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$21;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Ljava/lang/Integer;)V
    .registers 3
    .param p1, "requestResult"    # Ljava/lang/Integer;

    .prologue
    .line 518
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$21;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    if-eqz v0, :cond_9

    .line 519
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$21;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 521
    :cond_9
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 515
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$21;->onCompletion(Ljava/lang/Integer;)V

    return-void
.end method
