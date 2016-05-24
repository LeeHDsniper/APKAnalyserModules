.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$1;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Func2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->startSetup()Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func2",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
        "Landroid/util/Pair",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)Landroid/util/Pair;
    .registers 4
    .param p1, "accountResult"    # Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;
    .param p2, "iabResult"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 159
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .prologue
    .line 155
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;

    check-cast p2, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$1;->call(Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)Landroid/util/Pair;

    move-result-object v0

    return-object v0
.end method
