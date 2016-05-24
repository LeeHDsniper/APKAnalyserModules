.class Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$1;
.super Ljava/lang/Object;
.source "AdobeLongClickBaseDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->addItemsToMenuView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;

.field final synthetic val$pos:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;I)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;

    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$1;->val$pos:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->longClickMenuItems:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickBaseDialogFragment$1;->val$pos:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->listener:Lcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;->handleClick()V

    .line 108
    return-void
.end method
