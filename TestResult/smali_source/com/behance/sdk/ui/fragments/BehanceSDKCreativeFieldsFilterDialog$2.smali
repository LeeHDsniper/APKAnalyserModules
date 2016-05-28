.class Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$2;
.super Ljava/lang/Object;
.source "BehanceSDKCreativeFieldsFilterDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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
    .line 102
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->notifyListenersAndCloseDialog()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;)V

    .line 107
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->dismiss()V

    .line 108
    return-void
.end method
