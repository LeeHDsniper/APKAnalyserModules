.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$1;
.super Ljava/lang/Object;
.source "StoreListFragmentAbstract.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->startSetup()V
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
        "Landroid/util/Pair",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Landroid/util/Pair;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, "result":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onSetupDone(Landroid/util/Pair;)V

    .line 125
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 121
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$1;->call(Landroid/util/Pair;)V

    return-void
.end method
