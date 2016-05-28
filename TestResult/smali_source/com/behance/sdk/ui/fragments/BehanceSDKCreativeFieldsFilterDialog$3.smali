.class Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$3;
.super Ljava/lang/Object;
.source "BehanceSDKCreativeFieldsFilterDialog.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->populateListView(Ljava/util/List;Landroid/view/LayoutInflater;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$3;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 7
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
    .line 151
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$3;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->handleCreativeFieldSelection(Landroid/widget/AdapterView;I)V
    invoke-static {v0, p1, p3}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;Landroid/widget/AdapterView;I)V

    .line 152
    return-void
.end method
