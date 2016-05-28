.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment$1;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectBaseFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getRightNavigationHandler()Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->nextButtonPressed()V

    .line 113
    return-void
.end method
