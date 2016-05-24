.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpTaskHandle.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->notifyProgress(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field final synthetic val$progressPercent:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;I)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;->val$progressPercent:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 92
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;->val$progressPercent:I

    # setter for: Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_progressPercent:I
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->access$002(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;I)I

    .line 94
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->listeners:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->access$100(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_29

    .line 95
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->listeners:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->access$100(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;->val$progressPercent:I

    int-to-double v2, v2

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;->onProgressNotification(D)V

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 96
    :cond_29
    return-void
.end method
