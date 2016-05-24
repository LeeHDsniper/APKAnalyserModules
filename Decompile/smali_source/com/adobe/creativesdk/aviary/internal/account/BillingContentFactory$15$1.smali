.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$1;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->call(Lrx/Subscriber;)V
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
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;Lrx/Subscriber;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

    .prologue
    .line 519
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 519
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$1;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 522
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_d

    .line 523
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 525
    :cond_d
    return-void
.end method
