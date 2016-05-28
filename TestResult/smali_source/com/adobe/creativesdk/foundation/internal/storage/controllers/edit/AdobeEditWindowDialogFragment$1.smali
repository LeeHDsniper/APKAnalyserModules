.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$1;
.super Ljava/lang/Object;
.source "AdobeEditWindowDialogFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->createEraseMenuItem()Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;
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
    .line 80
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleClick()V
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->showDeleteAlert()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;)V

    .line 84
    return-void
.end method
