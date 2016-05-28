.class Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$2;
.super Ljava/lang/Object;
.source "AdobeLongClickBaseDialogFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->getSaveToDevice()Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleClick()V
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->handleExportClick()V

    .line 175
    return-void
.end method
