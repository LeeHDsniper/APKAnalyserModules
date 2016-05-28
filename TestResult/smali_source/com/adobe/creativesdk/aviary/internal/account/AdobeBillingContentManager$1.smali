.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$1;
.super Ljava/lang/Object;
.source "AdobeBillingContentManager.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->clearInventory()Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 191
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 191
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$1;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/lang/Object;>;"
    const/4 v4, 0x0

    .line 194
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "clearInventory: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    move-result-object v1

    monitor-enter v1

    .line 196
    :try_start_18
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->clear()V

    .line 197
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mCheckedArray:[Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$302(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;[Ljava/lang/String;)[Ljava/lang/String;

    .line 198
    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_18 .. :try_end_2a} :catchall_32

    .line 199
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 200
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 201
    return-void

    .line 198
    :catchall_32
    move-exception v0

    :try_start_33
    monitor-exit v1
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_32

    throw v0
.end method
