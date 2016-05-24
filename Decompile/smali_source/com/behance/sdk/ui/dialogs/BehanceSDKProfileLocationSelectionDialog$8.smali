.class Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$8;
.super Ljava/lang/Object;
.source "BehanceSDKProfileLocationSelectionDialog.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->displayCitiesView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    .prologue
    .line 475
    iput-object p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$8;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 5
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 487
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$8;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    # getter for: Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citySearchStrEditText:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->access$500(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 488
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$8;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-virtual {v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 489
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$8;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    # getter for: Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->citySearchStrEditText:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->access$500(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)Landroid/widget/EditText;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 490
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 483
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 479
    return-void
.end method
