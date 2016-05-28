.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 936
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 4
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    .line 939
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .line 948
    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$1200(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 949
    invoke-virtual {v0}, Lrx/Observable;->subscribe()Lrx/Subscription;

    .line 950
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 936
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20;->call(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    return-void
.end method
