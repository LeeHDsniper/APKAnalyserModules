.class Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3$1;
.super Ljava/lang/Object;
.source "AdobeDialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;->onFocusChange(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 114
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    move-object v0, v1

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 115
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 116
    return-void
.end method
