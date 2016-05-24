.class Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$3;
.super Ljava/lang/Object;
.source "GoogleBillingContentManager.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->startSetup()Lrx/Observable;
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
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 147
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$3;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->startSetupInternal(Lrx/Subscriber;)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$300(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Lrx/Subscriber;)V

    .line 151
    return-void
.end method
