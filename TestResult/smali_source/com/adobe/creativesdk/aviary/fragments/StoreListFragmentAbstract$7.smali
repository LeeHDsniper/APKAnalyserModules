.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$7;
.super Ljava/lang/Object;
.source "StoreListFragmentAbstract.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onStart()V
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
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    .prologue
    .line 191
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$7;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Integer;)V
    .registers 6
    .param p1, "count"    # Ljava/lang/Integer;

    .prologue
    .line 194
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_18

    .line 195
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onServiceFinished: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 196
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$7;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onServiceFinished()V

    .line 199
    :cond_18
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 191
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$7;->call(Ljava/lang/Integer;)V

    return-void
.end method
