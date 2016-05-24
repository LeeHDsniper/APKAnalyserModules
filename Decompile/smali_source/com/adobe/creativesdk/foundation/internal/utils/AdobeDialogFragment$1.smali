.class Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$1;
.super Ljava/lang/Object;
.source "AdobeDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 82
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->handlePositiveClick()V

    .line 89
    return-void
.end method
