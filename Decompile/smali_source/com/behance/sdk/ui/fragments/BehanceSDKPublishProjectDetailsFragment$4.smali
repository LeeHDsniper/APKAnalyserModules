.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$4;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectDetailsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 230
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$4;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 233
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$4;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->handleEnableShareOnFacebookBtnClick()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->access$400(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    .line 234
    return-void
.end method
