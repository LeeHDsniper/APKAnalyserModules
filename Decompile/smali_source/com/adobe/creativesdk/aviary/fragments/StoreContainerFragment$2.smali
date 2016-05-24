.class Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;
.super Ljava/lang/Object;
.source "StoreContainerFragment.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->connectIfNecessary()V
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
        "Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
    .registers 3
    .param p1, "service"    # Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .prologue
    .line 136
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->isDetached()Z

    move-result v0

    if-nez v0, :cond_1d

    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->update()V

    .line 140
    :cond_1d
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 133
    check-cast p1, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;->call(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V

    return-void
.end method
