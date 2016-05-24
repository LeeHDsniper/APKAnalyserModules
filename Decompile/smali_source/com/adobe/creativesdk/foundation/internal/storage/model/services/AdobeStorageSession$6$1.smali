.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;
.super Ljava/lang/Object;
.source "AdobeStorageSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;

.field final synthetic val$available:Ljava/lang/Number;

.field final synthetic val$total:Ljava/lang/Number;

.field final synthetic val$used:Ljava/lang/Number;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V
    .registers 5
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;

    .prologue
    .line 809
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;->val$used:Ljava/lang/Number;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;->val$available:Ljava/lang/Number;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;->val$total:Ljava/lang/Number;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 812
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;->val$used:Ljava/lang/Number;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;->val$available:Ljava/lang/Number;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6$1;->val$total:Ljava/lang/Number;

    invoke-interface {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;->onCompletion(Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    .line 813
    return-void
.end method
