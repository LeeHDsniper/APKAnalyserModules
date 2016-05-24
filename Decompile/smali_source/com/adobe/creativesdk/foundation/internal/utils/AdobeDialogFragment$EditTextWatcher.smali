.class Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$EditTextWatcher;
.super Ljava/lang/Object;
.source "AdobeDialogFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EditTextWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$EditTextWatcher;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 62
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 57
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 6
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 50
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$EditTextWatcher;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->handleEditTextBackground()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;)V

    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$EditTextWatcher;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->handleTextChanged()V

    .line 52
    return-void
.end method
