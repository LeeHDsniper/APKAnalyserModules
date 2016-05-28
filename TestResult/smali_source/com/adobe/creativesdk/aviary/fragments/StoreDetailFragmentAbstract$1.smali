.class Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$1;
.super Ljava/lang/Object;
.source "StoreDetailFragmentAbstract.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->onServiceCreated(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
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
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 3
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    .line 155
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 151
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$1;->call(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    return-void
.end method
