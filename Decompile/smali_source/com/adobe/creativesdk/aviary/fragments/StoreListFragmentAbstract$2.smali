.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$2;
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
        "Ljava/lang/Throwable;",
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
    .line 126
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$2;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 126
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$2;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 6
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 129
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 130
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onError: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 131
    return-void
.end method
