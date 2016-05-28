.class Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$4;
.super Ljava/lang/Object;
.source "BehanceSDKProfileLocationSelectionDialog.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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
    .line 171
    iput-object p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$4;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x0

    .line 175
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$4;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-virtual {v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 176
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$4;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    # getter for: Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->rootView:Landroid/view/View;
    invoke-static {v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->access$200(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 177
    return v3
.end method
