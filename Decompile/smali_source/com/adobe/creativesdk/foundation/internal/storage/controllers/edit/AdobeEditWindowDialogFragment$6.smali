.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$6;
.super Ljava/lang/Object;
.source "AdobeEditWindowDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->showDeleteAlert()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    .prologue
    .line 266
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 269
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 270
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->handleEraseEvent()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;)V

    .line 273
    return-void
.end method
