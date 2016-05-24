.class Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$1;
.super Ljava/lang/Object;
.source "BehanceSDKImageSelectorDialogFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    .prologue
    .line 237
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 12
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 241
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->onAlbumGridItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    invoke-static/range {v0 .. v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 242
    return-void
.end method
