.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$19;
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
        "Landroid/content/Intent;",
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
    .line 920
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$19;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 923
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$19;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->onBroadcastReceived(Landroid/content/Intent;)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$1100(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Landroid/content/Intent;)V

    .line 924
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 920
    check-cast p1, Landroid/content/Intent;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$19;->call(Landroid/content/Intent;)V

    return-void
.end method
