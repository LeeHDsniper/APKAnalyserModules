.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$3;
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
        "Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;",
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
    .line 135
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$3;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 3
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$3;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    .line 139
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 135
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$3;->call(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    return-void
.end method
