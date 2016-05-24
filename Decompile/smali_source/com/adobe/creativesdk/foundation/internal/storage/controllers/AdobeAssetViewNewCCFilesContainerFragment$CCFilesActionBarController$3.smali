.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$3;
.super Ljava/lang/Object;
.source "AdobeAssetViewNewCCFilesContainerFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;

.field final synthetic val$searchPlate:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;Landroid/view/View;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;

    .prologue
    .line 566
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$3;->val$searchPlate:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 5
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 575
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 576
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    .line 577
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$3;->val$searchPlate:Landroid/view/View;

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->search_box_appearance_query:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 581
    :goto_18
    return-void

    .line 580
    :cond_19
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$3;->val$searchPlate:Landroid/view/View;

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->search_box_appearance:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_18
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 569
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 572
    return-void
.end method
