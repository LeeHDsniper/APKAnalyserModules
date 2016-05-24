.class Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;
.super Ljava/lang/Object;
.source "AdobeDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    .line 109
    if-eqz p2, :cond_e

    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 119
    :cond_e
    return-void
.end method
